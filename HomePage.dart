import 'package:Shardha_Shinkara_Seva/pages/FinishedPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/ThemeStyle.dart';
import '../utils/Constants.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  // variables for saving information so can send it later
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String firstName, lastName, cardNumber, city, state, phoneNumber;

  @override
  Widget build(BuildContext context) {
    // necessary I think, gets ride of debug banner
    WidgetsApp.debugAllowBannerOverride = false;
    ScreenUtil.init();
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
    return MaterialApp(
      home: new Scaffold(
        appBar: _appBar(),
        resizeToAvoidBottomPadding: true,
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: _formUI(),
            ),
          ),
        ),
      ),
    );
  }

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

  ///login form -- includes header, input options, and button
  Widget _formUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 20, right: 20),
      child: new Column(
        children: <Widget>[
          // header
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
              child: Text(
                "Recipient Input Form",
                style: ThemeStyle.heading,
              ),
            ),
          ),
          //first name
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: new InputDecoration(
                hintText: 'First Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.greyColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                //label text details
                alignLabelWithHint: true,
                labelStyle: ThemeStyle.formLabelText,
                //icon details
                prefixIcon: Icon(
                  Icons.person,
                  size: ThemeStyle.iconSize,
                  color: ThemeStyle.blackColor,
                ),
                //details when selecting that input box
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.primColor,
                    width: 2,
                  ),
                  borderRadius: ThemeStyle.borderRadiusStyle,
                ),
                //filling in the color of the inside input box
                fillColor: ThemeStyle.lightGreyColor,
                filled: true,
              ),
              validator: validateName,
              onSaved: (String val) {
                firstName = val;
              },
            ),
          ),
          // last name
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: new InputDecoration(
                hintText: 'Last Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.greyColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                //label text details
                alignLabelWithHint: true,
                labelStyle: ThemeStyle.formLabelText,
                //icon details
                prefixIcon: Icon(
                  Icons.person,
                  size: ThemeStyle.iconSize,
                  color: ThemeStyle.blackColor,
                ),
                //details when selecting that input box
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.primColor,
                    width: 2,
                  ),
                  borderRadius: ThemeStyle.borderRadiusStyle,
                ),
                //filling in the color of the inside input box
                fillColor: ThemeStyle.lightGreyColor,
                filled: true,
              ),
              validator: validateName,
              onSaved: (String val) {
                lastName = val;
              },
            ),
          ),
          // card number
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: new InputDecoration(
                hintText: 'Adhar Pan Card Number',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.greyColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                //label text details
                alignLabelWithHint: true,
                labelStyle: ThemeStyle.formLabelText,
                //icon details
                prefixIcon: Icon(
                  Icons.account_balance_wallet,
                  size: ThemeStyle.iconSize,
                  color: ThemeStyle.blackColor,
                ),
                //details when selecting that input box
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.primColor,
                    width: 2,
                  ),
                  borderRadius: ThemeStyle.borderRadiusStyle,
                ),
                //filling in the color of the inside input box
                fillColor: ThemeStyle.lightGreyColor,
                filled: true,
              ),
              validator: validateCard,
              onSaved: (String val) {
                cardNumber = val;
              },
            ),
          ),
          // city
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: new InputDecoration(
                hintText: 'City',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.greyColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                //label text details
                alignLabelWithHint: true,
                labelStyle: ThemeStyle.formLabelText,
                //icon details
                prefixIcon: Icon(
                  Icons.map,
                  size: ThemeStyle.iconSize,
                  color: ThemeStyle.blackColor,
                ),
                //details when selecting that input box
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.primColor,
                    width: 2,
                  ),
                  borderRadius: ThemeStyle.borderRadiusStyle,
                ),
                //filling in the color of the inside input box
                fillColor: ThemeStyle.lightGreyColor,
                filled: true,
              ),
              validator: validateCity,
              onSaved: (String val) {
                city = val;
              },
            ),
          ),
          // state
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: new TextFormField(
              decoration: new InputDecoration(
                hintText: 'State',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.greyColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                //label text details
                alignLabelWithHint: true,
                labelStyle: ThemeStyle.formLabelText,
                //icon details
                prefixIcon: Icon(
                  Icons.map,
                  size: ThemeStyle.iconSize,
                  color: ThemeStyle.blackColor,
                ),
                //details when selecting that input box
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeStyle.primColor,
                    width: 2,
                  ),
                  borderRadius: ThemeStyle.borderRadiusStyle,
                ),
                //filling in the color of the inside input box
                fillColor: ThemeStyle.lightGreyColor,
                filled: true,
              ),
              validator: validateState,
              onSaved: (String val) {
                state = val;
              },
            ),
          ),
          // phone number
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: new TextFormField(
                decoration: new InputDecoration(
                  hintText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeStyle.greyColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  //label text details
                  alignLabelWithHint: true,
                  labelStyle: ThemeStyle.formLabelText,
                  //icon details
                  prefixIcon: Icon(
                    Icons.phone,
                    size: ThemeStyle.iconSize,
                    color: ThemeStyle.blackColor,
                  ),
                  //details when selecting that input box
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeStyle.primColor,
                      width: 2,
                    ),
                    borderRadius: ThemeStyle.borderRadiusStyle,
                  ),
                  //filling in the color of the inside input box
                  fillColor: ThemeStyle.lightGreyColor,
                  filled: true,
                ),
                keyboardType: TextInputType.phone,
                validator: validateMobile,
                onSaved: (String val) {
                  phoneNumber = val;
                }),
          ),
          new SizedBox(height: 15.0),
          // button!
          new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: _sendToServer,
            child: Text(
              "SUBMIT",
              style: ThemeStyle.buttonLabelText,
            ),
            color: ThemeStyle.primColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          )
        ],
      ),
    );
  }

  ///checks if name input is empty or invalid characters
  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  ///checks if card input is empty or invalid inputs
  String validateCard(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Card number is required";
    } else if (!regExp.hasMatch(value)) {
      return "Card number must be digits";
    }
    return null;
  }

  ///checks if city input is empty
  String validateCity(String value) {
    if (value.length == 0) {
      return "City is required";
    }
    return null;
  }

  ///checks if state input is empty
  String validateState(String value) {
    if (value.length == 0) {
      return "State is required";
    }
    return null;
  }

  ///checks if phone number input is empty or invalid characters
  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Phone number is required";
    } else if (!regExp.hasMatch(value)) {
      return "Phone number must be digits";
    }
    return null;
  }

  ///saves data, handles navigation
  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      Navigator.pushNamed(context, FinishedPage.routeName);
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
