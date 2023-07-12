import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

import '../components/contact/contact_singleinfo_row.dart';

class ContactView extends StatelessWidget {
  final Contact contact;

  ContactView({required this.contact}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Avatar(name: '${contact.name} ${contact.surname}')
          ),
          SizedBox(
            height: 16,
          ),
          Column(children: [
            Text(
              "${contact.name} ${contact.surname}",
              style: Theme.of(context).textTheme.headline1,
            ),
          ]),
          SizedBox(
            height: 28,
          ),
          ContactSingleInfoRow(
            singleInfo: contact.phone,
            singleIcon: Icons.phone_outlined,
          ),
          ContactSingleInfoRow(
            singleInfo: contact.email,
            singleIcon: Icons.email_outlined,
          ),
          ContactSingleInfoRow(
            singleInfo: "${contact.address},\n${contact.city}",
            singleIcon: Icons.location_on_outlined,
          ),
          ContactSingleInfoRow(
            singleInfo: "@${contact.username}",
            singleIcon: Icons.account_circle_outlined,
          )
        ]),
      ),
    );
  }
}
