---
title: Configure AWS SNS IAM access policy to support Vero's mobile push notifications
description: In this article we outline the Amazon AWS IAM policy settings you need in order to setup push notifications with AWS in Vero.
categories:
- mobile push notifications 
layout: articles
---

## Setting up the AWS IAM policy for SNS
    
When [integrating mobile push notifications]({{site.data.links.articles.push_integration}}) in Vero using Amazon AWS SNS as your messaging backend, we recommend the following configuration.

### Configuring a user

We recommend adding a new user to your AWS IAM account specifically for use with Vero. This let's you appropriately limit Vero's access to the appropriate AWS SNS platforms, and nothing else.

To setup an AWS user, [follow this guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) . As part of setup you will be asked to assign a policy to the new user. We recommend creating a new policy in line with the section below.

### Configuring the policy settings for Vero

We typically recommend creating a new security policy to attach to the IAM user that you will use to integrate Vero. For example, you might call this policy `aws-sns-mobile-push-vero`.

We have included an example of a policy below. This includes the minimum access required for Vero to work successfully with AWS. This enables Vero to fetch the your platform endpoints for iOS and Android, add tokens to user profiles and send messages via the resulting AWS ARNs.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowPublishingMessages",
            "Effect": "Allow",
            "Action": "sns:Publish",
            "Resource": [
                "arn:aws:sns:us-east-1:SITE_ID:app/GCM/YOUR_END_POINT_NAME",
                "arn:aws:sns:us-east-1:SITE_ID:app/APNS_SANDBOX/YOUR_END_POINT_NAME"
            ]
        },
        {
            "Sid": "AllowListingServicesAndAddingTokens",
            "Effect": "Allow",
            "Action": [
                "sns:DeleteEndpoint",
                "sns:CreatePlatformEndpoint",
                "sns:ListPlatformApplications"
            ],
            "Resource": "*"
        }
    ]
}
```

If you have any questions regarding AWS IAM permissions, please let us know via [our support email]({{site.data.links.articles.email_us}}).