import 'package:flutter/material.dart';
import 'package:weddin/Screens/plage_info.dart';
import 'package:weddin/modals/weddings.dart';
import 'package:weddin/utils/utils.dart';

class Michango extends StatefulWidget {
  final Weddings weddings;
  final List<User> mchango;
  const Michango({Key? key, required this.mchango, required this.weddings})
      : super(key: key);

  @override
  _MichangoState createState() => _MichangoState();
}

class _MichangoState extends State<Michango> {
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
        title: Text(widget.weddings.name),
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
                  itemCount: widget.mchango.length,
                  itemBuilder: (cxt, int index) {
                    var mich = widget.mchango[index];
                    return Card(
                      child: ExpansionTile(
                        leading: CircleAvatar(
                            child: Text(
                          mich.name.substring(0, 1),
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
                            Text(
                              " ${mich.kiasi}",
                            ),
                            if (mich.kamaliza)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green[900],
                                ),
                              )
                            else
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text('Baki :'),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text('${mich.baki}')
                                ],
                              )
                          ],
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          ListTile(
                            leading: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.message_rounded),
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Center(
                              child: Text(
                                "${mich.phone}",
                                style: Utility.descStyle,
                              ),
                            ),
                            trailing: IconButton(
                              color: Theme.of(context).primaryColor,
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
