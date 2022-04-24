import 'package:contact_list/src/homepage/contact_helper.dart';
import 'package:contact_list/src/homepage/contact_type.dart';
import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    contacts.add(Contact(
        name: "João", telephone: "99999-9999", type: ContactType.PHONE));
    contacts.add(Contact(
        name: "Lucas", telephone: "99999-8888", type: ContactType.PHONE));
    contacts.add(Contact(
        name: "Maria", telephone: "99999-7777", type: ContactType.FAVORITE));
    contacts.add(Contact(
        name: "Thiago", telephone: "3333-6666", type: ContactType.HOME));
    contacts.add(Contact(
        name: "Mariana", telephone: "3333-5555", type: ContactType.HOME));
    contacts.add(Contact(
        name: "Beatriz", telephone: "99999-4444", type: ContactType.FAVORITE));
    contacts.add(
        Contact(name: "Liz", telephone: "3333-3333", type: ContactType.WORK));
    contacts.add(Contact(
        name: "Matheus", telephone: "3333-2222", type: ContactType.WORK));

    contacts.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              child: ContactHelper.getIconByContactType(contact.type),
              backgroundColor: Colors.blue[200],
            ),
            title: Text(contact.name),
            subtitle: Text(contact.telephone),
            trailing: IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {},
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: contacts.length,
      ),
    );
  }
}
