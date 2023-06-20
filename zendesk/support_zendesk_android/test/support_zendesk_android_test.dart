// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:support_zendesk_android/support_zendesk_android.dart';

// void main() {
//   const MethodChannel channel = MethodChannel('support_zendesk_android');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await SupportZendeskAndroid.platformVersion, '42');
//   });
// }
