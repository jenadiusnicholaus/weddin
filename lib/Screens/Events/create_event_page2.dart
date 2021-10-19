import 'package:flutter/material.dart';

class CreateEventNext extends StatefulWidget {
  const CreateEventNext({Key? key}) : super(key: key);

  @override
  _CreateEventNextState createState() => _CreateEventNextState();
}

class _CreateEventNextState extends State<CreateEventNext> {
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
              const TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Eg: Jenadius\'s wedding',
                  prefixIcon: Icon(Icons.event_available_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                maxLines: 4,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Eg: Jenadius\'s wedding',
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
                                    children: const [
                                      Text('Single'),
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
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
                                    children: const [
                                      Text('Double'),
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
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
        onPressed: () {},
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
