
import 'package:flutter/material.dart';

import 'ProfileState.dart';


void main() => runApp(new ProfilePage());

class ProfilePage extends StatefulWidget {

  final bool isLogin;
  ProfilePage({Key key, this.isLogin}) : super(key: key);

  @override
  ProfileState createState() => new ProfileState();
}





