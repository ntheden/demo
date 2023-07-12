import 'dart:async';
import 'dart:math';
import 'package:drift/drift.dart' as db;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/chats/chats_entry.dart';
import '../components/drawer/index.dart';
import '../db/crud.dart';
import '../db/db.dart';
import '../router/delegate.dart';
import '../util/date.dart';
import '../util/pair.dart';

class ChatsList extends StatefulWidget {
  final String title;
  final Contact currentUser;
  late StreamController<List<MessageEntry>> stream;
  late StreamSubscription<List<MessageEntry>> subscription;
  List<Pair<Contact, MessageEntry>> conversations = [];
  _ChatsListState? _stateObj;

  ChatsList(this.currentUser, {Key? key, this.title = 'Messages'})
      : super(key: key) {
    stream = StreamController<List<MessageEntry>>();
    stream.addStream(watchUserMessages(currentUser));
    subscription = stream.stream.listen((entries) {
      // TODO: This stream should be from not far back in time and
      // has to add its data to the existing list
      getConversations(entries);
      _stateObj?.toggleState();
    });
  }

  void getConversations(messages) async {
    // sort messages by peer and timestamp.
    // can I use a sort function here
    Map<int, dynamic> peers = {};
    messages.forEach((message) {
      for (final id in [message.fromId, message.toId]) {
        // This does not need to check if the contact is a local user,
        // just check against currentUser, since this is only for
        // drawing the widgets
        if (id == currentUser.id && (message.fromId != message.toId)) {
          // Record this under the remote contact, only
          continue;
        }
        int? timestamp = peers[id]?.timestamp;
        if (timestamp == null || timestamp < message.timestamp) {
          peers[id] = message;
        }
      }
    });

    List<Contact> contacts = await getContacts(peers.keys.toList(), orderingMode: db.OrderingMode.desc);

    List<Widget> entries = [];
    conversations.clear();
    for (final contact in contacts) {
      conversations.add(Pair(contact, peers[contact.id]));
    }
    // descending sort
    conversations.sort((b, a) => a.b.timestamp.compareTo(b.b.timestamp));
  }

  @override
  _ChatsListState createState() {
    _stateObj = _ChatsListState();
    return _stateObj!;
  }
}

class _ChatsListState extends State<ChatsList> {

  bool _stateToggle = false;
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ScrollController _scrollController = ScrollController();

  void toggleState() {
    setState(() => _stateToggle = !_stateToggle);
  }

  @override
  void dispose() {
    widget.stream.close();
    widget.subscription.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
        _scrollController.animateTo(
          //0.0,
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.search_rounded),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
      body: ListView.builder(
        key: _listKey,
        controller: _scrollController,
        itemCount: widget.conversations.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            getChatsEntry(context, index),
            const Divider(height: 0),
          ]);
        },
      ),
      drawer: DrawerScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final routerDelegate = Get.put(MyRouterDelegate());
          routerDelegate.pushPage(name: '/contacts', arguments: {
            'intent': 'chat',
            'user': widget.currentUser,
          });
        },
        child: const Icon(Icons.edit_rounded),
      ),
    );
  }

  ChatsEntry getChatsEntry(BuildContext context, int index) {
    Contact contact = widget.conversations[index].a;
    bool fromMe = true;
    MessageEntry message = widget.conversations[index].b;
    if (message.toId == widget.currentUser.id && message.toId != contact.id) {
      fromMe = false;
    }
    // TODO: This formatting goes in the widget definition
    return ChatsEntry(
      key: UniqueKey(),
      name: contact.name,
      npub: contact.npub,
      picture: NetworkImage(
        "https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg",
      ),
      //type: "group",
      //sending: message.from?.id == user.id ? "You" : "Them",
      //lastTime: formattedDate('hh:mm', message.timestamp),
      lastTime: timezoned(message.timestamp).formattedDate(),
      //seeing: 2,
      lastMessage: message.content,
      currentUser: widget.currentUser,
      peer: contact,
      fromMe: fromMe,
    );
  }
}

