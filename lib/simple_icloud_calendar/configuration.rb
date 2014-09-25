module SimpleIcloudCalendar
  class Configuration
    attr_accessor :start_date, :end_date, :ical_file, :parsed_ical

    def initialize(**opts)
      @start_date = opts[:start_at] || Date.today.beginning_of_month
      @ical_url = opts[:ical_url] || 'http://valid-testing-url.com'
      @ical_file = opts[:ical_file] || load_ical_from_url(@ical_url)
      @parsed_ical = parse_calendar
      self.end_date = opts[:end_date] || (@start_date + 28.days)
      check_ical_url(@ical_url)
    end

    def start_date=(date)
      validate_date(date)
      @start_date = date
    end

    def end_date=(date)
      validate_date(date)
      fail("End Date Cannot Be Before Start Date") if date < self.start_date
      @end_date = date
    end

    private

    def load_ical_from_url(url)
      check_ical_url(url)
      open(url)
    end

    def parse_calendar
      # TODO: Investigate what happens if Icalendar.parse fails
      Icalendar.parse(@ical_file).first
    end

    def validate_date(date)
      fail("Expects a Date Object") unless date.is_a?(Date)
    end

    def check_ical_url(ical_url)
      msg = "Failed to set ical_url to a valid iCalendar URL"
      fail(msg) unless valid_url?(ical_url)
    end

    def valid_url?(url)
      u = URI.parse(url)
      u.kind_of?(URI::HTTP) || u.kind_of?(URI::HTTPS)
    end
  end
end
