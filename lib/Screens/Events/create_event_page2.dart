import 'package:flutter/material.dart';

class CreateEventNext extends StatefulWidget {
  const CreateEventNext({Key? key}) : super(key: key);

  @override
  _CreateEventNextState createState() => _CreateEventNextState();
}

class _CreateEventNextState extends State<CreateEventNext> {
  String? selectedLocation = 'Weeding';
  final List<String>? _locations = [
    'Weeding',
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
          height: 800,
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
                  value: selectedLocation,
                  icon: const Icon(Icons.arrow_circle_down),
                  iconSize: 20,
                  elevation: 1,
                  underline: Container(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedLocation = newValue;
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
            ],
          ),
        ),
      ),
    );
  }
}
