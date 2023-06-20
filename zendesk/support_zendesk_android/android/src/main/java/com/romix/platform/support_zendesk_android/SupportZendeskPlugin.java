package com.romix.platform.support_zendesk_android;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import androidx.annotation.NonNull;
import java.util.List;
import java.util.ArrayList;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import zendesk.chat.Chat;
import zendesk.chat.ChatConfiguration;
import zendesk.chat.ChatEngine;
import zendesk.chat.ChatProvider;
import zendesk.chat.ProfileProvider;
import zendesk.chat.Providers;
import zendesk.chat.VisitorInfo;
import zendesk.chat.VisitorInfo.Builder;
import zendesk.chat.ChatProvidersConfiguration;
import zendesk.messaging.MessagingActivity;
import com.romix.platform.support_zendesk_android.SupportZendeskPluginPigeon.ChatApi;
import com.romix.platform.support_zendesk_android.SupportZendeskPluginPigeon.InitializeRequestData;
import com.romix.platform.support_zendesk_android.SupportZendeskPluginPigeon.StartChatRequestData;

import com.zendesk.logger.Logger;

/** SupportZendeskPlugin */
public class SupportZendeskPlugin implements FlutterPlugin, ActivityAware, ChatApi {
  private Context applicationContext;
  private Activity activity;

  public SupportZendeskPlugin() {}

  public static void registerWith(Registrar registrar) {
    SupportZendeskPlugin plugin = new SupportZendeskPlugin();
    plugin.startListening(registrar.context(), registrar.messenger());
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    startListening(binding.getApplicationContext(), binding.getBinaryMessenger());
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    applicationContext = null;
  }

  private void startListening(Context applicationContext, BinaryMessenger messenger) {
    ChatApi.setup(messenger, this);

    this.applicationContext = applicationContext;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    activity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    activity = null;
  }

  @Override
  public void initialize(InitializeRequestData arg) {
    Logger.setLoggable(true);
    if (arg.getAccountKey() == null) {
      throw new IllegalArgumentException("accountKey missing");
    }

    if (arg.getAppId() != null) {
      Chat.INSTANCE.init(applicationContext, arg.getAccountKey(), arg.getAppId());
    } else {
      Chat.INSTANCE.init(applicationContext, arg.getAccountKey());
    }
  }

  @Override
  public void startChat(StartChatRequestData arg) {

    if (activity == null) {
      System.out.printf("Activity is Null");
      return;
    }

    ProfileProvider profileProvider = Chat.INSTANCE.providers().profileProvider();

    ChatConfiguration chatConfiguration = ChatConfiguration.builder()
            .withAgentAvailabilityEnabled(false)
            .withPreChatFormEnabled(true)
            .build();

    ArrayList<String> tags = new ArrayList<>();
    tags.add((String) arg.getUserLanguageTag());
    tags.add((String) arg.getLicenseTag());
    tags.add((String) arg.getBrandTag());
    tags.add((String) arg.getCodeTag());

    profileProvider.addVisitorTags(tags, null);

    VisitorInfo visitorInfo = VisitorInfo.builder()
            .withName(arg.getName())
            .withEmail(arg.getEmail())
            .withPhoneNumber(arg.getPhoneNumber()) // numeric string
            .build();

        ChatProvidersConfiguration chatProvidersConfiguration = ChatProvidersConfiguration.builder()
            .withVisitorInfo(visitorInfo)
            .withDepartment(arg.getDepartment())
            .build();

    Chat.INSTANCE.setChatProvidersConfiguration(chatProvidersConfiguration);

    ChatProvider chatProvider = Chat.INSTANCE.providers().chatProvider();
    chatProvider.setDepartment(arg.getDepartment(), null);


    MessagingActivity.builder().withEngines(ChatEngine.engine()).show(activity, chatConfiguration);



//    ChatProvidersConfiguration chatProvidersConfiguration = ChatProvidersConfiguration.builder()
//            .withVisitorInfo(visitorInfo)
//            .withDepartment(arg.getDepartment())
//            .build();
//
//    Chat.INSTANCE.setChatProvidersConfiguration(chatProvidersConfiguration);
//
//
//
//    MessagingActivity.builder()
//            .withEngines(ChatEngine.engine())
//            .show(activity, chatConfiguration);
//
//

  }

  @Override
  public void endChat() {}
}
