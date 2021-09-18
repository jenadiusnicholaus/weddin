import 'package:flutter/material.dart';
import 'package:weddin/Screens/michango.dart';
import 'package:weddin/modals/weddings.dart';
import 'package:weddin/utils/utils.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Weddings extends StatefulWidget {
  const Weddings({Key? key}) : super(key: key);

  @override
  _WeddingsState createState() => _WeddingsState();
}

class _WeddingsState extends State<Weddings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 800,
        width: double.infinity,
        child: ListView.builder(
            itemCount: weddings.length,
            itemBuilder: (cxt, int index) {
              var myweddings = weddings[index];
              return Card(
                child: ExpansionTile(
                  title: Row(children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(myweddings.imageUrl),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myweddings.name.toUpperCase(),
                          style: Utility.titlesStyle,
                        ),
                        Text(
                          "Michango : ${myweddings.michango.length.toString()}",
                        ),
                      ],
                    )
                  ]),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        myweddings.description,
                        style: Utility.descStyle,
                      ),
                      trailing: TextButton(
                        onPressed: () => Utility.goTo(
                            context, Michango(mchango: myweddings.michango,weddings: myweddings,)),
                        child: const Text('Michango'),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
