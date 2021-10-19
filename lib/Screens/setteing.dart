import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:weddin/utils/utils.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isLighttheme = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Column(
            children: [
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
                          title: Text('Security'),
                          subtitle: Text(
                              ' This group is made to accomplish jinadius'),
                          leading: Icon(Icons.security_outlined),
                          trailing: Text(
                            '',
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
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 33,
                              ),
                              const Text(
                                'Theme',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 170,
                              ),
                              FlutterSwitch(
                                // showOnOff: true,
                                height: 30,
                                width: 60,
                                activeIcon: const Icon(
                                  Icons.nightlight,
                                  color: Colors.black,
                                ),
                                inactiveIcon: const Icon(Icons.light_mode),
                                activeColor: Utility.titlesColor,
                                // activeTextColor: Colors.white,
                                // inactiveTextColor: Colors.black,
                                value: isLighttheme,
                                onToggle: (val) {
                                  if (isLighttheme) {
                                    AdaptiveTheme.of(context).setLight();
                                  } else {
                                    AdaptiveTheme.of(context).setDark();
                                  }

                                  // AdaptiveTheme.of(context).toggleThemeMode();
                                  setState(() {
                                    isLighttheme = val;
                                  });
                                },
                              ),
                            ],
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
                          title: Text('My account'),
                          leading: Icon(Icons.account_box_outlined),
                          trailing: Text(
                            '',
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
