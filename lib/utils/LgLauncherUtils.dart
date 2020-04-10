import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
class LgLauncherUtils{

  static launchMap({String lat , String long }) async{
    var mapSchema = 'geo:$lat,$long';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }
  static launchURL(String url) async {
    print("launchURL===>"+url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static callPhone(String phone) async {
    print("callPhone===>"+phone);
    UrlLauncher.launch('tel:${phone}');
  }

  static sendMail(String mailId) async {
    print("sendMail===>"+mailId);
    UrlLauncher.launch('mailto:${mailId}');
  }

}