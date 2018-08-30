---
title: Mobile push notifications – Integration Guide
description: Setup guide for iOS and Android mobile push notifications in Vero
categories:
- mobile push notifications
layout: articles
---

<div class="alert alert-info">
  <p class="no-top-margin">This feature is currently in <strong>beta</strong>.</p>
  <p>If you're interested in trying it out, please email us at <a href="mailto:support@getvero.com">support@getvero.com</a>.</p>
</div>

# Mobile push notifications – Integration Guide

## Table of contents

1. [Configure push in your application](#1-configure-push-in-your-account)
2. [Configure push notifications in your application](#2-configure-push-notifications-in-your-application)
3. [Identify device tokens with Vero](#3-identify-device-tokens-with-vero)
4. [Tracking push "opens" with Vero](#4-tracking-push-opens-with-vero)
5. [Testing push notifications](#5-testing-push-notifications)

----

## Definitions

- **Push notification**. A notification sent to an iOS or Android device using those platforms' inbuilt notification infrastructure. A push notification is different from a "web push" message or an SMS.
- **Push delivery provider**. A service that sends raw push messages to the iOS and Android push notification networks. Vero sits "on top of" your push delivery provider.
- **Device token**. 

----

## 1. Configure push in your account

### a. Supported push delivery providers

Vero sends push messages to your customers using popular push delivery providers. At this time we support the following providers:

- [Amazon SNS](https://aws.amazon.com/sns/)
- [Twilio Notify](https://www.twilio.com/notify)

By leveraging these partners, Vero allows you to manage your APN, GCM and FCM certificates in a central place (Twilio or Amazon SNS) and use Vero "on top of" your current configuration -- providing support for scenarios where you want or need to leverage these providers directly outside Vero.

In the future we may provide support for direct APN, GCM and FCM certificate integration -- if this is preferable for you, we're keen on your feedback [LINK TO WHEREVER THAT GOES]!

### b. Enabling push in Vero

Navigate to *Settings > Push Delivery*. Here you can add one or multiple push provider configurations.

To add an integration, select the provider you wish to use and enter the appropriate details.

#### Amazon SNS

![{{ site.data.screenshots.vero.push.providers.aws['title'] }}]({{ site.data.screenshots.vero.push.providers.aws['image'] }})

To integrate Vero with Amazon AWS, name your new integration (this is a Vero-internal name for easy identification). From there, select the AWS region (e.g. `us-east-1`) in which your AWS SNS account is configured and add an *Access Key ID* and *Secret Access Key*. We recommend creating a new IAM user for your Vero account, specifying specific access to AWS SNS.

You can read more about creating an IAM user here [LINK]. The minimal access rights to grant are [LINK].

Once you've provided these details, *Select a service* to link the appropriate AWS SNS iOS service and Android service[[1]](#_msocom_1)  to Vero.

#### Twilio Notify

![{{ site.data.screenshots.vero.push.providers.twilio['title'] }}]({{ site.data.screenshots.vero.push.providers.twilio['image'] }})

## 2. Configure push notifications in your application

Configuring push notifications in your iOS or Android application requires code changes to both register the device and receive a token and to handle push notification messages.

To avoid duplication or confusion, we recommend using either the Twilio or AWS documentation for configuring iOS and Android device registration. Twilio's documentation is the most robust, and we recommend you refer to this here:

- [Registering for push notifications on iOS](https://www.twilio.com/docs/notify/register-for-notifications-ios)
- [Registering for push notifications on Android](https://www.twilio.com/docs/notify/register-for-notifications-android)

## 3. Identify device tokens with Vero

Now that you've configured how Vero will send your push notifications, you can begin adding device tokens to your user profiles in Vero. These tokens are used to identify and address a user's device to which messages will be sent.

Ideally, requests to add device tokens to a user's profile should be done from your server (rather than your mobile application) and should be made every time the user opens the application. In scenarios where you cannot add this data from your backend server, ensure that calls made directly from your application are made asynchronously and, ideally, are retried if they fail.

To add a device to the customer profile, you `identify` a user with the `channels` hash. You can read more on this in our API documentation, but there's an example:

```
POST 'https://api.getvero.com/api/v2/users/track'

{
  "auth_token": "abc123",
  "id": "james@getvero.com",
  "data": { "age": 30 },
  "channels": [
    { "type": "push", "address": "UNIQUE_DEVICE_TOKEN", "platform": " " },
  ]
}
```

## 4. Tracking push "opens" with Vero

When a push notification is sent to a user's device, they can elect to open (or, in most cases, interact with) the message. In doing so, your application will run a "handle message" method to acknowledge and deal with the notification.

### Sending opens to Vero

As part of setup, you will configure the code to handle push notifications when they are received on a user's device.

In order to track the user's open of a push notification, you need to call Vero's API as part of this handling and tell Vero that the user has opened the message. 

As part of your application device callback, you need to extract the `message_data` property provided by Vero. We've included examples of how to do this on both iOS and Android below.

#### iOS example

```
// Push notification received
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
  // Vero push notifications include a "message_data" field which
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

#### Android example

SNIPPET HERE

## 5. Testing push notifications

### Sending a single message

To test a single push notification, first create a push message campaign and save it [LINK TO GUIDE]. You can then select *Preview push* from the dropdown menu on the campaign:

IMAGE HERE

On the following popup, you can search for and select any user record in your Vero account. We will then deliver a test version of the push message to the account selected, in line with the device preferences set as part of the campaign.

In order to test a single push notification you need to ensure that you have added test users to your Vero project. This can be done using the API, as described above, or by importing devices and tokens using CSV [LINK].