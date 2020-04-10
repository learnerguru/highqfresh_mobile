import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/melabs/text_style.dart';

import 'Separator.dart';

class HomePageCardRow extends StatelessWidget {
  String imageName;
  String title;
  String subTitle;
  int parishCount;
  Function onClickAction;

  HomePageCardRow(
      String imageName, String title, String subTitle, int parishCount, Function onClickAction) {
    this.imageName      = imageName;
    this.title          = title;
    this.subTitle       = subTitle;
    this.parishCount    = parishCount;
    this.onClickAction  = onClickAction;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard(this.title, this.subTitle, this.parishCount, this.onClickAction),
            planetThumbnail(this.imageName),
          ],
        ));
  }
}

planetThumbnail(String imageName) {
  return new Container(
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: new ClipRRect(
      borderRadius: new BorderRadius.circular(45.0),
      child: FadeInImage(image: NetworkImage(imageName), placeholder: AssetImage(LgConstant.app_icon_asset_path),fit: BoxFit.fill,width: 92, height:92),
    ),
  );
}

planetCard(String title, String subTitle, int parishCount, Function onClickAction) {
  return new Container(
    child: planetCardContent(title, subTitle, parishCount, onClickAction),
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}

planetCardContent(String title, String subTitle, int parishCount, Function onClickAction) {
  final bool horizontal = true;
  return new Container(
    margin: new EdgeInsets.fromLTRB(
        horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),

      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(title, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(subTitle, style: Style.commonTextStyle, maxLines: 1,),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: parishCount.toString() +  " PARISHES", image: 'assets/images/app_icon.png', onClickAction: onClickAction))
            ],
          ),
        ],
      ),

  );
}

Widget _planetValue({
  String value,
  String image,
  Function onClickAction,
}) {
  return new Container(
      child: InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {
      onClickAction(); /**/
    },
    child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new Image.asset(image, height: 12.0),
      new Container(width: 8.0),
      new Text(value, style: Style.smallTextStyle),
    ]),
  ));
}
