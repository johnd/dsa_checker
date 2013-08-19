DSA Practical Test Appointment Scraper
======================================

Booked a driving test but don't want to wait six weeks of more for your
appointment? Cancellations appear, but checking manually all the time is
tedious.

`dsa_checker` lets you check automatically. Call it from cron every hour
or so (the DSA website will display a CAPTCHA if you check too
frequently) and it'll send a text message to your phone when there's an
earlier test date.

To prevent any unpleasantness, it doesn't automatically book the earlier
slot, it just alerts you so you can make a choice based on your
availability, your driving instructor's availability, or whatever.

To set up the scraper, copy `config.env.example` to `config.env` and edit
it to contain your details. If you've not already signed up for Twilio
you'll need to sign up: http://twilio.com and get a phone number and API
auth details. You should also register your mobile phone so you can
receive text messages with a trial account (or get a paid account, if
you like).

To run the scraper do:

`cd /path/to/dsa_checker && source config.env && ./dsa_checker.rb`

If there's an earlier slot available it'll display that as output and
send a text message, if there's no earlier slot then it exits silently
to avoid unnecessary cron emails.
