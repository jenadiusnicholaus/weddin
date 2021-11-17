import 'dart:convert';

import 'package:flutter_contacts/properties/group.dart';
import 'package:weddin/modals/event_groups.dart';
import 'package:weddin/utils/utils.dart';

Future<List<Eventgroup>> getData() async {
  String? id = await Utility.getGroupId();
  String? name = await Utility.getGroupName();
  String? desc = await Utility.getGroupDesc();
  String? category = await Utility.getGroupCategory();
  String members = await Utility.getEventMemberfromPrefs('event_member');
  print(members);
  Map<String, dynamic> myjson = {
    'groups': [
      {
        'id': id,
        'name': name,
        'description': desc,
        'category': category,
        'image': 'images/pp.jpeg',
        'members': jsonDecode(members)
      }
    ]
  };
  var data = myjson['groups'] as List;
  List<Eventgroup>? eventgroup =
      data.map((e) => Eventgroup.fromJson(e)).toList();

  try {
    print(eventgroup.length);
  } catch (e, s) {
    print(e);
    print(s);
  }
  return eventgroup;
}
