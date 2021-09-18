import 'package:flutter/material.dart';
import 'package:weddin/modals/weddings.dart';
import 'package:weddin/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Michango extends StatefulWidget {
  final Weddings weddings;
  final List<User> mchango;
  const Michango({Key? key, required this.mchango, required this.weddings})
      : super(key: key);

  @override
  _MichangoState createState() => _MichangoState();
}

class _MichangoState extends State<Michango> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.weddings.name),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 800,
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
                                    style: Utility.titlesStyle,
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 100,
              color: Utility.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
