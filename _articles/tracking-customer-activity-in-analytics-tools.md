---
title: Tracking email activity from Vero in data warehouses and analytics tools
description: There are three potential ways you can track the messaging activity in Vero in other analytics tools or databases.
categories:
- integrations
layout: articles
---

# Tracking email activity from Vero in data warehouses and analytics tools

There are three ways you can track email campaign activities and data generated from Vero in data stores and analytics tools.

## UTM tags

Most analytics tools, including Mixpanel and Amplitude, detect Google's UTM parameters. These are parameters that are appended to the links in your emails. When customer's click a link, analytics tools take these parameters and record the source of that session.

An example of a link with UTM parameters attached is `http://getvero.com?utm_source=vero&utm_medium=email`. In this scenario, analytics tools would track the `source` as `vero` and the `medium` as `email`.

You can automatically append UTM tags in Vero. [Learn how to integrate Google Analytics' UTM tags]({{site.data.links.articles.utm_tags}}).

## Integrate using a Segment.com write key

Vero integrates cleanly with [Segment]({{site.links.segment}}). You can send data to Vero once you integrate on Segment's tracking libraries. You can also **send email data** activity from Vero **back into Segment** using their email events integration.

The [Segment and Vero integration guide]({{site.data.links.segment_vero_setup}}) details how to send email events from Vero to Segment. This then gives you the ability to pipe this data from Segment into other analytics and business intelligence tools such as Looker, Mode and Amplitude.

We send the same email events we support with our webhooks to Segment.

## Webhooks

![{{site.data.screenshots.vero.integrations.webhooks.overview.title}}]({{site.data.screenshots.vero.integrations.webhooks.overview.image}}) 

Vero can send all email events, including `sent`, `delivered`, `opened`, `clicked`, `bounced`, `unsubscribed` to a webhook you provide.

This enables you to capture and save the data in your own database or data warehouse such as Amazon's Redshift or Google Big Query. This is the most powerful way to collect data from Vero, enabling you to join up your email campaign data with the rest of your customer data, such as internal application usage and payment information. Using a BI tool, like Mode or Looker, you can then query all your customer data and build custom reports that can give you the insights important to your specific business.

![{{site.data.screenshots.vero.integrations.webhooks.detail.title}}]({{site.data.screenshots.vero.integrations.webhooks.detail.image}}) 

When configuring webhooks, selecting *Test URL* will send an example of each webhook to the URL you have specified.
