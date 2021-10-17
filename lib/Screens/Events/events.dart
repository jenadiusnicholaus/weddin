import 'package:flutter/material.dart';
import 'package:weddin/Screens/event_details.dart';
import 'package:weddin/Screens/contributors.dart';
import 'package:weddin/main.dart';
import 'package:weddin/modals/weddings.dart';
import 'package:weddin/utils/utils.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _WeddingsState createState() => _WeddingsState();
}

class _WeddingsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 800,
        width: double.infinity,
        child: ListView.builder(
            itemCount: weddings.length,
            itemBuilder: (cxt, int index) {
              var myweddings = weddings[index];
              return Card(
                child: ListTile(
                  onTap: () => Utility.goTo(
                      context,
                      Michango(
                        mchango: myweddings.michango,
                        weddings: myweddings,
                      )),
                  title: Row(children: [
                    InkWell(
                      onTap: () =>
                          Utility.goTo(context, GroupInfo(wedding: myweddings)),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(myweddings.imageUrl),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myweddings.name.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Michango : ${myweddings.michango.length.toString()}",
                        ),
                      ],
                    )
                  ]),
                ),
              );
            }),
      ),
    );
  }
}