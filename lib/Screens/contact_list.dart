import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:weddin/utils/utils.dart';

// import 'package:flutter_contacts_example/util/avatar.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage>
    with AfterLayoutMixin<ContactListPage> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  var isSelected = false;
  var mycolor = Colors.white;
  var selectList = [];
  var postingList = [];
  var _phone;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission()) {
      setState(() {
        _contacts = null;
        _permissionDenied = true;
      });
      return;
    }

    await _refetchContacts();

    // Listen to DB changes
    FlutterContacts.addListener(() async {
      print('Contacts DB changed, refecthing contacts');
      await _refetchContacts();
    });
  }

  Future _refetchContacts() async {
    // First load all contacts without photo
    await _loadContacts(false);

    // Next with photo
    await _loadContacts(true);
  }

  Future _loadContacts(bool withPhotos) async {
    final contacts = withPhotos
        ? (await FlutterContacts.getContacts(withThumbnail: true)).toList()
        : (await FlutterContacts.getContacts()).toList();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        child: _body(),
      );

  Widget _body() {
    if (_permissionDenied) {
      return Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) {
          final contact = _contacts![i];
          return ListTile(
              // selected: isSelected,
              leading: Utility.avatar(contact, 15.0),
              title: Text(contact.displayName),
              trailing: selectList.contains(contact.id)
                  ? const Icon(Icons.check_circle)
                  : const Icon(Icons.check_box_outline_blank),
              onLongPress: () => {
                    print(_phone),
                    Navigator.of(context)
                        .pushNamed('/contact', arguments: contact)
                  },
              onTap: () async {
                if (!selectList.contains(contact.id)) {
                  final fullContact =
                      await FlutterContacts.getContact(contact.id);

                  setState(() {
                    selectList.add(
                      contact.id,
                    );
                    postingList.add({
                      'id': contact.id,
                      'Phone': fullContact!.phones.first.normalizedNumber
                    });
                    _phone = fullContact
                            .phones.first.normalizedNumber.isNotEmpty
                        ? fullContact.phones.first.normalizedNumber.toString()
                        : 'No phone number';
                  });

                  print(prettyJson(postingList));
                } else {
                  setState(() {
                    selectList.removeWhere((element) => element == contact.id);
                    postingList
                        .removeWhere((element) => element['id'] == contact.id);
                  });
                  print(prettyJson(postingList));
                }
              }
              //     Navigator.of(context).pushNamed('/contact', arguments: contact),
              );
        });
  }
}
