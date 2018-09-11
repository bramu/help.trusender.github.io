---
title: Integrate Vero and Segment
description: Use Segment to collect data from multiple sources, including mobile apps, websites, servers, and cloud apps and send it to Vero to trigger personalized customer messages.
categories:
- integrations
layout: articles
---

# Integrate Vero and Segment

Segment is a customer data platform that connects over 200 sources and destinations to empower your team to use their favorite tools to personalize campaigns, analyze customer engagement/ product usage, and more. 

You can integrate Segment and Vero in one of two ways, or both!

1. You can use Segment to collect data from multiple sources, including mobile apps, websites, servers, and cloud apps and send it to Vero to trigger personalized customer messages.

2. Vero can send email events including delivered, opens, clicks and unsubscribes to Segment and on to your other integrations or/and data warehouses.

**Find out how to:**
- [Send data from **Vero to Segment**](#-Send-data-from-Vero-to-Segment)
- [Send data from **Segment to Vero**](#-Send-data-from-Segment-to-Vero)

## Send data from Vero to Segment

1.  Login into <a href="https://segment.com/login">your Segment account</a>, and select a workspace
2.  Add a new source, search for 'Vero' and click **Connect**

    ![{{ site.data.screenshots.vero.integrations.segment.add_source['title'] }}]
    ({{site.data.screenshots.vero.integrations.segment.add_source['image']}})
    
3.  Give your Vero source a name

    ![{{ site.data.screenshots.vero.integrations.segment.source_setup['title'] }}]
    ({{site.data.screenshots.vero.integrations.segment.source_setup['image']}})

4.  Select the Configuration drop-down and copy the **Write Key**.

    ![{{ site.data.screenshots.vero.integrations.segment.config_write_key['title'] }}]
    ({{site.data.screenshots.vero.integrations.segment.config_write_key['image']}})

5.  Log in to Vero and go to **_Settings > Integrations_**
6.  Select **View** next to the Segment integration
7.  Paste or enter your Segment Write Key
    You can find your segment write Key in your source configuration details.
8.  Save. And your Vero events will now start sending to Segment!

In Segment, select your **Vero** Source and from there you’ll be able to add Destinations for where you want to send Vero events. By sending Vero events via Segment to your data warehouse (such as Amazon Redshift or Google BigQuery) you can analyze your customer email engagement with the rest of your customer data using a BI or analytics tool. 

## Send data from Segment to Vero

Once you’ve tracked data in Segment, you can easily send it to Vero.

**In your Segment workspace:**

1.  Navigate to Destinations and select **Add Destination**
2.  Search 'Vero'
3.  Select **_Vero > Configure Vero_**
4.  Add your Vero API Key and Auth Token
    
    You can find your unique API key and Auth token by logging in to your Vero account and navigating to **_Settings > Project   Details_**.
    
    ![{{ site.data.screenshots.vero.integrations.segment.destinations_settings['title'] }}]
    ({{site.data.screenshots.vero.integrations.segment.destinations_settings['image']}})    
    
    ![{{ site.data.screenshots.vero.integrations.segment.enter_vero_api_key['title'] }}]
    ({{site.data.screenshots.vero.integrations.segment.enter_vero_api_key['image']}}) 
    
    ![{{ site.data.screenshots.vero.integrations.segment.enter_vero_auth_token['title'] }}]
    ({{site.data.screenshots.vero.integrations.segment.enter_vero_auth_token['image']}})    
    
5.  Turn on the Integration.
    
    Turn on your Vero integration by clicking the **Enable Integration** toggle. Any events or users that you track with       Segment will then be available inside Vero automatically.

    ![{{ site.data.screenshots.vero.integrations.segment.turn_on_integration['title'] }}]
    ({{site.data.screenshots.vero.integrations.segment.turn_on_integration['image']}})  
    

6.  Test your integration

    To make sure you are receiving data from Segment, check your Logs in Vero.
    
7.  Voilà!

    You can now start sending emails and push notifications to your customers with the data sent to Vero via Segment.

    You can read more about this integration in <a href="https://segment.com/docs/integrations/vero/">Segment's help documentation</a>.




