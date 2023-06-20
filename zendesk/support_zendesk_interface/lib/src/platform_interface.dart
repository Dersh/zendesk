import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class SupportZendeskPlatform extends PlatformInterface {
  SupportZendeskPlatform() : super(token: _token);

  static SupportZendeskPlatform? _instance;

  static final Object _token = Object();

  static SupportZendeskPlatform? get instance => _instance;

  static set instance(SupportZendeskPlatform? instance) {
    if (instance == null) {
      throw AssertionError(
        'Platform interfaces can only be set to a non-null instance',
      );
    }
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(String accountKey, {String? appId}) async {
    throw UnimplementedError('init is not implemented on the current platform');
  }

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
    throw UnimplementedError(
      'startChat is not implemented on the current platform',
    );
  }

  Future<void> endChat() async {
    throw UnimplementedError(
      'endChat is not implemented on the current platform',
    );
  }
}
