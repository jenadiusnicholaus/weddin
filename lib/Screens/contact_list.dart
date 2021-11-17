import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:weddin/utils/utils.dart';
import 'package:grouped_list/grouped_list.dart';

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
  bool isSearching = false;
  static PageController? controller;

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

  Widget _selectMember() {
    return ListView.builder(
      itemCount: postingList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        var selected = postingList[index];
        return Container(
          width: 70,
          height: 50,
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectList.removeWhere(
                                  (element) => element == selected['id']);
                              postingList.removeWhere(
                                  (element) => element['id'] == selected['id']);
                            })
                          },
                          child: Container(
                            height: 19,
                            width: 18,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: const Center(
                              child: Text('x'),
                            ),
                          ),
                        ))
                  ],
                ),
                Text(postingList[index]['displayingname'].toString().length < 5
                    ? '${postingList[index]['displayingname'].substring(0, 4)}'
                    : '${postingList[index]['displayingname'].substring(0, 5)}..')
              ],
            ),
          ),
        );
      },
    );
  }

  _createSeparator(contact) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 10),
          child: Divider(
            height: 1.0,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          decoration: const BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(0))),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
              child: Text(
                contact.toString().toUpperCase(),
                style: const TextStyle(
                  height: 1.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        //subtitle: const Text('None'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  onChanged: (text) async {
                    final result = await FlutterContacts.getContact(text);
                    print('First text field: $result');

                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                    ),
                    // border: OutlineInputBorder(),
                  ),
                )
              : const Text('Select Friends'),
          actions: [
            !isSearching
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    },
                    icon: const Icon(Icons.search_outlined))
                : const Text(''),
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 800,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Column(
                children: [
                  postingList.isNotEmpty
                      ? Container(
                          height: 70,
                          // color: Colors.red,
                          child: _selectMember(),
                        )
                      : Text(''),
                  Container(
                    height: 700,
                    child: _body(),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (postingList.isNotEmpty) {
              Utility.saveEventMemberToprefs(
                  list: postingList, key: 'event_member');
              Navigator.of(context).pushNamed('/createEventnext');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(" Select atleast one member"),
              ));
            }
          },
          child: const Icon(Icons.arrow_right),
        ),
      );

  Widget _body() {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return GroupedListView<Contact, String>(
      elements: _contacts!,
      groupBy: (Contact contact) => contact.displayName.substring(0, 1),
      groupHeaderBuilder: (Contact contact) =>
          _createSeparator(contact.displayName.substring(0, 1)),
      indexedItemBuilder: (BuildContext context, Contact contact, int index) {
        return GestureDetector(
          // onTap: () => _setNavigation(appointment),
          child: _createDataRow(contact),
        );
      },
      order: GroupedListOrder.ASC,
      controller: controller, // optional
    );
  }

  _createDataRow(contact) {
    return ListTile(
        // selected: isSelected,
        leading: Utility.avatar(contact, 15.0),
        title: Text(contact.displayName),
        trailing: selectList.contains(contact.id)
            ? const Icon(Icons.check_circle)
            : const Icon(Icons.check_box_outline_blank),
        onLongPress: () => {
              print(_phone),
              Navigator.of(context).pushNamed('/contact', arguments: contact)
            },
        onTap: () async {
          if (!selectList.contains(contact.id)) {
            final fullContact = await FlutterContacts.getContact(contact.id);

            setState(() {
              selectList.add(
                contact.id,
              );
              postingList.add({
                'id': contact.id,
                'Phone': fullContact!.phones.first.number.toString(),
                'displayingname': contact.displayName
              });
              _phone = fullContact.phones.first.normalizedNumber.isNotEmpty
                  ? fullContact.phones.first.normalizedNumber.toString()
                  : 'No phone number';
            });

            print(prettyJson(postingList));
          } else {
            setState(() {
              selectList.removeWhere((element) => element == contact.id);
              postingList.removeWhere((element) => element['id'] == contact.id);
            });
            print(prettyJson(postingList));
          }
        }
        //     Navigator.of(context).pushNamed('/contact', arguments: contact),
        );
  }
}
