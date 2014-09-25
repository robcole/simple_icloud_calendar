module SimpleIcloudCalendar
  class Configuration
    attr_accessor :start_date, :end_date, :ical_url

    def initialize(**opts)
      check_ical_url(opts[:ical_url])
      @start_date = opts[:start_at] || Date.today.beginning_of_month
      self.end_date = opts[:end_date] || (@start_date + 28.days)
      if opts[:ical_url].nil?
        @ical_url = opts[:ical_url]
      end
    end

    def end_date=(date)
      fail("Expects a Date Object") unless date.is_a?(Date)
      fail("End Date Cannot Be Before Start Date") if date < self.start_date
      @end_date = date
    end

    private

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
