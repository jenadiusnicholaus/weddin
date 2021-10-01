import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  static MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
  static const primaryColor = Color(0xFFFFEBEE);
  static const titlesColor = Colors.pink;
  static const descsColor = Colors.grey;
  static const titlesStyle = TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.w500, color: titlesColor);
  static const descStyle =
      TextStyle(fontWeight: FontWeight.w700, color: descsColor);

  static goTo(BuildContext cxt, Widget page) {
    Navigator.push(cxt, MaterialPageRoute(builder: (cxt) => page));
  }

  static Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
