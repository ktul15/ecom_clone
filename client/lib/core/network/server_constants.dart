import 'dart:io';

class ServerConstants {
  static var serverBaseUrl =
      Platform.isAndroid
          ? 'http://10.0.2.2:3000/api/v1'
          : 'http://localhost:3000/api/v1';
  static const serverAuthBaseUrl = '/auth';

  static const signin = '/signin';
}
