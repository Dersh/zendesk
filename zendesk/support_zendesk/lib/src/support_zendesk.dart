import 'dart:io';
import 'package:support_zendesk_android/support_zendesk_android.dart';
import 'package:support_zendesk_interface/src/platform_interface.dart';
import 'package:support_zendesk_ios/support_zendesk_ios.dart';

class SupportZendesk {
  /// Creates a [SupportZendesk] -- returns the instance if it's already been called.
  factory SupportZendesk() {
    return _instance ??= SupportZendesk._();
  }

  SupportZendesk._() {
    if (SupportZendeskPlatform.instance == null) {
      if (Platform.isAndroid) {
        SupportZendeskPlatform.instance = SupportZendeskAndroid();
      } else if (Platform.isIOS) {
        SupportZendeskPlatform.instance = SupportZendeskIOS();
      } else {
        throw AssertionError(
          'This platform is currently unsupported by support_zendesk.',
        );
      }
    }
  }

  static SupportZendesk? _instance;

  Future<void> initialize(String accountKey, {String? appId}) =>
      SupportZendeskPlatform.instance!.initialize(accountKey, appId: appId);

  Future<void> startChat({
    required String department,
    String? name,
    String? email,
    String? phoneNumber,
    required String userLanguageTag,
    required String licenseTag,
    required String brandTag,
    required String codeTag,
  }) =>
      SupportZendeskPlatform.instance!.startChat(
        department: department,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        userLanguageTag: userLanguageTag,
        licenseTag: licenseTag,
        brandTag: brandTag,
        codeTag: codeTag,
      );

  Future<void> endChat() => SupportZendeskPlatform.instance!.endChat();
}
