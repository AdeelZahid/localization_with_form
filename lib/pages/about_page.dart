import 'package:flutter/material.dart';
import 'package:localization_flutter/localization/localization_const.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'about_us')),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Center(
            child: Text(
              getTranslated(context, 'about'),
            ),
          ),
        ),
      ),
    );
  }
}
