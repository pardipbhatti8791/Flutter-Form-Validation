import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

// @ Login Screen Class
class LoginScreenState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            submitButton()
          ],
        ),
      ),
    );
  }

  /// @ emailField
  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
          // return null if valid
          // otherwise return string if invalid
          if (!value.contains('@')) {
            return "Please enter valid email";
          }
          return null;
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  /// @ passwordField
  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: "********",
      ),
      obscureText: true,
      validator: (String value) {
        // return null if valid
          // otherwise return string if invalid
        if (value.length < 4) {
          return "Password must be atleast 4 characters";
        }
        return null;
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  /// @ submitButton
  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        if ( formKey.currentState.validate() ) {
          formKey.currentState.save();
        }
      },
      child: Text(
        'Submit!',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
