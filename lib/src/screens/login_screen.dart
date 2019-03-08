import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

// @ Login Screen Class
class LoginScreenState extends State<Login> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

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
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
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
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
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
