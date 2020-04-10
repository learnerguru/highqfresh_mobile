import 'package:highqfresh/constant/LgConstant.dart';
import 'package:package_info/package_info.dart';

class LGPackageUtils{

  static PackageInfo getPackageInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      print(appName);
      print(packageName);
      print(version);
      print(buildNumber);
      LgConstant.packageInfo =packageInfo;

    });
  }
}