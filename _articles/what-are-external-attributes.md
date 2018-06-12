---
title: Fusion
description: Vero's Fusion functionality allows you to pull data from your own API or web endpoints so you can personalise your emails on a truly one-to-one basis.
categories:
- email design
layout: articles
---

# Fusion

Vero's Fusion feature allows you to pull data from your own API or web endpoints so you can personalise your emails on a truly one-to-one basis.

It gives you the ability to access data that hasn't been pushed into Vero, and use that data in your email content, subject lines and dynamic attachments.

Example use cases:

- You'd like to send off the top five new products in your store that day.
- Pull in extra information about your users
- You'd like to show relevant items based on the current stock.
- You'd like to send customised content for each demographic (i.e. products based on location or even different languages)

Vero can handle two types of data responses:

## Returning HTML

To do this you use a custom filter we've built using the [Liquid templating language]({{ site.data.links['liquid_docs']}}).

This method allows you to pass data stored in Vero back to your server so that you can manipulate it and send back some custom HTML. The custom HTML that is returned is inserted into the body of your email exactly where you place the following tag:

{% raw %}
	{% fetch_html 'https://www.domain.com/endpoint' %}
{% endraw %}

In this example below, we pass back both a customer-level attribute and an event-level attribute. This data can then be used by your server!

{% raw %}
	{% fetch_html 'https://www.domain.com?param={{user.id}}&param2={{event.number_of_widgets}}' %}
{% endraw %}

You should of course replace the domain in this example with whatever URL you prefer. This URL should return raw HTML that will be dumped into the body of your HTML campaign **exactly** as it is returned.

Here is how you might insert this code into the body of your email:

![{{ site.data.screenshots.vero.fetch-html['title'] }}]({{ site.data.screenshots.vero.fetch-html['image'] }})

This would then be replaced with the correct HTML upon sending.

## Returning JSON

Alternately, you can include an API endpoint and pull JSON data from your web server to be used when creating a campaign.

There are two ways of accessing external JSON data. 

### Add an external data source

To add an external data source for your email, you can select _Data > Add an external source_ from the top menu bar in your content editor and add the API endpoint. 

![{{ site.data.screenshots.vero.fusion-data-inspector['title'] }}]({{ site.data.screenshots.vero.fusion-data-inspector['image'] }})

For example, if the endpoint was:

	http://jsonplaceholder.typicode.com/posts/1

The contents of the endpoint would show:

![{{ site.data.screenshots.vero.json-data['title'] }}]({{ site.data.screenshots.vero.json-data['image'] }})

Then, when you place {{external.title}} inside of your content (or template as well), the result in the preview would show the title pulled in like so:

![{{ site.data.screenshots.vero.external-attributes-preview['title'] }}]({{ site.data.screenshots.vero.external-attributes-preview['image'] }})

### Fetch JSON liquid filter

The fetch_json liquid filter works in a similar way as the fetch_html filter above, but instead expects a JSON response.  

{% raw %}
	{% fetch_json product = 'https://www.domain.com/products/{{event.product_id'}} %}
{% endraw %}

After adding this to your template or email body you can then access the returned data using the `product` liquid variable. e.g:

{% raw %}
	{{json.product.product_name}}
{% endraw %}

## Authentication

At this time Fusion only supports basic HTTP Authentication. You can include basic HTTP Authentication details using the format `http://username:password@yoururl.com/data-feed.json`. This is supported by `fetch_html`, `fetch_json` and JSON fetch methods.

Fusion is an advanced feature. Please get in touch with our 
[support team via email](mailto:support@getvero.com) so we can show you it in action.
