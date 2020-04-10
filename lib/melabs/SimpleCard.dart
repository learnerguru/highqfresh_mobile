
import 'package:flutter/material.dart';
import 'package:highqfresh/utils/LGValidationUtils.dart';

class SimpleCard extends StatelessWidget {
  final title,subtitle,imageUrl;

  const SimpleCard(
      {Key key, @required this.title, @required this.subtitle, @required this.imageUrl})
      : super(key: key);

  Widget build(BuildContext context) {
    var image =Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            LGValidationUtils.checkString(imageUrl),
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black26,
            BlendMode.darken,
          ),
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
      ),

    );

    var padding =  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Column(
        children: <Widget>[
          image,
          Text(LGValidationUtils.checkString(title),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12,),maxLines: 1,),
          Text(LGValidationUtils.checkString(subtitle),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 12),maxLines: 2,),
        ],
      ),
    );

    return Container(
      color: Colors.white,
      height: 140,
      width: 130,
      child: padding,
    );
  }


}
