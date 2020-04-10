
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/utils/LGConnectivityChecker.dart';
import 'package:highqfresh/utils/LGValidationUtils.dart';
import 'package:intl/intl.dart';

class MEUIUtils{

  static setFailure(String message){
    return Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bubble_chart, color: Colors.deepPurpleAccent),
            Container(
              child: Text(message,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        )
    );
  }

 static setIconAndTextAndFunctionCard(IconData iconData, String text, Function function,BuildContext context) {
   if(!LGValidationUtils.isValidString(text)){
     return Container();
   }
    return GestureDetector(
      onTap: () {
        if(!LGConnectivityChecker.checkStatus(context)){
          return;
        }
        function();
      },
      child: Card(
        margin: EdgeInsets.all(5),
        child: ListTile(
          leading: Icon(
            iconData,
            size: 40,
            color: LgConstant.app_color,
          ),
          title: Text(text),
        ),
      ),
    );
  }

  static setIconAndText(String message,IconData iconData){
    if(!LGValidationUtils.isValidString(message)){
      return Container();
    }
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Icon(iconData,size: 20,color: Colors.blueGrey,),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                LGValidationUtils.checkString(message),
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ));
  }

  static setDateViewWithHeading(String title,DateTime selectedDate,BuildContext context){
    Color color = Theme.of(context).primaryColor;
    return  Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(title,
              style: TextStyle(fontSize: 10),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(Icons.date_range, color: color),
                SizedBox(
                  width: 10,
                ),
                Text(
                  new DateFormat.yMMMd().format(selectedDate),
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward, color: color),
              ],
            ),
          ],
        ));
  }

  static setDateView(DateTime selectedDate,BuildContext context){
    Color color = Theme.of(context).primaryColor;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      color: Colors.grey[300],
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Icon(Icons.date_range, color: color),
          SizedBox(
            width: 10,
          ),
          Text(
            new DateFormat.yMMMd().format(selectedDate),
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_forward, color: color),
        ],
      ),
    );
  }
}