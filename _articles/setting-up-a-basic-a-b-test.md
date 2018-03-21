---
title: A/B Testing Email Campaigns
description: Vero makes A/B testing easy to manage while providing the level of accuracy required to ensure your tests are robust, so you can confidently optimize the performance of your campaigns.
categories:
- campaigns
layout: articles
common_issues: true
---

# A/B Testing Email Campaigns
    
Vero makes A/B testing easy to manage while providing the level of accuracy required to ensure your tests are robust, so you can rapidly test new ideas and optimize the performance of your campaigns. 

You can A/B test:

-Subject lines<br>
-From addresses<br>
-Body content<br>
-Templates<br>

Configuring your first A/B test is a simple process, however, features vary between type of campaign, read about the types of A/B testing below.

## Newsletter A/B Testing

To create a new newsletter A/B test:

1. Select 'New A/B Test', you'll then be redirected to a new page where you can add variations of your email.

![{{ site.data.screenshots.vero.ab_test.new-test['title'] }}]({{ site.data.screenshots.vero.ab_test.new-test['image'] }})

2. Use the 'Add variation' button to create the variation(s) for your test.

![{{ site.data.screenshots.vero.ab_test.add-variation['title'] }}]({{ site.data.screenshots.vero.ab_test.add-variation['image'] }})

3. You can edit the content of each email variation using the 'Edit**'** button. Each variation can have a separate *from address*, *subject line*, *content* and *HTML template*.

To delete a variation simply click the 'bin icon' next to the 'Edit' button . If you'd like to completely remove an A/B test from a newsletter, simply delete each variation.

Once you have added the email newsletter variations for your test, You can select from two modes testing: **Manual** or **Pick a winner**.

**Manual**

This is the default mode for testing. It allows you to input the percentage of users you'd like each email variation to be sent to. By default, Vero sets an equal split between all the variations but you can simply change it before sending. Vero uses a randomisation mechanism to split the recipients into the percentages selected for each variation and sends the emails.

*Sending a manual test*

To send a manual A/B test, schedule the newsletter as you would normally. All variations will be sent out at the scheduled time. 

*Reporting on a manual test*

To view the report on a manual A/B test head to the Reports section in Vero and choose the campaign, this will show you detailed performance metrics for each variation and the winner of the test will be highlighted. Alternatively, you can go to the main menu and navigate to *Campaigns* > *Newsletters* and use the drop down menu to select ‘View full report’.

**Pick a winner**

This mode allows you to determine the percentage of customers you'd like to send the A/B test, and the percentage of customers who will receive the winning email, after a set period of time.

![{{ site.data.screenshots.vero.ab_test.pick-a-winner['title'] }}]({{ site.data.screenshots.vero.ab_test.pick-a-winner['image'] }})

To enable **Pick a winner** mode for your test:

1. Toggle the ‘Pick a winner’ button 'on'
2. Use the Distribution slider to select the percentage of customers you would like to send the A/B test.
3. Enter the number of hours you would like the test to run before sending the winner.
4. Select the metric that you want to use to determine the winner of the variations. You have choose from one of the following:<br>
  -Deliveries<br>
  -Opens<br>
  -Clicks<br>
  -Unsubscribes (the variant with more unsubscribes will be discarded)<br>
  -Conversions (the number of users that took an action after receiving the campaign, such as a purchase).<br>
5. Select 'Show advanced settings' to select the type of calculation you would like to use to determine the winner of your test. By default, tests will use a calculation that ensures the result is **statistically significant** to a 95% confidence level. If you would like to use the **bigger number wins** calculation, you can select this from the drop down menu and the winner will simply be determined by the email with the highest number.
6. Save your settings.

*Sending a 'Pick a winner' test*

When you schedule a newsletter campaign with ‘Pick a winner’ test mode, the scheduled time is the time that the initial test will run. After the defined test period has past, the winning email will be determined from the results of the test and then sent to the remaining recipients. If there is no clear winner (no statistically significant difference is observed) the control email will be sent to the remaining recipients.

*Reporting on a 'Pick a winner' test*

Once the test has completed, you can view the results of the chosen metric on the A/B testing page. For more detailed reporting, head to the *Reports* section in your account.

**Note:**

Due to the testing period required to determine a winner, sending emails in the users timezone, and batch sending are not available when using A/B testing.

## Behavioural & Transactional A/B Testing

An A/B test can be set up at any time on a behavioural or transactional campaign, even for campaigns that have already been launched.

![{{ site.data.screenshots.vero.ab_test.behavioural-and-transactional-tests['title'] }}]({{ site.data.screenshots.vero.ab_test.behavioural-and-transactional-tests['image'] }})

To create a new A/B test for a behavioural or transactional campaign:

1. Select ‘Add new A/B test’. You will be redirected to a new page where you can add variations of your email that you want to test.
2. Use the 'Add variation' button to create the variation(s) for your test.
3. (Optional) By using the ‘Add negative variation’ button you can create a ‘hold out’ control group. Recipients in this group will not receive any email. This is useful for testing to see if sending no email performs better than sending an email.
4. Edit the content of each variation using the ‘Edit’ button. Each variation can have a separate from address, subject line, content and HTML template. We would generally recommend to only test a single hypothesis with each variation.

You can delete a variation, by selecting the 'bin icon' for that variation.

Email variations are sent out based on split percentage. By default, Vero sets an equal split between all the variations but you can simply change it before launching your test.

At this point in time you should ensure you have a conversion event configured so you can track which variation is the best performing. You should then remove other variations from the sending cycle. This allows you to rapidly test new ideas and determine a winner.

*Launching a behavioural or Transactional A/B test* 

Once all of your variations are setup and you are happy with the split percentages, you can select 'start the A/B test**'.** To stop the test, simply return to this page and select ‘stop A/B test’.

*Reporting on a behavioural or Transactional A/B test*

Results are reported individually for each variation. To see which variations performed best or to see a detailed report on each variation, visit the *Reports* section and select the appropriate campaign.

**Note:**

When running an A/B test on a Behavioural or Transactional email campaign which has more than one email (a series campaign), A/B tests run across the entire series. The split is decided with the first email in the series and the remaining emails follow suit. 

For example, if a customer receives Variation B for the first email, they will receive Variation B throughout. This allows you to test entirely different templates or from addresses without your customers receiving inconsistent communications.

