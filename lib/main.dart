import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'Shahrukh Khan',
      email: 'shahrukh@example.com',
      phoneNumber: '01712345678',
    ),
    Contact(
      name: 'Saif Ali Khan',
      email: 'saifali@example.com',
      phoneNumber: '01912345678',
    ),
    Contact(
      name: 'Kajol',
      email: 'kajol@example.com',
      phoneNumber: '01812345678',
    ),
  ];

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Email: ${contact.email}'),
                SizedBox(height: 8.0),
                Text('Phone: ${contact.phoneNumber}'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Contacts')),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.email),
            onTap: () {
              _showContactDetails(context, contact);
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Contact List',
    home: ContactListScreen(),
  ));
}
