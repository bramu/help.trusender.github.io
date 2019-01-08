---
title: Create a Multi-Language campaign
description: It is now possible to send multi-language campaigns in Vero. Using the multi-language feature of Vero you can create multiple langauge versions of an email which include localised content for each langauge you want to send in. This feature is best suited if you have already translated your content to multiple langauges.
categories:
- campaigns
layout: articles
---

# Create a Multi-Language campaign

It is now possible to send multi-language campaigns in Vero. Using the multi-language feature of Vero you can create multiple langauge versions of an email which include localised content for each langauge you want to send in. This feature is best suited if you have already translated your content to multiple langauges.

In order to tell which language version of an email to send to your customers, Vero reserves the `locale` property for each customer. 

**For example:** If a customer has the property `locale` set to `es` then Vero will assign the user to receive the `es` language variation you set up. [Learn more about customer properties]({{site.data.links.articles.customer_properties}}).

*Note: Vero does not offer a translation service, multi-language campaigns are best suited for campaigns that have already been translated. For translation services, check out: [Transifex](https://www.transifex.com/) or [Smartling](https://www.smartling.com/)*

## Creating a new multi-language campaign

To create a new multi-langauge campaign follow these steps:

1. Create a new campaign (mutli-language emails are available on any type of campaign)
2. Setup your campaign as you normally would, with your entire list of users to begin with. 
3. This first variation will be your "default language". This is essentially the control email and will contain the conditions with which the language variations are built from. If most of your users are english speaking, we recommend using the first (default) language version as english. This means that if a customer doesn’t have a locale set then they will still receive the english version.
4. Click on the locale option in the header to open the languages menu.
  ![{{ site.data.screenshots.vero.multi-languages.open-multi-language-menu['title'] }}]({{ site.data.screenshots.vero.multi-languages.open-multi-language-menu['image'] }})
5. Add a language version to this campaign by hitting ‘+ add’
  ![{{ site.data.screenshots.vero.multi-languages.add-a-language['title'] }}]({{ site.data.screenshots.vero.multi-languages.add-a-language['image'] }})
6. Choose the language you want this content version to be sent to. Any customer with the corresponding locale will be sent that version of the email.
  ![{{ site.data.screenshots.vero.multi-languages.choose-a-language['title'] }}]({{ site.data.screenshots.vero.multi-languages.choose-a-language['image'] }})


## Adding languages to an existing campaign

If you are adding language variations to an existing campaign, please be aware that the campaign is Live and any changes will automatically be live.

To edit an existing campaign you can pause the campaign, edit as above and then un-pause the campaign.

Or alternately you can add a condition to your default content that will ensure no users receive the language variations until they are completed.
Typically we recommend adding the locale property of the default language. So if your default language is English add the condition "has property locale equal to en".

This will ensure only English users receive the content and this content will be your default variation.

When you are ready to go live with your language variations, remove this condition and users will start being sent the correct content.


### Language Codes

Listed below are the codes that should be used on the `locale` customer property:

<table>
  <thead>
    <tr>
      <td><strong>Language</strong></td>
      <td><strong>Code</strong></td>
    </tr>
  </thead>
  <tbody>
    {% for language in site.data.languages %}
    <tr>
      <td>{{language.name}}</td>
      <td>{{language.code}}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

<!-- 

open-multi-language-menu:
      image: /assets/screenshots/vero.languages-1.png
      title: Open the multi-languages menu in the header
    add-a-language:
      image: /assets/screenshots/vero.languages-2.png
      title: Hit the add link in the sidebar to add a language
    choose-a-language:
      image: /assets/screenshots/vero.languages-3.png
      title: Choose a language from the list -->
