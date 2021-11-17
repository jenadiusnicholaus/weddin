import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class LookingFor extends StatefulWidget {
  const LookingFor({Key? key}) : super(key: key);

  @override
  _LookingForState createState() => _LookingForState();
}

class _LookingForState extends State<LookingFor> {
  int? index = 0;
  var active = 0;
  List lookingCategories = [
    {
      'name': 'Mc',
      'items': [
        {"name": 'Mc Pili pili', "images": 'images/mc.jpeg'},
        {"name": 'Mc Pili pili', "images": 'images/mc.jpeg'},
        {"name": 'Mc Pili pili', "images": 'images/mc.jpeg'},
        {"name": 'Mc Pili pili', "images": 'images/mc.jpeg'}
      ]
    },
    {
      'name': 'Kumbi',
      'items': [
        {"name": 'Suma jkt', "images": 'images/ukumbi.jpeg'}
      ]
    },
    {
      'name': 'Photographer',
      'items': [
        {"name": 'Lucamba', "images": 'images/mc.jpeg'}
      ]
    },
    {
      'name': 'DJ',
      'items': [
        {"name": 'Om', "images": 'images/dj.jpeg'}
      ]
    },
    {
      'name': 'Wedding car',
      'items': [
        {"name": 'Mc Pili pili', "images": 'images/wedding_car.jpeg'}
      ]
    },
    {
      'name': 'Youtube streamer',
      'items': [
        {"name": 'Mc Pili pili', "images": 'images/mc.jpeg'}
      ]
    }
  ];

  Widget _getCategoryitemList(int index) {
    var items = lookingCategories[index]['items'] as List;
    return Container(
        height: 700,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        // color: Colors.red,
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 20.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Expanded(
                      flex: 9,
                      child: Stack(
                        children: [
                          Image.asset(items[index]['images']),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Badge(
                                toAnimate: false,
                                shape: BadgeShape.square,
                                badgeColor: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8),
                                badgeContent: Text(
                                  items[index]['name'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      )),
                  ListTile(
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
                    onTap: () {},
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
        height: 800,
        child: Column(
          children: [
            Container(
              height: 30.0,
              child: ListView.builder(
                itemCount: lookingCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index1) {
                  var category = lookingCategories[index1];

                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 3),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          index = index1;
                          active = index1;
                        });
                      },
                      child: Badge(
                        toAnimate: false,
                        shape: BadgeShape.square,
                        badgeColor:
                            active == index1 ? Colors.white : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        badgeContent: Center(
                            child: Text(category['name'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400))),
                      ),
                    ),
                  );
                },
              ),
            ),
            _getCategoryitemList(index!)
          ],
        ),
      ),
    );
  }
}
