import 'package:flutter/material.dart';
import 'package:weddin/Screens/contribution_info.dart';
import 'package:weddin/Screens/event_details.dart';

import 'package:weddin/modals/event_groups.dart';
import 'package:weddin/utils/utils.dart';
import 'package:badges/badges.dart';

class Contributor extends StatefulWidget {
  final Eventgroup eventgroup;

  const Contributor({Key? key, required this.eventgroup}) : super(key: key);

  @override
  _ContributorState createState() => _ContributorState();
}

class _ContributorState extends State<Contributor> {
  _showPopupMenu() async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(700, 80, 2, 100),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text("Group info"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("Setting"),
        ),
        PopupMenuItem(
          value: 3,
          child: InkWell(
              onTap: () => Utility.goTo(context, PlageInfo()),
              child: Text("plage info")),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null

      if (value != null) print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () => Utility.goTo(
                context, EventgroupInfo(eventgroup: widget.eventgroup)),
            child: Text(widget.eventgroup.name!)),
        actions: [
          IconButton(
            onPressed: () async => await _showPopupMenu(),
            icon: const Icon(Icons.more_horiz),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 600,
              child: ListView.builder(
                  itemCount: widget.eventgroup.member!.length,
                  itemBuilder: (cxt, int index) {
                    var mich = widget.eventgroup.member![index];
                    return Card(
                      child: ExpansionTile(
                        textColor: Colors.grey,
                        leading: Badge(
                            position: BadgePosition.topEnd(top: 0, end: 2),
                            elevation: 0,
                            shape: BadgeShape.circle,
                            badgeColor: Colors.green,
                            borderSide: BorderSide(color: Colors.black),
                            child: const Icon(
                              Icons.person,
                              color: Colors.green,
                              size: 30,
                            )),

                        title: Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${mich.name} :",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ]),

                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              " ${"mich.amount"}",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                SizedBox(
                                  width: 6,
                                ),
                                Text('Baki :'),
                                SizedBox(
                                  width: 6,
                                ),
                                Text('${"mich.remainedAmount"}')
                              ],
                            )
                          ],
                        ),

                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          ListTile(
                            selectedTileColor: Colors.grey,
                            leading: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.message_rounded),
                              // color: Theme.of(context).primaryColor,
                            ),
                            title: Center(
                              child: Text(
                                mich.phone!,
                                style: Utility.descStyle,
                              ),
                            ),
                            trailing: IconButton(
                              // color: Theme.of(context).primaryColor,
                              onPressed: () async =>
                                  await Utility.makePhoneCall(
                                      'tel:${mich.phone}'),
                              icon: const Icon(Icons.phone),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: const Text("Weka mchnago wako hapa",
                        style: Utility.titlesStyle),
                    content: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Eg: 2000000',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      TextButton(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          print('Cancel');
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text("Submit"),
                        onPressed: () {
                          print('submt the plage');
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
          tooltip: 'plage',
          child: const Text('plage')),
    );
  }
}
