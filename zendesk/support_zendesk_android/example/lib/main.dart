import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:support_zendesk_android/support_zendesk_android.dart';

void main() => runApp(MyApp());

const String zendeskAccountKey = 'z88MfRqFVdlNgwCiWD3FEDYf56QV5k8X';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final zendesk = SupportZendeskAndroid();

  @override
  void initState() {
    super.initState();
    initZendesk();
  }

  // Zendesk is asynchronous, so we initialize in an async method.
  Future<void> initZendesk() async {
    zendesk.initialize(zendeskAccountKey).then((r) {
      log('init finished');
    }).catchError((e) {
      log('failed with error $e');
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // But we aren't calling setState, so the above point is rather moot now.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyAppTest(zendesk),
    );
  }
}

class _MyAppTest extends StatefulWidget {
  const _MyAppTest(this.zendesk, {Key? key}) : super(key: key);
  final SupportZendeskAndroid zendesk;

  @override
  State<_MyAppTest> createState() => _MyAppTestState();
}

class _MyAppTestState extends State<_MyAppTest> {
  void showMessage({required String message, required bool isSuccess}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Start Chat with User Data'),
              onPressed: () async {
                widget.zendesk
                    .startChat(
                  department: 'SGA + EN',
                  name: 'My Name',
                  phoneNumber: '323-555-1212',
                  email: 'test@test.com',
                  userLanguageTag: 'en',
                  brandTag: 'campobetse',
                  codeTag: 'cmpse',
                  licenseTag: 'SGA',
                )
                    .then((r) {
                  log('startChat finished');
                  showMessage(
                    isSuccess: true,
                    message: 'setVisitorInfo finished',
                  );
                }).catchError((e) {
                  log('error $e');
                  showMessage(
                    isSuccess: false,
                    message: 'error $e',
                  );
                });
              },
            ),
            ElevatedButton(
              child: const Text('Start Chat without User Data'),
              onPressed: () async {
                widget.zendesk
                    .startChat(
                  department: 'SGA + EN',
                  userLanguageTag: 'en',
                  brandTag: 'campobetse',
                  codeTag: 'cmpse',
                  licenseTag: 'SGA',
                )
                    .then((r) {
                  log('startChat finished');
                  showMessage(
                    isSuccess: true,
                    message: 'startChat finished',
                  );
                }).catchError((e) {
                  log('error $e');
                  showMessage(
                    isSuccess: false,
                    message: 'error $e',
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
