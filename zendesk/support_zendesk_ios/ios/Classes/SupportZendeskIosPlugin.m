#import "SupportZendeskIosPlugin.h"

#import <ChatSDK/ChatSDK.h>
#import <MessagingSDK/MessagingSDK.h>
#import <ChatProvidersSDK/ChatProvidersSDK.h>

#import "zendesk.pigeon.h"

#define ARGB_COLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0  alpha:((c>>24)&0xFF)/255.0]

@implementation SupportZendeskFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    SupportZendeskFlutterPlugin* instance = [[SupportZendeskFlutterPlugin alloc] init];
    ChatApiSetup([registrar messenger], instance);
}

- (id) null:(id)input or:(id)defaultValue {
    if (input == nil || [input isEqual:[NSNull null]]) {
        return defaultValue;
    } else {
        return input;
    }
}

- (void)endChatWithError:(FlutterError *_Nullable *_Nonnull)error {
    
}

- (void)close:(id)sender {
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:true completion:nil];
}

- (void)initializeRequest:(InitializeRequestData *)request error:(FlutterError *_Nullable *_Nonnull)error{
    [ZDKChat initializeWithAccountKey:request.accountKey queue:dispatch_get_main_queue()];
}


- (void)startChatRequest:(StartChatRequestData *)input error:(FlutterError *_Nullable *_Nonnull)error {
    NSNumber *navigationBarColor = input.iosNavigationBarColor;
    NSNumber *navigationTitleColor = input.iosNavigationTitleColor;
    
    NSString *backButtonTitle = [self null:(input.iosBackButtonTitle)
                                        or:NSLocalizedString(@"Back", "")];
    
    
    ZDKMessagingConfiguration *messagingConfiguration = [[ZDKMessagingConfiguration alloc] init];
    
    messagingConfiguration.name = @"Chat Bot";
    
    ZDKChatConfiguration *chatConfiguration = [[ZDKChatConfiguration alloc] init];
    
    ZDKChatAPIConfiguration *chatAPIConfiguration = [[ZDKChatAPIConfiguration alloc] init];
    
    chatAPIConfiguration.visitorInfo = [[ZDKVisitorInfo alloc] initWithName:input.name
                                                                      email:input.email
                                                                phoneNumber:input.phoneNumber];
    
    [ZDKChat.profileProvider addTags:@[input.userLanguageTag, input.licenseTag, input.brandTag, input.codeTag] completion:nil];
    ZDKChat.instance.configuration = chatAPIConfiguration;
    ZDKChat.instance.configuration.department = input.department;
    
    
    NSError *localError = nil;
    
    NSArray *engines = @[
        (id <ZDKEngine>) [ZDKChatEngine engineAndReturnError:&localError]
    ];
    UIViewController *viewController = [ZDKMessaging.instance buildUIWithEngines:engines
                                                                         configs:@[messagingConfiguration, chatConfiguration]
                                                                           error:&localError];
    
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:viewController];
    navVc.navigationBar.translucent = NO;
    if (navigationBarColor != nil) {
        navVc.navigationBar.barTintColor = ARGB_COLOR([navigationBarColor integerValue]);
    }
    
    if (navigationTitleColor != nil) {
        navVc.navigationBar.titleTextAttributes = @{
            NSForegroundColorAttributeName: ARGB_COLOR([navigationTitleColor integerValue])
        };
    }
    
    
    UIViewController *rootVc = [UIApplication sharedApplication].keyWindow.rootViewController ;
    [rootVc presentViewController:navVc
                         animated:true
                       completion:^{
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(close:)];
        if (navigationTitleColor != nil) {
            [back setTitleTextAttributes:@{ NSForegroundColorAttributeName:ARGB_COLOR([navigationTitleColor integerValue])} forState:UIControlStateNormal];
        }
        
        navVc.topViewController.navigationItem.leftBarButtonItem = back;
    }];
    
}

@end
