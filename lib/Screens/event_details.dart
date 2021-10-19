import 'package:flutter/material.dart';

import 'package:weddin/utils/utils.dart';

import 'package:flutter_switch/flutter_switch.dart';

class EventgroupInfo extends StatefulWidget {
  final dynamic wedding;

  const EventgroupInfo({Key? key, required this.wedding}) : super(key: key);

  @override
  _GroupInfoState createState() => _GroupInfoState();
}

class _GroupInfoState extends State<EventgroupInfo> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(onTap: () => {}, child: Text(widget.wedding.name)),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.wedding.imageUrl))),
                width: double.infinity,
              ),
              Card(
                elevation: 1,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 80,
                    width: double.infinity,
                    child: ListView(
                      children: const [
                        ListTile(
                          title: Text('Description'),
                          subtitle: Text(
                              ' This group is made to accomplish jinadius'),
                          leading: Icon(Icons.description),
                          trailing: Text(
                            '90',
                          ),
                        ),
                      ],
                    )),
              ),
              Card(
                elevation: 1,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 33,
                              ),
                              const Text(
                                'Notification',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 170,
                              ),
                              FlutterSwitch(
                                showOnOff: true,
                                activeColor: Utility.titlesColor,
                                activeTextColor: Colors.white,
                                inactiveTextColor: Colors.black,
                                value: isSwitched,
                                onToggle: (val) {
                                  setState(() {
                                    isSwitched = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Card(
                elevation: 1,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 80,
                    width: double.infinity,
                    child: ListView(
                      children: const [
                        ListTile(
                          title: Text('Total participants'),
                          leading: Icon(Icons.label),
                          trailing: Text(
                            '90',
                          ),
                        ),
                      ],
                    )),
              ),
              Card(
                elevation: 1,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 80,
                    width: double.infinity,
                    child: ListView(
                      children: const [
                        ListTile(
                          title: Text('Member list'),
                          leading: Icon(Icons.label),
                          trailing: Text(
                            '90',
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
