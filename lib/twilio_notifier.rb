class TwilioNotifier

  require 'twilio-ruby'

  def self.notify(date)
    account_sid = ENV['TWILIOACCOUNTSID']
    auth_token = ENV['TWILIOAUTHTOKEN']

    client = Twilio::REST::Client.new account_sid, auth_token

    client.account.sms.messages.create(
      :from => ENV['TWILIOFROMNUMBER'],
      :to => ENV['TWILIOTONUMBER'],
      :body => "Better test date availble! Date is #{date}"
    )

  end

end
