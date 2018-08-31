---
title: Mobile push notifications – Integration Guide
description: Setup guide for iOS and Android mobile push notifications in Vero
categories:
- mobile push notifications
layout: articles
---

# Mobile push notifications – Integration Guide

<div class="alert alert-info">
  <p class="no-top-margin">This feature is currently in <strong>beta</strong>.</p>
  <p>If you're interested in trying it out, please email us at <a href="mailto:support@getvero.com">support@getvero.com</a>.</p>
</div>

## Table of contents

1. [Configure push in your application](#1-configure-push-in-your-account)
2. [Configure push notifications in your application](#2-configure-push-notifications-in-your-application)
3. [Identify device tokens with Vero](#3-identify-device-tokens-with-vero)
4. [Tracking push "opens" with Vero](#4-tracking-push-opens-with-vero)
5. [Testing push notifications](#5-testing-push-notifications)

## Definitions

- **Push notification**. A notification sent to an iOS or Android device using those platforms' inbuilt notification infrastructure. A push notification is different from a "web push" message or an SMS.
- **Push delivery provider**. A service that sends raw push messages to the iOS and Android push notification networks. Vero sits "on top of" your push delivery provider.
- **Device token**. 

----

## 1. Configure push in your account

### a. Supported push delivery providers

Vero sends push messages to your customers via popular push delivery providers. At this time we support the following providers:

- [Amazon SNS](https://aws.amazon.com/sns/)
- [Twilio Notify](https://www.twilio.com/notify)

These providers enable you to manage your APN, GCM and FCM certificates in a central place (Twilio or Amazon SNS) and use Vero "on top of" your current configuration. This provides enables you to support scenarios where you want or need to leverage these providers directly (outside of Vero).

In the future we may provide support for direct APN, GCM and FCM certificate integration: if this is preferable for you, we're keen on your feedback. Please email us at [support@getvero.com](mailto:support@getvero.com).

### b. Enabling push in Vero

Navigate to *Settings > Push Delivery*. Using this menu, you can add one or multiple push provider configurations. To add an integration, select the provider you wish to use and enter the appropriate details. Follow the instructions below for each provider Vero supports.

#### Amazon SNS

![{{ site.data.screenshots.vero.push.providers.aws['title'] }}]({{ site.data.screenshots.vero.push.providers.aws['image'] }})

To integrate Vero with Amazon AWS, give your new push delivery provider a name (this is a Vero-internal name for easy identification, it won't be seen by customers). Select the AWS region (e.g. `us-east-1`) in which your AWS SNS account is configured and add an *Access Key ID* and *Secret Access Key*. We recommend creating a new IAM user for your Vero account, specifying specific access to AWS SNS.

Read more about [creating an IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) in Amazon's help documentation. 

Once you've provided these details, use the *Select a service* dropdown to link your Vero configuration to the appropriate iOS service and/or Android service in SNS.

Hit *Save* to store your credentials.

#### Twilio Notify

![{{ site.data.screenshots.vero.push.providers.twilio['title'] }}]({{ site.data.screenshots.vero.push.providers.twilio['image'] }})

To integrate Vero with Twilio Notify, give your integration a name (this is a Vero-internal name for easy identification, it won't be seen by customers). Add the Twilio Account SID [found here](https://www.twilio.com/console) and your Auth Token for the Twilio account you want to use. Once added, use *Select service* to select the Twilio Notify Service (as listed in Twilio [here](https://www.twilio.com/console/notify/services)) that you want to use with Vero.

Hit *Save* to store your credentials.

## 2. Configure push notifications in your application and Obtain a Device Token

Configuring push notifications in your iOS or Android application requires code changes to register the device and application for push messages  and, in return, receive a notification token to handle push notification messages.

As you will be using Vero on top of either Amazon SNS or Twilio, and to save you any confusion, we recommend using the Twilio documentation for configuring iOS and Android device registration.

- [Registering for push notifications on iOS](https://www.twilio.com/docs/notify/register-for-notifications-ios)
- [Registering for push notifications on Android](https://www.twilio.com/docs/notify/register-for-notifications-android)

**NEED AWS DOCUMENTATION HERE**.

## 3. Identify device tokens with Vero

Now that you've configured token registration, you can begin adding device tokens to your user profiles in Vero. 

Ideally, requests to add device tokens to a user's profile should be done from your server backend (rather than your mobile application) and should be made every time the user opens the application. In scenarios where you cannot add this data from your backend server, ensure that calls made directly from your application are made asynchronously and, ideally, are retried if they fail.

To add a device to the customer profile, you use Vero's API to `identify` a user and provide a new entry to the `channels` by which a customer can be reached. Our [API documentation]() **NEED LINK** covers our `identify` endpoint in detail, but here's the key data you need to add a token to a user:

```
POST 'https://api.getvero.com/api/v2/users/track'

{
  "auth_token": "abc123",
  "id": "james@getvero.com",
  "data": { 
    "age": 30 
  },
  "channels": [
    { 
      "type": "push", 
      "address": "UNIQUE_DEVICE_TOKEN", 
      "platform": "" 
    },
  ]
}
```

## 4. Tracking push "opens" with Vero

When a push notification is sent to a user's device, they can elect to open or interact with the notification. In doing so, your application will run a "handle message" method to acknowledge and deal with the notification.

As part of handling the notification, we recommend tracking the engagement by making a request to Vero's API. We have built a simple API endpoint that makes it possible for you to readily track this data.

### Tracking the engagement in Vero

In order to track the user's open of a push notification, you need to call Vero's API when handling push notifications that are received. As part of your application device callback, you need to extract the `message_data` property provided by Vero and call our API. We've included examples of how to do this on both iOS and Android below.

#### iOS example

Here is an example of how we would recommend handling push notifications and tracking engagement into Vero on iOS:

```
// Called when push message is received
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
  // Vero push notifications includes a "message_data" field which
  // can be used to send feedback on interaction.
  // See example below:

  if let messageDataValue = userInfo["message_data"] {
    let messageData = String(describing: messageDataValue)

    let parameters: Parameters = [
      "auth_token": "YOUR VERO AUTH TOKEN",
      "message_data": messageData
    ]

    Alamofire.request(
      "https://api.getvero.com/api/v2/notifications/acknowledge", method: .post, parameters: parameters
    )
  }
}
```

<br/>

#### Android example

Here is an example of how we would recommend handling push notifications and tracking engagement into Vero on Android:

```
/**
    * CCalled when push message is received
    *
    * @param message The remote message, containing from, and message data as key/value pairs.
    */
    @Override
    public void onMessageReceived(RemoteMessage message) {
      String messageData = data.get("message_data");
    
      if (messageData != null) {
        try {
          URL url = new URL("https://api.getvero.com/api/v2/notifications/acknowledge");
          HttpURLConnection connection = (HttpURLConnection) url.openConnection();
          connection.setRequestMethod("POST");
          connection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
          connection.setRequestProperty("Accept","application/json");
          connection.setDoOutput(true);
          connection.setDoInput(true);

          JSONObject jsonParam = new JSONObject();
          jsonParam.put("auth_token", VERO_AUTH_TOKEN);
          jsonParam.put("message_data", data.get("message_data"));

          DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream());
          outputStream.writeBytes(jsonParam.toString());

          outputStream.flush();
          outputStream.close();

          connection.disconnect();
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    }
```

## 5. Testing push notifications

### Sending a single message

To test a single push notification, first create a push message campaign and save it [LINK TO GUIDE]. You can then select *Preview push* from the dropdown menu on the campaign:

IMAGE HERE

On the following popup, you can search for and select any user record in your Vero account. We will then deliver a test version of the push message to the account selected, in line with the device preferences set as part of the campaign.

In order to test a single push notification you need to ensure that you have added test users to your Vero project. This can be done using the API, as described above, or by importing devices and tokens using CSV [LINK].