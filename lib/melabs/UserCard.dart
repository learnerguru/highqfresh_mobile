
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
final String title,subtitle,imageUrl;

const UserCard({Key key, @required this.title,@required this.subtitle, @required this.imageUrl}) : super(key: key);

Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha(50),
          offset: Offset(0, 0),
          blurRadius: 5,
        ),
      ],
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundImage:NetworkImage(imageUrl),
                minRadius: 30,
                backgroundColor: Colors.grey[200],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Text(
                subtitle,
                maxLines: 1,
                style: TextStyle(
                  color: Color(0xff8C68EC),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.chevron_right,
                size: 18,
              ),
            )
          ],
        )
      ],
    ),
  );
}
}
