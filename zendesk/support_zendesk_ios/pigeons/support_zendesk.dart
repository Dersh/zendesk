import 'package:pigeon/pigeon.dart';

class InitializeRequestData {
  String? accountKey;
  String? appId;
}

class StartChatRequestData {
  String? department;
  String? name;
  String? email;
  String? phoneNumber;
  String? iosBackButtonTitle;
  int? iosNavigationBarColor;
  int? iosNavigationTitleColor;
  String? userLanguageTag;
  String? licenseTag;
  String? brandTag;
  String? codeTag;
}

@HostApi()
abstract class ChatApi {
  void initialize(InitializeRequestData request);

  void startChat(StartChatRequestData request);

  void endChat();
}
