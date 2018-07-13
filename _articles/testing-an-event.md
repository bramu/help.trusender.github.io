---
title: Testing an event with the events manager
description: Vero is designed to send automated campaigns when a customers trigger a specific event. Usually these events are fired from your website or application using the Vero Javascript API or one of the many other methods you can read about in the Vero developers guide.
categories:
- event data
layout: articles
---

# How to test an event in the event manager

Vero is designed to send automated campaigns when a customers trigger a specific event. Usually these events are fired from your website or application using the Vero Javascript API or one of the many other methods you can read about in the [Vero developers guide]({{site.data.links.vero_api}}). 

The best way to test an automated email workflow is to fire an event, which in turn triggers a campaign or results in a customer entering or exiting a specific segment. You can do this using our API, emulating a customer using your website or application **or** you can use the event manager to manually fire an event inside Vero. The benefit of this approach is that this can be used before or after you have installed the Vero library. 

## Testing an event

In the [events manager]({{site.data.links.event.event-manager}}), choose the event you would like to test. You can see which events have campaigns associated with them in the list or event details view. 

1. Click on the **Test** button in the details view of the chosen event.

2. Choose a customer you would like to test this event for by searching for their customer ID or email address. You can also fire a test event for a new customer by choosing **New customer**.

3. Add event properties (optional) - If you want to pass a particular event property to populate dynamic merge tags you can add those properties by selecting the ‘Include event properties’ option.

4. Hit the **Send** button to send the test event.

## *Warning* 

*Remember that even though you are manually triggering the event, typically for testing, the event will show up in the logs for the chosen customer, and will affect the actual campaigns and segments you have setup. If you are testing this event on a project in **Live mode**, this may result in real customers receiving emails.*

*We recommend you test events in a project set to **Test mode** to avoid accidentally sending emails to customers. Note that when testing in a test mode project, the customer may receive emails when the project is later changed to live mode, typically when these events trigger campaigns with large delays and emails are queued up well into the future.*