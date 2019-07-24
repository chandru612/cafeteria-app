import 'package:cafeteria/common/app_colors.dart';
import 'package:flutter/material.dart';

import 'food_item_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color buttonColor = AppColors.disabled;

  @override
  void initState() {
    super.initState();
    idController.addListener(_enableButton);
    passwordController.addListener(_enableButton);
  }

  void _enableButton() {
    setState(() {
      if (idController.text.length > 0 && passwordController.text.length > 0) {
        buttonColor = AppColors.green;
      } else {
        buttonColor = AppColors.disabled;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        padding: EdgeInsets.all(36),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.text_black),
                      textScaleFactor: 2.5),
                  Icon(Icons.verified_user, color: AppColors.green)
                ],
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: idController,
                autofocus: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.underline)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green),
                  ),
                  hintStyle: TextStyle(color: AppColors.text_grey),
                  hintText: "Employee ID",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty || value.length != 5) {
                    return 'Enter valid 5 digit employee id';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.underline)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.green),
                    ),
                    errorMaxLines: 2,
                    hintStyle: TextStyle(color: AppColors.text_grey),
                    hintText: "Password"),
                validator: (value) {
                  if (!RegExp(r"^(?=.*\d).{4,8}$").hasMatch(value)) {
                    return 'Password must be between 4 and 8 digits long and include at least one numeric digit';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 48),
              SizedBox(
                width: 240,
                height: 55,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(55))),
                  color: buttonColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodItemScreen()));
                    }
                  },
                  child: Text('COUNTINUE'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
