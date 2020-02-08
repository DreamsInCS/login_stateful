import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  String email;
  String password;
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(bottom: 20.0)),
            submitButton(),
          ],
        )
      )
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        setState(() => email = value);
      }
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password'
      ),
      validator: validatePassword,
      onSaved: (value) {
        setState(() => password = value);
      }
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.lightBlueAccent,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('$email and $password. Good?');
        }
      }
    );
  }
}
