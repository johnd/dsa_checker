#!/usr/bin/env ruby
# Script for screen-scraping the DSA website and alerting me via Twilio if there's a newer test date.
# John Daniels <john@semantici.st>
# August 2013

require './lib/dsa_scraper'
require './lib/twilio_notifier'

check = DSAScraper.new(Date.parse(ENV['DSATESTDATE']))

if check.newer_date_available?
  puts "Newer test date availble! Date is #{check.available_date}."
  TwilioNotifier.notify(check.available_date)
end
