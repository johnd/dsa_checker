class DSAScraper

  require 'mechanize'

  def initialize(existing_date)
    @existing_date = existing_date
    @available_date = scraper_date
  end

  def newer_date_available?
    @available_date
  end

  def available_date
    @available_date
  end

  private

  def scraper_date

    agent = Mechanize.new
    best_date = agent.get('https://www.gov.uk/change-date-practical-driving-test').link_with(:text => /Start now/).click.
      form_with(:action => '/login') do |form|
        form.username = ENV['DSADRIVERNUMBER']
        form.password = ENV['DSAAPPOINTMENTNUMBER']
      end.click_button.
      link_with(:id => "date-time-change").click.
      forms.first.submit.
      at('.button-board a').text

      if Date.parse(best_date) < @existing_date
        best_date
      else
        false
      end
    end
end
