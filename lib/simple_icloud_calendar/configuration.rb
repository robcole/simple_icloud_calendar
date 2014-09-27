module SimpleIcloudCalendar
  class Configuration
    attr_accessor :start_date, :end_date, :ical_url

    def initialize(**opts)
      @ical_url = opts[:ical_url] || 'http://valid-testing-url.com'
      self.start_date = opts[:start_at] || Date.today.beginning_of_month
      self.end_date = opts[:end_date] || (@start_date + 28.days)
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

    def validate_date(date)
      fail("Expects a Date Object") unless date.is_a?(Date)
    end

  end
end
