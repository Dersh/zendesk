// Autogenerated from Pigeon (v3.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "zendesk.pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface InitializeRequestData ()
+ (InitializeRequestData *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface StartChatRequestData ()
+ (StartChatRequestData *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation InitializeRequestData
+ (instancetype)makeWithAccountKey:(nullable NSString *)accountKey
    appId:(nullable NSString *)appId {
  InitializeRequestData* pigeonResult = [[InitializeRequestData alloc] init];
  pigeonResult.accountKey = accountKey;
  pigeonResult.appId = appId;
  return pigeonResult;
}
+ (InitializeRequestData *)fromMap:(NSDictionary *)dict {
  InitializeRequestData *pigeonResult = [[InitializeRequestData alloc] init];
  pigeonResult.accountKey = GetNullableObject(dict, @"accountKey");
  pigeonResult.appId = GetNullableObject(dict, @"appId");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.accountKey ? self.accountKey : [NSNull null]), @"accountKey", (self.appId ? self.appId : [NSNull null]), @"appId", nil];
}
@end

@implementation StartChatRequestData
+ (instancetype)makeWithDepartment:(nullable NSString *)department
    name:(nullable NSString *)name
    email:(nullable NSString *)email
    phoneNumber:(nullable NSString *)phoneNumber
    iosBackButtonTitle:(nullable NSString *)iosBackButtonTitle
    iosNavigationBarColor:(nullable NSNumber *)iosNavigationBarColor
    iosNavigationTitleColor:(nullable NSNumber *)iosNavigationTitleColor
    userLanguageTag:(nullable NSString *)userLanguageTag
    licenseTag:(nullable NSString *)licenseTag
    brandTag:(nullable NSString *)brandTag
    codeTag:(nullable NSString *)codeTag {
  StartChatRequestData* pigeonResult = [[StartChatRequestData alloc] init];
  pigeonResult.department = department;
  pigeonResult.name = name;
  pigeonResult.email = email;
  pigeonResult.phoneNumber = phoneNumber;
  pigeonResult.iosBackButtonTitle = iosBackButtonTitle;
  pigeonResult.iosNavigationBarColor = iosNavigationBarColor;
  pigeonResult.iosNavigationTitleColor = iosNavigationTitleColor;
  pigeonResult.userLanguageTag = userLanguageTag;
  pigeonResult.licenseTag = licenseTag;
  pigeonResult.brandTag = brandTag;
  pigeonResult.codeTag = codeTag;
  return pigeonResult;
}
+ (StartChatRequestData *)fromMap:(NSDictionary *)dict {
  StartChatRequestData *pigeonResult = [[StartChatRequestData alloc] init];
  pigeonResult.department = GetNullableObject(dict, @"department");
  pigeonResult.name = GetNullableObject(dict, @"name");
  pigeonResult.email = GetNullableObject(dict, @"email");
  pigeonResult.phoneNumber = GetNullableObject(dict, @"phoneNumber");
  pigeonResult.iosBackButtonTitle = GetNullableObject(dict, @"iosBackButtonTitle");
  pigeonResult.iosNavigationBarColor = GetNullableObject(dict, @"iosNavigationBarColor");
  pigeonResult.iosNavigationTitleColor = GetNullableObject(dict, @"iosNavigationTitleColor");
  pigeonResult.userLanguageTag = GetNullableObject(dict, @"userLanguageTag");
  pigeonResult.licenseTag = GetNullableObject(dict, @"licenseTag");
  pigeonResult.brandTag = GetNullableObject(dict, @"brandTag");
  pigeonResult.codeTag = GetNullableObject(dict, @"codeTag");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.department ? self.department : [NSNull null]), @"department", (self.name ? self.name : [NSNull null]), @"name", (self.email ? self.email : [NSNull null]), @"email", (self.phoneNumber ? self.phoneNumber : [NSNull null]), @"phoneNumber", (self.iosBackButtonTitle ? self.iosBackButtonTitle : [NSNull null]), @"iosBackButtonTitle", (self.iosNavigationBarColor ? self.iosNavigationBarColor : [NSNull null]), @"iosNavigationBarColor", (self.iosNavigationTitleColor ? self.iosNavigationTitleColor : [NSNull null]), @"iosNavigationTitleColor", (self.userLanguageTag ? self.userLanguageTag : [NSNull null]), @"userLanguageTag", (self.licenseTag ? self.licenseTag : [NSNull null]), @"licenseTag", (self.brandTag ? self.brandTag : [NSNull null]), @"brandTag", (self.codeTag ? self.codeTag : [NSNull null]), @"codeTag", nil];
}
@end

@interface ChatApiCodecReader : FlutterStandardReader
@end
@implementation ChatApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [InitializeRequestData fromMap:[self readValue]];
    
    case 129:     
      return [StartChatRequestData fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface ChatApiCodecWriter : FlutterStandardWriter
@end
@implementation ChatApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[InitializeRequestData class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[StartChatRequestData class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface ChatApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation ChatApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[ChatApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[ChatApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *ChatApiGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    ChatApiCodecReaderWriter *readerWriter = [[ChatApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void ChatApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ChatApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ChatApi.initialize"
        binaryMessenger:binaryMessenger
        codec:ChatApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initializeRequest:error:)], @"ChatApi api (%@) doesn't respond to @selector(initializeRequest:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        InitializeRequestData *arg_request = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api initializeRequest:arg_request error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ChatApi.startChat"
        binaryMessenger:binaryMessenger
        codec:ChatApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(startChatRequest:error:)], @"ChatApi api (%@) doesn't respond to @selector(startChatRequest:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        StartChatRequestData *arg_request = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api startChatRequest:arg_request error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ChatApi.endChat"
        binaryMessenger:binaryMessenger
        codec:ChatApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(endChatWithError:)], @"ChatApi api (%@) doesn't respond to @selector(endChatWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api endChatWithError:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}