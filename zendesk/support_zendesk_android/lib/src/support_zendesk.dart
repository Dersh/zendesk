import 'package:support_zendesk_android/src/support_zendesk.pigeon.dart';
import 'package:support_zendesk_interface/src/platform_interface.dart';

class SupportZendeskAndroid extends SupportZendeskPlatform {
  final ChatApi _chatApi = ChatApi();

  @override
  Future<void> initialize(String accountKey, {String? appId}) async {
    final request = InitializeRequestData()
      ..accountKey = accountKey
      ..appId = appId;

    await _chatApi.initialize(request);
  }

  @override
  Future<void> startChat({
    required String department,
    String? name,
    String? email,
    String? phoneNumber,
    required String userLanguageTag,
    required String licenseTag,
    required String brandTag,
    required String codeTag,
  }) async {
    final request = StartChatRequestData()
      ..department = department
      ..name = name
      ..email = email
      ..phoneNumber = phoneNumber
      ..userLanguageTag = userLanguageTag
      ..licenseTag = licenseTag
      ..brandTag = brandTag
      ..codeTag = codeTag;

    await _chatApi.startChat(request);
  }

  @override
  Future<void> endChat() async {
    await _chatApi.endChat();
  }
}
