import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as prefix0;
import 'package:highqfresh/utils/LGValidationUtils.dart';
class EncryptDecryptHelper{

  static Key key = prefix0.Key.fromUtf8('DOFPSECURED12345');
  static IV iv = IV.fromLength(16);

  static Encrypter encrypter = Encrypter(AES(
      key,mode: AESMode.ecb,padding: "PKCS7"));



  static String EncryptDatas(String textData) {
    final encrypted = encrypter.encrypt(textData, iv: iv);
    return encrypted.base64;

  }
  static String DecryptDatas(String encryptedData) {
    var data='';
    if(LGValidationUtils.checkString(encryptedData).isEmpty){
      return "";
    }
    try{
      data = encrypter.decrypt(Encrypted.fromBase64(encryptedData), iv: iv);
    }on Exception catch (_) {
      print('never reached');
      return "";
    }
    return data;

  }

}