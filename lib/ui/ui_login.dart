import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rmr_attendance/services.dart';
import 'package:rmr_attendance/ui/ui_dashboard.dart';
import 'package:rmr_attendance/ui/ui_forget_password.dart';
import 'package:rmr_attendance/ui/ui_organization_selection.dart';
import 'package:rmr_attendance/utils/widget_gif_loader.dart';

import '../utils.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _isObscureText = true;
  bool _isRemembered = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    restoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .7,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "images/login.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 92),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 64,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 8,
                            offset: Offset(
                              0,
                              0,
                            ),
                          )
                        ],
                        color: Colors.white),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: TextFormField(
                              autofocus: false,
                              controller: _emailController,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              keyboardAppearance: Brightness.light,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade50,
                                filled: true,
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.black),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green,
                                        style: BorderStyle.solid)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: TextFormField(
                              controller: _passwordController,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.done,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              keyboardAppearance: Brightness.dark,
                              obscureText: _isObscureText,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade50,
                                  filled: true,
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Colors.green,
                                          style: BorderStyle.solid)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green,
                                          style: BorderStyle.solid)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green,
                                        style: BorderStyle.solid),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObscureText = !_isObscureText;
                                      });
                                    },
                                    icon: Icon(
                                      _isObscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  )),
                            ),
                          ),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(
                              "Remember Me",
                              style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),
                            ),
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                            value: _isRemembered,
                            onChanged: (flag) {
                              setState(() {
                                _isRemembered = !_isRemembered;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  child: Text(
                                    "Forget Password",
                                    style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new ForgetPasswordUI()));
                                  },
                                ),
                                MaterialButton(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(72),
                                    side: BorderSide(color: Colors.green),
                                  ),
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        top: 12,
                                        bottom: 12),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    doLogin();
                                    showDialog(
                                        context: context,
                                        builder: (_) => loadingAlert(context),
                                        barrierDismissible: false);
                                    if (_isRemembered) {
                                      reserveData();
                                    }
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

//  loadingAlert() {
//    doLogin();
//    return WillPopScope(
//      onWillPop: () async => false,
//      child: BackdropFilter(
//        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//        child: SimpleDialog(
//          contentPadding: EdgeInsets.all(0),
//          backgroundColor: Colors.transparent,
//          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//          children: <Widget>[
//            Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Container(
//                  width: 100,
//                  height: 100,
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.circular(24),
//                    child: Image.asset(
//                      "images/loading.gif",
//                      width: 100,
//                      height: 100,
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }

  void doLogin() async {
    await saveCredentials();
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };

    Map<String, String> body = {
      "username": _emailController.text,
      "password": _passwordController.text,
      "grant_type": "password"
    };

    var response = await loginService(headers, body);
    Navigator.of(context).pop();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      await FlutterSecureStorage()
          .write(key: "isAutheticated", value: true.toString());
      await FlutterSecureStorage()
          .write(key: "token", value: map['token_type'] + " " + map['access_token']);
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChooseOrganizationUI()));
    } else if (response.statusCode == 500) {
      Toast_ERROR(context, "Server Error", "Re-check your email addess again.");
    } else {
      Toast_ERROR(context, "Wrong Credentials", "Incorrect password.");
    }
  }

  void reserveData() async {
    var storage = FlutterSecureStorage();
    await storage.write(key: "email", value: _emailController.text);
    await storage.write(key: "password", value: _passwordController.text);
  }

  Future saveCredentials() async {
    var storage = FlutterSecureStorage();
    if (_isRemembered) {
      await storage.write(key: "isRemembered", value: true.toString());
      await storage.write(key: "email", value: _emailController.text);
      await storage.write(key: "password", value: _passwordController.text);
    }
    return;
  }

  void restoreData() async {
    var storage = FlutterSecureStorage();
    String isRememberedByCredentials = await storage.read(key: "isRemembered");
    if (isRememberedByCredentials != null &&
        isRememberedByCredentials == true.toString()) {
      String email = await storage.read(key: "email");
      String password = await storage.read(key: "password");
      setState(() {
        _emailController.text = email;
        _passwordController.text = password;
        _isRemembered = true;
      });
    }
  }
}
