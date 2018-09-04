---
title: Adding a placeholder event
description: Sometimes when you are creating or planning email workflows you may not have the event you need tracked in your website or application yet. We don’t think this should stop you from getting your campaigns set up correctly. 
categories:
- event data
layout: articles
---

# How to add a placeholder event in Vero

Sometimes when you are creating or planning email workflows you may not have the event you need tracked in your website or application yet. We don’t think this should stop you from getting your campaigns set up correctly. 

It is possible to add events in Vero that act as placeholders for events that have not been tracked yet. This is useful for setting up and testing your email workflows before an engineer has added the Vero tracking code.

## Adding events in the events manager

The [events manager]({{site.data.links.events.event-manager}}) shows a list of events that have been tracked via the Vero API ([read about the Vero API here]({{site.data.links.vero_api}})). This list also shows placeholder events created in Vero that have not been tracked yet. To create your own placeholder event, hit the **+ Add Event** button. 

![{{ site.data.screenshots.vero.event-manager.add-event['title'] }}]({{ site.data.screenshots.vero.event-manager.add-event['image'] }})

Give your event a name that has not already been used. You may also give this event a description to help other team members understand what this event is used for.

![{{ site.data.screenshots.vero.event-manager.add-event-modal['title'] }}]({{ site.data.screenshots.vero.event-manager.add-event-modal['image'] }})

Hit the **Add event** confirmation button and your event will be created.

You can now choose this event in your campaigns or segments. However, campaigns will not be fired and customers will not enter a segment based on this event until it has been tracked using the Vero library, read the [API documentation]({{ site.data.links.developers }}) to learn more about tracking events.

**Bonus:** Each event in the events manager has a **Setup** tab which shows the code needed to track this event.

## Adding events in a campaign

When designing a campaign, you can also type a new event name and quickly create an event by hitting ‘create new event’ straight from the trigger select box. 

![{{ site.data.screenshots.vero.event-manager.new-campaign-event['title'] }}]({{ site.data.screenshots.vero.event-manager.new-campaign-event['image'] }})

Similar to creating events in the events manager, these events are placeholders. Campaigns will not be triggered until the selected event has been tracked using the Vero library, [read the API documentation]({{site.data.links.developers}}) to learn more about tracking events.