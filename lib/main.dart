// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weddin/Screens/Events/create_event_page2.dart';
import 'package:weddin/Screens/Events/events.dart';
import 'package:weddin/Screens/contact_list.dart';
import 'package:weddin/Screens/contact_page.dart';
import 'package:weddin/Screens/register.dart';
import 'package:weddin/Screens/setteing.dart';

import 'package:weddin/utils/utils.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  String token = '';
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final dynamic savedThemeMode;
  final String? token;
  const MyApp({Key? key, this.savedThemeMode, this.token}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Utility.colorCustom,
        accentColor: Utility.colorCustom,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Utility.colorCustom,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: token == null
            ? Register()
            : MyHomePage(
                title: 'entlife',
              ),

        // initialRoute: '/contactList',
        routes: {
          '/createEventnext': (context) => CreateEventNext(),
          // '/contactList': (context) => ContactListPage(),
          '/contact': (context) => ContactPage(),
          // '/editContact': (context) => EditContactPage(),
        },
      ),
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
    Tab(text: "Events"),
    Tab(text: "Looking for"),
    Tab(text: "Inbox"),
  ];

  @override
  void initState() {
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

  _switchBtnTabs(cxt) async {
    switch (_controller.index) {
      case 0:
        Utility.goTo(cxt, ContactListPage());
        break;
      case 1:
        print('tab2');
        break;
      case 2:
        print('tab3');
        break;
      case 3:
        print('tab3');
        break;

      default:
    }
  }

  _showPopupMenu(context) {
    return showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(700, 0, 2, 300),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text("Group info"),
        ),
        PopupMenuItem(
          value: 2,
          child: InkWell(
              onTap: () => Utility.goTo(context, Setting()),
              child: Text("Setting")),
        ),
        PopupMenuItem(
          value: 3,
          child: InkWell(onTap: () {}, child: Text("plage info")),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null

      if (value != null) print(value);
    });
  }

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
          IconButton(
              onPressed: () => _showPopupMenu(context),
              icon: Icon(Icons.more_horiz))
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: TabBarView(controller: _controller, children: [
        Events(),
        Column(
          children: [
            Center(child: Text(_selectedIndex.toString())),
          ],
        ),
        Column(
          children: [
            Center(child: Text(_selectedIndex.toString())),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _switchBtnTabs(context),
        tooltip: _selectedIndex == 0 ? 'create wedding group' : 'others',
        child: _selectedIndex == 0 ? const Icon(Icons.add) : Icon(Icons.inbox),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
