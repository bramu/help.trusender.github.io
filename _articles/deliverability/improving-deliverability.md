---
title: Improving your deliverability
permalink: "/articles/:title"
categories:
- deliverability
layout: articles
---

# Improving your deliverability

Deliverability refers to the percentage of emails that reach your customers' inboxes. 

The term deliverability does not describe the *Delivered* figure you see in Vero. This figure represents the number of emails accepted by recipient email providers (like Gmail). An email is marked as *Delivered* when Vero receives confirmation it has been received. 

Deliverability refers to the percentage of emails that are placed in the Inbox. Note that once delivered, an email may be placed in either the Inbox or Spam folders.

Deliverability is usually best inferred from your open and click results. It is influenced primarily by four key factors:

1. The content of your emails.
2. The engagement of your customers (whether they open or click your emails).
3. Your sending volume and fluctuations over time.
4. The underlying infrastructure, comprised of the domain and IP address(es) you use to send your emails.

Vero's aim is to help you send more highly targeted, more useul **content**, at the right time. Using Vero empowers you to send more effective emails, helping you improve numbers one and two above by ensuring your content is relevant and that your customers are as engaged as possible. 

Points three and four require monitoring and management. Tackling point four, infrastructure, is key to good deliverability. Vero offers two ways for you to manage your email infrastructure: [plug and play](#plug-and-play) and [bringing your own email infrastructure](#bring-your-own-email-infrastructure). These approaches are covered in detail in this help article.

<div class="blue-panel">
  <h2>Deliverability Support</h2>
  <p>By default, Vero sends your emails on shared infrastructure. We maintain and monitor a set of shared IPs and domains and work to ensure high levels of deliverability for customers using this setup.</p>
  <p>In instances where you are not seeing the results you are after, we recommend you first determine the extent of and reasons for, your deliverability challenges. Read <a href="#diagnosing-deliverability">diagnosing deliverability</a> for guidance on the tools we recommend you use to do this in a reliable and repeatable way.</p>
  <p>Our support team is here to guide you and help you interpret the results you are seeing. Whilst our shared infrastructure is effective, deliverability is an advanced topic and, for the best results, it's worth investing in the tools and knowledge to monitor and improve your results as your business scales.</p>
  <p>If you are experiencing problems, as assessed using the right tools, the next step is to ensure you have <a href="#signing-your-domain-for-sending-recommended">authenticated your domain for sending via Vero</a> (recommended) and, potentially, that you <a href="#adding-dedicated-ips-to-control-your-reputation-optional">setup your own dedicated IPs</a> (advanced). Having your own dedicated IPs requires more management as a Vero customer, but gives you complete complete isolation from the content and patterns of others' sending.</p>
  <p>An alternative approach is to use Vero in conjunction with one of the <a href="#supported-email-service-providers">email platforms</a> that specializes in email deliverability such as Mailgun, Mailjet or Sendgrid.</p>
</div>

## Diagnosing deliverability issues

It is difficult to get an insight into your deliverability based on email statistics alone. The primary reasons for this are:

- The *Delivered* result represents the numer of emails accepted by the receiving email servers, such as Gmail, **not** the number that go to the inbox.
- *Open* and *Click* results are likely to fluctuate between sends, irrespective of movements in your deliverability, so they are unreliable as a means of determining complete correlation with deliverability.
- Email providers regularly change how they handle and place emails, updating algorithms without a great deal of information being passed along to senders.

There are three tools we recommend to help you understand and improve deliverability.

The first is [MailTester]({{data.links.mail-tester}}), a free tool that helps you diagnose very basic problems with your emails that can prevent them being inboxed. A score of 9/10+ is ideal and generally suggests quality deliverability.

The other tools we recommend are designed to help you assess and benchmark movements in your deliverability over time:

- [250Ok]({{data.links.250ok}}) is a modern tool that provides comprehensive seed listing services so you can see the realtime placement of your emails in inboxes across all of the main (and many smaller) email providers. 
- [Return Path]({{data.links.return-path}}) is perhaps the most widely-known deliverability assessment and monitoring tool on the market, providing seed listing and other services that enable you to track the success of each send.

If you believe you are experiencing deliverability challenges, or would like to begin learning about and investing time in improving your email numbers, we highly recommend 250Ok or Return Path as tools that will enable you to make **informed** decisions in a reliable fashion.

## Common deliverability challenges

Improving deliverability can take time, depending on which component needs tweaking. The most common causes of deliverability issues we see at Vero include:

1. Whether your recipients are opening and clicking your emails, and have done so historically (particularly if you have not changed your sending infrastructure).
2. Using domains or subdomains that have previously had little or no volume sent on them and start seeing a lot of volume.
3. If recipients do, or have, marked your emails as spam and your content has not changed dramatically (causing pattern matching).

Changing the underlying infrastructure **alone** is unlikely to improve your deliverability overnight. To affect change most rapidly, you need to show the receiving providers that you are committed to sending engaging content, that your customers engage with this content **and** that you're using a clean setup with relatively consistent volume from week to week. 

It is possible to go from inboxing **zero** emails on popular platforms like Gmail to inboxing nearly all emails if you work to change the four key fundamentals in conjunction with each other. We have seen many customers do this and with patience the results are typically very rewarding.

## Managing your sending infrastructure

### 🔌 Plug and play

By default Vero will manage your email infrastructure for you. 

This option is best suited to small customers who want a full-stack solution and need to get started quickly. If you are a larger organisation with multiple stakeholders and specific deliverability needs then this option may not be the best fit for you.

#### Explaining Vero's default configuration

Vero partners with [Mailgun]({{site.data.links.mailgun}}) to send emails. We have worked with Mailgun successfully for several years.

If you send emails via Vero with zero custom configuration then Vero will send your emails using one of our own internal, shared domains (such as `veromailer.com` or `getveromail.com`). These domains run on top of a set of shared IP addresses. We manage multiple tiers representing various domain and IP configurations. It is for this reason that we manually verify all new Vero accounts for sending: to ensure quality results for all customers using our shared infrastructure.

We monitor the reputation of our internal IP addresses and domains and adjust the mix of customers, volume and IPs as required to maintain a good reputation of each setup.

When using Vero with this setup, email clients will include a message that shows recipients the domain being used for each email sent.

![via-getvero](https://www.getvero.com/wp-content/uploads/2014/08/via-getvero.png)

#### Authenticating your domain for sending (recommended)

If you're using Vero's internal infrastructure as detailed above, we recommend authenticating your own domain. In this scenario we will still send from our shared IPs, but not via shared domains (such as `veromailer.com` or `getveromail.com`). Authenticating your own domain will therefore also remove the `via veromailer.com` displayed in email clients like Gmail.

As detailed above, a key factor in better deliverability is your domain's reputation over time. By authenticating your own domain your content and volume management will isolated directly against your domain. This gives you more control.

To authenticate your domain for sending via Vero, you will need to add DNS records. To setup the required DNS records, follow these steps:

1. Add the domain you want to send from under [Settings > Email Delivery]({{site.data.links.app.settings.email-delivery}}) in Vero. 
2. Select *Request DNS records* on this page. Vero will generate the SPF, DKIM and CNAME records you need to add to your domain.
3. Add the DNS records to your domain. Every DNS provider has a different way of managing this. Googling *"Setup DNS records"* is typically the fastest way to find your provider's specific instructions. 
4. Once you have added the DNS records to your domain, return to [Settings > Email Delivery]({{site.data.links.app.settings.email-delivery}}) and select *Verify DNS*.
5. Vero will check, in real time, that the DNS records are setup correctly on your domain. Once verified, emails will begin going out from the domain you have authenticated. If you cannot verify your DNS records after 20 minutes, [please email us]({{site.data.links.email_us}}).

**Note** that we provide a CNAME record using the subdomain `email`, such as `email.yourdomain.com`. This CNAME is used to rewrite links in your emails. If you already have a CNAME configured on the `email` subdomain, please [email us]({{site.data.links.email_us}}) and we will update the subdomain to something else that works for you.

#### Adding dedicated IPs to control your reputation (optional)

A dedicated IP address is a unique IP address dedicated exclusively to your individual Vero account. This gives you **complete** control of your own sending reputation, as your reputation will be influenced solely by your own content, your own volume and your own email engagement.

Before we can assign a dedicatd IP address, you must have [authenticated your domain](#signing-your-domain-for-sending-recommended) for use with Vero.

Please  [contact us via support]({{site.data.links.email_us}}) in order to request a dedicated IP. We will let you know if this is the best approach for your scale and size and help you assess whether you have the resources and processes to ensure you can manage a dedicated IP for success.

### Bring your own email infrastructure

Rather than using Vero's internal infrastructure, Vero allows you to send your emails via dedicated email service providers including Mailgun, Sendgrid and Mailjet. 

Many customers elect to use this approach and we recommend it in scenarios where you have a need for a high level of deliveraiblity consulting or you:

- Send a tens of millions of emails.
- Send emails at a high frequency to a smaller subset of users.
- Have specific needs based on your sending history.

The benefit of this approach is that you can consult the dedicated deliverability experts as these service providers, whilst still getting all of Vero's value capturing data, defining segments, managing dynamic email content and reporting across campaigns (and providers).

Using a third-party email provider is as simple as adding credentials for your provider to Vero. We have made this process very easy and it is becoming more and more widely adopted by Vero customers.

#### Supported email service providers

You can currently select six options for integration with a dedicated sending provider: Mailgun, Sendgrid, Mailjet, Dyn and Mandrill. The following table shows each provider and the related functionality supported by Vero.

<table>
  <tbody>
    <tr>
      <th></th>
      <th>Mailgun</th>
      <th>Sendgrid</th>
      <th>Mailjet</th>
      <th>Dyn</th>
      <th>Mandrill</th>
    </tr>
    <tr>
      <td>All email interactions (opens, clicks) available in Vero</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>All email interactions (opens, clicks) available in chosen provider</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>Send all campaign types through this provider</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>Synchronize bounces into Vero</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>Choose this provider on a per campaign basis in Vero</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
  </tbody>
</table>

To enable a third-party provider, head to [Settings > Email Delivery]({{site.data.links.app.settings.email-delivery}}) in your Vero account, select the appropriate provider from the list, enter your credentials and save your changes.

**Note** you can add multiple providers, or provider configurations (such as multiple Mailgun accounts), to your Vero account. You may select which provider you use on a **per campaign basis** and you may define a default that is pre-selected for new campaigns.

![{{ site.data.screenshots.vero.esp-integrations['title'] }}]({{ site.data.screenshots.vero.esp-integrations['image'] }})

We are interested in supporting other email providers – please [email us]({{site.data.links.email_us}}) if there is a sending configuration you'd like us to include.
