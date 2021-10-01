import 'package:flutter/material.dart';
import 'package:weddin/utils/utils.dart';

class PlageInfo extends StatefulWidget {
  const PlageInfo({Key? key}) : super(key: key);

  @override
  _PlageInfoState createState() => _PlageInfoState();
}

class _PlageInfoState extends State<PlageInfo> {
  @override
  TextStyle cardtexStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.w300);
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plage info'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Main info',
                    style: Utility.titlesStyle,
                  ),
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
                            title: Text('Total plage'),
                            leading: Icon(Icons.label),
                            trailing: Text(
                              '90',
                              style: Utility.titlesStyle,
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
                            title: Text('Total paid'),
                            leading: Icon(Icons.label),
                            trailing: Text(
                              '90',
                              style: Utility.titlesStyle,
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
                            title: Text('Total remained'),
                            leading: Icon(Icons.label),
                            trailing: Text(
                              '90',
                              style: Utility.titlesStyle,
                            ),
                          ),
                        ],
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Other info',
                    style: Utility.titlesStyle,
                  ),
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
                            title: Text('Total Double cards'),
                            leading: Icon(Icons.label),
                            trailing: Text(
                              '90',
                              style: Utility.titlesStyle,
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
                            title: Text('Total single cards'),
                            leading: Icon(Icons.label),
                            trailing: Text(
                              '90',
                              style: Utility.titlesStyle,
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
                              style: Utility.titlesStyle,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
