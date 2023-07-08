class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://api.mail.tm/";

  // receiveTimeout
  static const int receiveTimeout = 100000;

  // connectTimeout
  static const int connectionTimeout = 100000;
  static const String getDomains = 'domains?page=1';
  static const String createAccount = 'accounts';
  static const String getToken = 'token';
  static const String getMails = 'messages';
}
