---
title: List of Liquid functions / dynamic templating variables
description: Below are a list of liquid functions and dynamic template variables you can use when building out your email templates in Vero.
categories:
- email design
layout: articles
common_issues: true
---

# List of Liquid functions / dynamic templating variables

## Vero Templating Variables

### `event`
Event Properties tracked with the event:

Example:

      {% raw %}
        {{ event.product_title }}
      {% endraw %}

### `user`
User Properties tracked on the Customer:

Example:

      {% raw %}
        {{ user.first_name }}
      {% endraw %}

### `email`
Campaign related information, contains properties: `campaign_name`, `email_name`, `email_test_name`

Example:

      {% raw %}
        Series (if applicable): {{ email.campaign_name }} Title: {{ email.email_name }} Test: {{ email.email_test_name }} 
      {% endraw %}

### `extra`
Event related metadata, contains properties: 
  - `time`
    - `time.event` The event's triggered_at timestamp
    - `time.now`   The current timestamp
  - `variation_id`
  - `campaign_id`
  - `campaign_type`

### `environment`
Project details, contains properties: `project_id`, `project_name`

Example

      {% raw %}
        Project ID: {{ environment.project_id }} Project Name: {{ environment.project_name }}
      {% endraw %}

### `url`
Various URLs, contains properties: 
  - `permalink`
  - `permalink_link`
  - `permalink_url`
  - `unsubscribe`
  - `unsubscribe_link`
  - `unsubscribe_url`
  - `opt_in`
  - `opt_in_link`
  - `opt_in_url`
  - `remove_preferences_links`

### `unsubscribe`
Shortcut alias for `{{ url.unsubscribe }}`

### `permalink`
Shortcut alias for `{{ url.permalink }}`

### `utm`
Google UTM tags, contains properties:
  - `source`
  - `medium`
  - `content`
  - `campaign`
  - `term`

### `\_setting`
Various Project Wide settings, contains properties:
  - `max_fetch_html_per_second`
  - `max_fetch_external_attributes_per_second`
  - `fetch_html:cache`
  - `extern_att:cache`
    
## Number precision

This works with any Liquid variable which are numbers.

Here is an example:

	{% raw %}
	{{item.price | precision: 2}}
	{% endraw %}
 
## Utilities

There are a number of convenience functions you can use in Vero. 
	
	{% raw %}
	{%random 20%} => 15 (inserts a random number between 0 and the number specified)
	{%capture a_variable%}{%random 20%}{%endcapture%}
	{{a_variable}} => 15

	user.email = "support+test@getvero.com"
	{{user.email | md5}} => 20e815c8877d46cd29d162754b0f2773

	user.email = "support+test@getvero.com"
	{{user.email | sha1}} => 1e71615687de8192e23949040adc380ade233f3c
	{% endraw %}

## Formatting

This works with any Liquid variable which are character, decimal (integer) number (base 10), exponential floating-point number, floating-point number, integer (base 10), octal number (base 8), a string of characters, unsigned decimal (integer) number, number in hexadecimal (base 16)
	
It follow the basic printf formatting specifiers (
[Printf format cheat sheet](http://alvinalexander.com/programming/printf-format-cheat-sheet))
 
Here is an example:

	{% raw %}
	event.invoice_ref = 12345
	{{event.invoice_ref | format: '%05d'}} => 12345

	event.invoice_ref = 123
	{{event.invoice_ref | format: '%05d'}} => 00123

	event.invoice_ref = 1
	{{event.invoice_ref | format: '%5d'}} => '    1'
	{% endraw %}
 
You can also humanize integers using the 'humanize' method:

	{% raw %}
	event.price = 10
	{{event.price | humanize}} => ten
	{% endraw %}
	
## Encoding

This is primarily useful when you want to pass variables such as email address to URL params.

Here is an example:

	{% raw %}
	user.email = 'damien+test@getvero.com'
	{{ user.email | encode }} => 'damien%2Btest%40getvero.com'
	{% endraw %}

## Date/Timezone precision

This works if you track a date following the [ISO 8601 format](https://en.wikipedia.org/wiki/ISO_8601)

Here are some examples:

	{% raw %}
	purchase_date = "Thu Nov 29 2001 14:33:20 UTC"
	{{ purchase_date | time_zone: 'Sydney' }} => 2001-11-30 01:33:20 +1100

	purchase_date = "29/11/2001 00:00:00 -0900"
	{{ purchase_date | time_zone: 'Sydney' }} => 2001-11-29 20:00:00 +1100

	purchase_date = "Thu Nov 29 2001 14:33:20 UTC"
	{{ purchase_date | time_zone: 'Sydney' | date: '%d/%m/%Y %H:%M:%S %Z' }} => 30/11/2001 01:33:20 EST
	
	purchase_date = "2015-12-01 10:00"
	{{ purchase_date | time_zone: -7 | date: '%d-%m-%Y %H:%M' }} => 1-12-2015 03:00
	{% endraw %}

We provide a custom Liquid variable which lets you access the current time (at the time a newsletter is compiled). To do so, use the code `extra.time.now`. This will return the current datetime as a Unix integer value. You can transform this value using the `date` filter in Liquid. Here is a complex example. This example would result if it was run at 11:37pm 12 November (UTC).

	{{ extra.time.now | date: "%Y-%m-%d %H:%M" | time_zone: -7 | date: "%Y %h %d %H:%M" }} => 2015 Nov 12 16:37
	
All possible timezones can be found [here](http://apidock.com/rails/TimeZone).
