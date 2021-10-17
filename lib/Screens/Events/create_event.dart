import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:weddin/Screens/contact_list.dart';

// EVENT NAME
// EVENT CATEGORY
// EVENT MEMBERS
//

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Friends'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 800,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Column(
              children: [
                isSearching
                    ? TextField(
                        onChanged: (text) {
                          print('First text field: $text');

                          setState(() {
                            isSearching = !isSearching;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search_outlined),
                          border: OutlineInputBorder(),
                        ),
                      )
                    : Container(height: 550, child: ContactListPage()),
                TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/createEventnext'),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
