---
title: Using a custom sending domain
description: By default, Vero will send your emails using a shared IP and domain configuration. To remove the 'via veromailer.com' (or similar) label from emails delivered by Vero, add and verify a custom domain.
categories:
- deliverability
layout: articles
---

# Sending your emails from a custom domain
    
By default, Vero will send your emails using a shared IP and domain configuration. We use a variety of domains and tiers to help ensure we get customers emails into inboxes. We work with [Mailgun]({{site.data.links.mailgun}}) to deliver your emails.   
    
To improve your deliverability, we recommend [adding your own custom domain](#adding-a-custom-domain-provider). With a custom domain added, we will continue to use our own infrastructure to send your emails, but we will enable domain signing, which tells your recipients' mail servers that you are authenticated to send from your domain.
    
This also means that Vero is truly invisible to your customers.   
    
## Sending without DNS verification   
    
By default when you send from Vero, your emails will look something like this:    
    
![via-getvero](https://www.getvero.com/wp-content/uploads/2014/08/via-getvero.png)    
    
Email clients will show this because the domain of the *From address* used to send the email, `test@chrishexton.com` in the example above, does not match the domain of the server that sent the email, `getvero.com` in the example above.   
    
By setting up a custom domain your recipients will no longer see the `via xyz.com` message.   
    
Note that you might see `via getveromail.com`, `via veromailer.com` or some other domain as we send from multiple domains to ensure maximum deliverability for all our customers. 
    
## Adding a custom domain provider

Adding a custom domain as a new provider in Vero is easy. However, in order to verify your domain you will need to add two to three records to your domain's DNS configuration. 

Follow these steps to start using your custom domain:

1. Navigate to your project settings by going to app.getvero.com/settings/email-delivery and click on 'Add Custom Domain' at the bottom of the page.
2. Give your domain a 'Name' (this is useful if you need more than one custom domain per project).
3. Enter your domain name exctly into the 'Domain' field, and then hit 'Save'.
4. Once saved, Vero will generate and display the SPF (TXT), DKIM (TXT), CNAME and MX records you need to add to your domain's DNS configuration settings. **Do this before continuing to the next step**. Please refer to your domain hosts help documentation.
5. Once you have added these DNS records to the settings of wherever you manage your domain, hit the 'Verify Records' button so we can validate that they have been correctly configured. Note that it can take as many as 24 hours for your DNS records to propagate and for Vero to recognise the valid records.

Once your domain has been verified, you can select this domain from the 'Email provider' in the advanced settings dropdown on each campaign or email workflow node. You can also mark as default to make sure all emails are sent via this domain. 
    
![{{site.data.screenshots.vero.settings.email-delivery.verified.title}}]({{site.data.screenshots.vero.settings.email-delivery.verified.image}})

**Note:** CNAME and MX records are not required, however we highly recommend adding these to your domain host settings to ensure you get the best deliverability and reporting from Vero. 

If you need some help during any of these steps, don't hesitate to [get in touch]({{site.data.links.email_us}}).

## Marking your custom domain as the default provider

When you add a custom domain, it is considered as a separate email provider, this is useful if you want to send from multiple domains in the same project.

If you want to make sure all emails sent from Vero use a specific custom domain, you can mark it as the default by navigating to settings > email-delivery and hitting 'Mark as Default' on one of the listed providers or custom domains.

![{{site.data.screenshots.vero.settings.email-delivery.mark-as-default.title}}]({{site.data.screenshots.vero.settings.email-delivery.mark-as-default.image}})
    
## Setting up a custom CNAME   
    
By default, we provide a CNAME record for the subdomain `email.yourdomain.com`. This CNAME is used to track links.
    
If you already have a CNAME setup on the `email` subdomain, please [email us]({{site.data.links.email_us}}) and we will update the subdomain to something else that works for you. 
    
    
