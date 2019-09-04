---
layout: articles
title:  "Universal Links"
categories: "click-tracking, universal-links, deeplinking, mobile"
---

# Click-tracking and Deep links

## The problem

In order to track clicks, email service providers like our delivery partner Mailgun transform the links in your emails to a link using your CNAME (eg. `http://email.veromailer.com/c/{encoded hash}`) which points back to mailgun.org. They track the click, then redirect to the original url.

Because of this url rewriting, deeplinking requires some additional steps.

## Solution

The solution requires a CDN, with an s3 bucket hosting your _apple-app-site-association_ and _digital asset links_, as well as adding the attribute `deeplink="true"` to any link you wish to open in the mobile app in your campaigns. We'll go through these step-by-step, using [SendGrid's excellent guide](https://sendgrid.com/docs/ui/sending-email/universal-links) as a template.

### Create your _apple-app-site-association_ and _digital asset links_ files

Example apple-app-site-association file:

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "[YOUR APP ID HERE]",
        "paths": [
          "/uni/*"
        ]
      }
    ]
  }
}
```

Example assetlinks.json file:

```json
[
  {
    "target": {
      "namespace": "android_app",
      "package_name": "[YOUR APP’S PACKAGE NAME]",
      "sha256_cert_fingerprints": [
        "[YOUR APP FINGERPRINT HERE]"
      ]
    },
    "relation": [
      "delegate_permission/common.handle_all_urls"
    ]
  }
]
```


### Set up a CDN and bucket

Follow these steps in the SendGrid guide: [Setting Up Universal Links Using Cloudfront](https://sendgrid.com/docs/ui/sending-email/universal-links/#setting-up-universal-links-using-cloudfront)

Where it talks about "the domain your link branding is configured for", it is referring to the domain mailgun uses in your click-tracked links (eg. email.example.com).

*Be careful! Be sure to replace all references (such as Origin Domain Name) to `sendgrid.net` with `mailgun.org`.*

### Flag your deeplinks

Visit your campaigns and give the links in them which you wish to open in your mobile app the attribute `deeplink="true"`.

Example:

```html
<a href="links.example.com" deeplink="true">Link to your app!</a>
```

This will tell Mailgun to add a `/uni/` path to the url when it rewrites the link, ensuring it matches the path in your apple-app-site-association and assetlinks.json files.

### Resolve the links in your application

You'll need to ensure your applications resolve these links to continue click-tracking. The SendGrid Guide explains how: [Resolving SendGrid Click Tracking Links](https://sendgrid.com/docs/ui/sending-email/universal-links/#resolving-sendgrid-click-tracking-links).

Once the links are resolved, your app can now open the link.

## Flow

If you have followed all the steps correctly, the flow should work like below.

![{{ site.data.screenshots.vero.universal-links['title'] }}]({{ site.data.screenshots.vero.universal-links['image'] }})
