import 'package:flutter/material.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:uuid/uuid.dart';
import 'package:weddin/apiServices/eventgroupdata.dart';
import 'package:weddin/modals/event_groups.dart';
import 'package:weddin/utils/utils.dart';
import 'package:uuid/uuid_util.dart';

class CreateEventNext extends StatefulWidget {
  const CreateEventNext({Key? key}) : super(key: key);

  @override
  _CreateEventNextState createState() => _CreateEventNextState();
}

class _CreateEventNextState extends State<CreateEventNext> {
  final TextEditingController? egroupNameController = TextEditingController();

  final TextEditingController? egroupDesccontroller = TextEditingController();
  final TextEditingController? singleController = TextEditingController();

  final TextEditingController? doubleController = TextEditingController();
  @override
  void dispose() {
    egroupNameController!.dispose();
    egroupDesccontroller!.dispose();
    singleController!.dispose();
    doubleController!.dispose();
    super.dispose();
  }

  String? selectedEventCategory = 'Wedding';
  final List<String>? _locations = [
    'Wedding',
    'Birth day',
    'Anversary',
    'Graduation'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: egroupNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Eg: Jenadius\'s wedding',
                  prefixIcon: Icon(Icons.event_available_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: egroupDesccontroller,
                maxLines: 4,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter Event goup description',
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('Select Event Category'),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: DropdownButton<String>(
                  hint: const Text('Select Event Category'),
                  isExpanded: true,
                  value: selectedEventCategory,
                  icon: const Icon(Icons.arrow_circle_down),
                  iconSize: 20,
                  elevation: 1,
                  underline: Container(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedEventCategory = newValue;
                    });
                  },
                  items: List.generate(
                    _locations!.length,
                    (index) => DropdownMenuItem(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_locations![index]),
                      ),
                      value: _locations![index],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              selectedEventCategory == 'Wedding'
                  ? Column(
                      children: [
                        const Text(
                            'For Weeding Category you may need to specifiey what is \'Single\'  and \'Double\'  cart will be'),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 80,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Single'),
                                      TextField(
                                        controller: singleController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          hintText: 'Eg: 50000',
                                          prefixIcon: Icon(
                                              Icons.event_available_outlined),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Double'),
                                      TextField(
                                        controller: doubleController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          hintText: 'Eg: 100000',
                                          prefixIcon: Icon(
                                              Icons.event_available_outlined),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const Text('')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var members = await Utility.getEventMemberfromPrefs('event_member');

          // print("""
          // name : ${egroupNameController!.text}
          // Desc : ${egroupDesccontroller!.text}
          // group category: $selectedEventCategory
          // single : ${singleController!.text}
          // double : ${doubleController!.text}
          // members:$members

          // """);
          var uuid = Uuid();
          var id = uuid.v1();
          Map<String, dynamic> json = {
            'id': id,
            'name': egroupNameController!.text,
            'description': egroupDesccontroller!.text,
            'image': null,
            'members': members
          };

          Utility.saveOnShared(key: 'groupid', value: id);
          Utility.saveOnShared(
              key: 'groupname', value: egroupNameController!.text);
          print(json);
          Utility.saveOnShared(
              key: 'groupdesc', value: egroupDesccontroller!.text);
          Utility.saveOnShared(
              key: 'groupcategory', value: selectedEventCategory);

          getData();
        },
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
