import 'package:Shardha_Shinkara_Seva/utils/Constants.dart';
import 'package:Shardha_Shinkara_Seva/utils/ThemeStyle.dart';
import "package:flutter/material.dart";

import 'HomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedPage extends StatefulWidget {
  static const String routeName = "/finished";
  @override
  _FinishedPageState createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
        // creates the app bar
        appBar: _appBar(),
        body: Stack(
          children: <Widget>[
            // screen body
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5, left: 20, right: 20),
              child: new Column(
                children: <Widget>[
                  // header
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Center(
                      child: Text(
                        "Recipient Input Form",
                        style: ThemeStyle.heading,
                      ),
                    ),
                  ),
                  // green check mark
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),
                  // major text
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Thank You",
                      style: ThemeStyle.heading,
                    ),
                  ),
                  // smaller text
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        child: Text(
                            "Your information was submitted successfully.",
                            style: ThemeStyle.formLabelText),
                      ),
                    ),
                  ),
                  // more small text
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        child: Text(
                            "Please click below to submit another response.",
                            style: ThemeStyle.formLabelText),
                      ),
                    ),
                  ),
                  // height: 15 for right beneath text
                  new SizedBox(height: 120.0),
                  // button!
                  new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      // navigation
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    child: Text(
                      "INPUT FORM",
                      style: ThemeStyle.buttonLabelText,
                    ),
                    color: ThemeStyle.primColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

// app bar same as input form page
Widget _appBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(75),
          height: ScreenUtil().setHeight(75),
          margin: ThemeStyle.marginALL,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(Constants.LOGO_IMAGE_PATH),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          'Shardha Shinkara Seva',
          style: ThemeStyle.appBarStyle,
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          color: ThemeStyle.whiteColor,
          iconSize: 40,
          onPressed: () {},
        ),
      ],
    ),
    backgroundColor: ThemeStyle.secondaryMainColor,
    centerTitle: true,
  );
}
