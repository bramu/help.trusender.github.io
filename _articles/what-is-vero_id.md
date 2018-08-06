---
title: Why is vero_id appended to links?
description: Vero automatically includes the ID of a user when they click a link in your emails in order to track them cross-device.
categories:
- customer data
layout: articles
---

# Why is vero_id appended to links?

Vero automatically includes a parameter on each URL you add to an email campaign. When a customer clicks a link in a campaign, they are redirected to your site including this parameter.

The parameter is named `vero_id` and includes the unique ID of the user who has clicked the link. This is the same ID value you have sent to Vero when adding them using a CSV or via the API.

Adding this parameter enables Vero's Javascript library to automatically identify a user when they land on your site, even if they are not already identified. This enables cross-device tracking and ensures a more complete and accurate customer profile.

## Removing vero_id from your links

We can remove `vero_id` from the outgoing links in your emails at the click of a button. If you would like to remove `vero_id`, please email us at [support@getvero.com](mailto:support@getvero.com).

When disabling appending `vero_id` to your campaigns, Vero's Javascript library will no longer automatically identify users when they click through from an email. If they have <strong>already</strong> been identified on the device they've used to click on the email, this will not have any impact, as they will already have a cookie stored. If they do not have a cookie already, this will mean they are not tracked for that session.
