# Support Zendesk
## _Flutter interface for Zendesk Mobile SDK_

## Features

- Use Zendesk CHAT SDK V2


## Installation
### Android

../android/app/build.gradle.

```gradle
 defaultConfig {
        minSdkVersion 16 // min version
        ...
        ...
        multiDexEnabled true
    }
```

../android/app/src/main/AndroidManifest.xml.

```xml
<application
        android:label=...
        android:name=...
        android:icon=...
        android:theme="@style/ZendeskLightTheme">
         <activity
```

../android/app/src/main/AndroidManifest.xml.

```xml
<application
        android:label=...
        android:name=...
        android:icon=...
        android:theme="@style/ZendeskLightTheme">
         <activity
```

.../android/app/src/main/res/values/styles.xml

.../android/app/src/main/res/values-night/styles.xml

```xml
 <style name="ZendeskLightTheme" parent="ZendeskSdkTheme.Light">
        <item name="colorPrimary">#8C6DA0</item>
        <item name="colorPrimaryDark">#8C6DA0</item>
        <item name="colorAccent">#3E3E3E</item>
        <item name="android:textColor">#3E3E3E</item>
        <item name="android:textColorPrimary">#3E3E3E</item>
        <item name="elevation">0dp</item>
        <item name="appBarLayoutStyle">@style/AppTheme.AppBarOverlay</item>
    </style>

    <style name="AppTheme.AppBarOverlay" parent="ThemeOverlay.MaterialComponents.Dark.ActionBar">
        <item name="android:background">#3E3E3E</item>
        <item name="android:textColor">#3E3E3E</item>
        <item name="android:textColorPrimary">#3E3E3E</item>
    </style>
```

### iOS

../ios/Podfile

```podfile
 platform :ios, '10.0' # min version
```

### User

Add Account Key
```dart
const zendeskAccountKey = 'z88MfRqFVdlNgwCiWD3FEDYf56QV5k8X'; // For example
```

Init Zendesk
```dart
    zendesk.initialize(zendeskAccountKey).then((r) {
      log('init finished');
    }).catchError((e) {
      log('failed with error $e');
    });
```

Use
```dart
    widget.zendesk.startChat(
      department: 'SGA + EN', // Required field
      name: 'My Name',
      phoneNumber: '323-555-1212',
      email: 'test@test.com',
    );
```
## Configurations
```dart
const zendeskAccountKey = 'z88MfRqFVdlNgwCiWD3FEDYf56QV5k8X';
```
#### Campobet SE
```
 widget.zendesk.startChat(
      department: 'SGA + EN', // or "SGA + SE"
      userLanguageTag: 'en', // or "se"
      brandTag: 'campobetse',
      codeTag: 'cmpse',
      licenseTag: 'SGA',
    );
```
#### YoYo SE
```
 widget.zendesk.startChat(
      department: 'SGA + EN', // or "SGA + SE"
      userLanguageTag: 'en', // or "se"
      brandTag: 'yoyose',
      codeTag: 'yose',
      licenseTag: 'SGA',
    );
```
