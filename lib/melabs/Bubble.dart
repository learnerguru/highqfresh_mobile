import 'package:flutter/material.dart';
import 'package:highqfresh/utils/LGValidationUtils.dart';

class Bubble extends StatelessWidget {
  final bool isOrginMessage, isMe;
  final String message, profileUrl, name;

  Bubble(
      {this.message,
      this.isOrginMessage,
      this.profileUrl,
      this.name,
      this.isMe});

  Widget build(BuildContext context) {
    if (LGValidationUtils.isValidString(message)) {
      return Container(
        margin: EdgeInsets.all(5),
        padding: isOrginMessage
            ? EdgeInsets.only(left: 40)
            : EdgeInsets.only(right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: isOrginMessage
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: isOrginMessage
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: isOrginMessage
                        ? LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [
                                0.1,
                                1
                              ],
                            colors: [
                                Color(0xFFF6D365),
                                Color(0xFFFDA085),
                              ])
                        : isMe
                            ? LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                    0.1,
                                    1
                                  ],
                                colors: [
                                    Color(0xFFDFF665),
                                    Color(0xFFDFD65),
                                  ])
                            : LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [
                                    0.1,
                                    1
                                  ],
                                colors: [
                                    Color(0xFFEBF5FC),
                                    Color(0xFFEBF5FC),
                                  ]),
                    borderRadius: isOrginMessage
                        ? BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(15),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(0),
                          ),
                  ),
                  child: Column(
                    crossAxisAlignment: isOrginMessage
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        textAlign:
                            isOrginMessage ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          color: isOrginMessage ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        message,
                        textAlign:
                            isOrginMessage ? TextAlign.end : TextAlign.start,
                        style: TextStyle(
                          color: isOrginMessage ? Colors.white : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
