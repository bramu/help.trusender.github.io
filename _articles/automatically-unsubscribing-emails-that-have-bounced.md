---
title: Automatically unsubscribing emails that have bounced
description: Vero automatically handles the subscription status of customers whose emails bounce.
categories:
- deliverability
layout: articles
---

# Automatically unsubscribing emails that have bounced

Vero automatically handles the subscription status of customers whose emails bounce.

## Hard bounces

A hard bounce occurs when an email is rejected by the recieving mail server because the recipient’s email address is invalid, disabled, inactive or otherwise permanently unavailable.

Vero automatically suppresses and marks users as "hard bounced" when we receive a `5xx`, permanent failure message from the delivery provider.

## A soft bounce

A soft bounce is a a temporary email delivery failure. They occur when the recipient's mail server returns that it cannot, at this time, receive emails on behalf of the recipient. 

A soft bounce can occur for a number of reasons:

- The recipient's mailbox is full,
- The receiving server is down or swamped with messages,
- The message size is too large,
- The recipient's settings do not allow for email from the sender, 
- Suspicious or spammy content has been detected.

When an email address returns a soft bounce 10 times within a 30 day peirod, Vero automatically suppresses the customer and marks them as "hard bounced".
