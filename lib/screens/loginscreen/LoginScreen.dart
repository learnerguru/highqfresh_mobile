
import 'package:flutter/material.dart';

import 'LoginScreenState.dart';

void main() => runApp(new LoginScreen());

class LoginScreen extends StatefulWidget {
  final String username;

  const LoginScreen({Key key, this.username}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

