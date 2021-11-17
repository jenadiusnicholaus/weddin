import 'package:flutter/material.dart';
import 'package:weddin/Screens/event_details.dart';
import 'package:weddin/Screens/contributors.dart';
import 'package:weddin/apiServices/eventgroupdata.dart';
import 'package:weddin/main.dart';
import 'package:weddin/modals/event_groups.dart';
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
          child: FutureBuilder<List<Eventgroup>>(
            future: getData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Eventgroup>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('Loading');

                default:
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('Error: ${snapshot.error}');
                  } else {
                    var groupData = snapshot.data;
                    return ListView.builder(
                        itemCount: groupData!.length,
                        itemBuilder: (cxt, int index) {
                          var groupinfor = groupData[index];
                          return ListTile(
                            onTap: () => Utility.goTo(
                                context, Contributor(eventgroup: groupinfor)),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(groupinfor.imageUrl!),
                            ),
                            title: Text(
                              groupinfor.name!,
                            ),
                            subtitle: Text(groupinfor.description!),
                            trailing:
                                Text(' ${groupinfor.member!.length} forks'),
                          );
                        });
                  }
              }
            },
          )),
    );
  }
}
