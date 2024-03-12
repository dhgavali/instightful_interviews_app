import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class StorageHelper{
static const String userTokenKey = "token";

static Future<void> setUserToken(String token) async{
  var secureStorage = const FlutterSecureStorage();
  await secureStorage.write(key: userTokenKey, value: token);
}

static Future<String?> getUserToken() async {
  var secureStorage = const FlutterSecureStorage();
  return await secureStorage.read(key: userTokenKey);
}

}