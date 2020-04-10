import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/utils/LGValidationUtils.dart';

class EventCard extends StatelessWidget {
  final String title, subtitle, imageUrl;

  const EventCard(
      {Key key, @required this.title, @required this.subtitle, @required this.imageUrl})
      : super(key: key);

  Widget build(BuildContext context) {
    return  SizedBox(
      width: 180.0,
      child: getItemValue(),
    );

  }

  getItemValue(){
    return Container(
      margin: new EdgeInsets.only(left: 10.0, right: 10.0),
      child: getCard(),
    );
  }

  getCard(){
   return Card(
     child: new Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
         new SizedBox(
           height: 100.0,
           width: 180.0,
           child: FadeInImage(image: NetworkImage(LGValidationUtils.checkString(imageUrl)), placeholder: AssetImage(LgConstant.app_icon_asset_path),fit: BoxFit.fill,),
         ),

         Align(
           alignment: FractionalOffset.bottomLeft,
           child:  Padding(
             padding: EdgeInsets.all(10),
             child:Text(LGValidationUtils.checkString(title)
               ,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 12),textAlign: TextAlign.start,maxLines: 1,),
           ),
         ),

         Align(
           alignment: FractionalOffset.bottomLeft,
           child:  Padding(
             padding: EdgeInsets.all(10),
             child:Text(LGValidationUtils.checkString(subtitle)
               ,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 10),textAlign: TextAlign.start,maxLines: 1,) ,
           ),
         )


       ],
     ),
   );
  }
}
