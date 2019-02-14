---
title: Content conflicts
description: Identifying and resolving template and content conflicts
categories:
- email design
layout: articles
---

## What is a Content Conflict?

When a template is updated, our system will do one of two things:

1. Automatically update the content of a campaign to reflect the changes made in the underlying template.
2. Detect a "possible" conflict between the new changes and the content and flag the email before putting the changes in to production.

When there is a structural change made to the template or a change regarding a `vero-editable` tag, Vero then requires the changes to be reviewed in the campaign in case the changes have caused an issue with the rendering of the content.

![{{ site.data.screenshots.vero.template-conflict.editor['title'] }}]({{ site.data.screenshots.vero.template-conflict.editor['image'] }})

## What happens when there is a Content Conflict?

Conflicts arise when you edit a master template and introduce new `vero-editable` areas. In these instances, Vero does not know which text goes where for the underlying campaign. Instead of trying to do things automatically, Vero continues sending your campaign using the original version of the template and lets you know that you need to manually re-define the content of the campaign in order to see your new changes go live.

The Content Conflict notification acts as a failsafe built into the system. If the system detects that the update to the template may cause a conflict to the content, it can ensure that this never makes it to the users inbox.

![{{ site.data.screenshots.vero.template-conflict.tooltip['title'] }}]({{ site.data.screenshots.vero.template-conflict.tooltip['image'] }})

You will see a popup notification in the templates section when you need to manually update any campaigns that have conflicts associated with them.

## What do I look for when I have a Content Conflict?

Conflicts are usually caused by adding, removing, or re-ordering `vero-editables`, so it’s important to look at the editable regions and make sure everything is in order and physically appearing correctly.