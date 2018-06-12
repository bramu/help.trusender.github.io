---
title: Integrate Vero and Stitch 
description: ETL your Vero data to your data warehouse with Stitch.
categories:
- integrations
layout: articles
---

<div class="alert alert-success">
  <p class="no-top-margin">
    <strong>This integration is officially supported by Stitch.</strong>
  </p>
  <p>
    You can read their integration guide <a href="{{site.data.links.integrations.stitch_help_doc}}">here</a>.
  </p>
</div>

# Integrate Vero and Stitch 

## Connecting Vero to Stitch

### Add Vero as a Stitch Data Source

To add Vero as an integration in Stitch:

- Sign into your Stitch account and select **Add Integration** from your _Dashboard_.
- Select **Vero**.
- Name your integration. This name will display on the integration but, most importantly, it will be used to create the schema in your destination. We use something like `vero_production` for our _Vero Production_ Vero project. In Stitch, using this example, you'd name the integration `Vero Production`. **Note:** Schema names cannot be changed after you save the integration.
- Click **Save Integration**.

### Generate a Vero Webhook URL

Once you've saved the integration, Stitch will redirect you to a page that displays your Vero webhook URL and token. This will look something like this:

![{{ site.data.screenshots.vero.integrations.stitch.generate_url['title'] }}]({{site.data.screenshots.vero.integrations.stitch.generate_url['image']}}) 

This URL is to be **kept secret**. With this URL, data can be written to your data warehouse. As Stitch say, similar to an API key, keep this URL secret, and keep it safe. Note that you can generate a second URL at any time should it be required.

Copy your new URL, click **Continue** and head over to Vero.

### Set up Webhooks in Vero

The last step is to setup webhooks in your Vero account with your new URL. To do this:

1. Sign in to Vero and go to the correct Vero Project.
2. Click **Settings** at the bottom of the navigation menu.
3. Go to the **Integrations** tab.
4. Click **View** next to the _Custom Integration (Webhooks)_ option.
5. Click on **Add Webhooks Integration**.
6. In the _Notification URL_ field, paste the Stitch-generated URL from the section above.
7. Click **Save**.
8. After the webhook has been saved, you can select the individual events you want to track. Use the checkboxes to select events. Our advice is to tick every box: ![{{ site.data.screenshots.vero.integrations.webhooks.detail['title'] }}]({{site.data.screenshots.vero.integrations.webhooks.detail['image']}}) 
9. Hit **Save** and you're ready to go!

## Replication

Now that you've successfully conected your Vero and Stitch integration, Stitch will continuously replicate your webhook data into your data warehouse.

Because Vero data is sent to Stitch in real-time, Stitch isn't able to load historical data from Vero. As such, Stitch's Vero integration uses _Append-Only Replication_, a type of replication where new data is appended to the end of your data warehouse tables. 

Existing rows are **not** updated – updates are simply added to the end of the table as new rows. Data stored this way can provide insights and historical details about how those rows have changed over time.

You can read more about Stitch's replication approaches in their [documentation]({{site.data.links.integrations.stitch_help_doc}}).

## More information

For more information regarding the schema created by Stitch when replicating Vero data, how to query for the latest data, and URL and webhook security, refer to Stitch's own help documentation regarding the [Vero to Stitch]({{site.data.links.integrations.stitch_help_doc}}) integration.
