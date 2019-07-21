import 'package:flutter/material.dart';

import 'food_item_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    "https://scontent-sin2-2.xx.fbcdn.net/v/t1.0-1/579113_165893363610115_1723460683_n.png?_nc_cat=100&_nc_oc=AQn-oQW4-huqMbM9o4tXlt5_JOqlv8-ZWZ7nLU49bHoePhV3BhhiNoWBtEo_e7weQ4M&_nc_ht=scontent-sin2-2.xx&oh=3f42baeccfbc8e208169cf28633aefc2&oe=5DEAE448"),
              ),
              SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your Employee ID", labelText: "Employee ID"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty || value.length != 5) {
                    return 'Enter valid 5 digit employee id';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your Password", labelText: "Password"),
                validator: (value) {
                  if (!RegExp(r"^(?=.*\d).{4,8}$").hasMatch(value)) {
                    return 'Password must be between 4 and 8 digits long and include at least one numeric digit';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.indigo,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodItemScreen()));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    )),
    );
  }
}
