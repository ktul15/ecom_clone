import 'dart:io';

class ServerConstants {
  static var serverBaseUrl =
      Platform.isAndroid
          ? 'http://10.0.2.2:3000/ecom_clone/api/v1/admin'
          : 'http://localhost:3000/ecom_clone/api/v1/admin';

  static const login = "/login";
}
