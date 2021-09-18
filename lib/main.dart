// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weddin/Screens/michango.dart';
import 'package:weddin/Screens/weddings.dart';
import 'package:weddin/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'weddIn',
      theme: ThemeData(
        primarySwatch: Utility.colorCustom,
      ),
      home: MyHomePage(title: 'WeddIn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _tablist = [
    Tab(text: "Weddings"),
    Tab(text: "Inbox"),
    Tab(text: "Calls"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: _tablist.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  _switchBtnTabs() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // ignore: prefer_const_constructors
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: _tablist,
        ),

        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.more_horiz))
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: TabBarView(controller: _controller, children: [
        Weddings(),
        Center(child: Text(_selectedIndex.toString())),
        Center(child: Text(_selectedIndex.toString())),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchBtnTabs,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
