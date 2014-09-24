module SimpleIcloudCalendar
  class Configuration
    attr_accessor :start_at, :end_at, :ical_url

    def initialize(**opts)
      fail if opts[:ical_url].nil?
      @start_at = Date.today.beginning_of_month
      @end_at = @start_at + 28.days
      @ical_url = opts[:ical_url]
    end
  end
end
