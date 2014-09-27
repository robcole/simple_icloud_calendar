module SimpleIcloudCalendar
  class CalendarImporter

    attr_accessor :ical_url, :ical_file, :parsed_icalendar

    def initialize(**opts)
      @ical_url = opts[:config].ical_url if opts[:config].respond_to?(:ical_url)
      @ical_file = opts[:ical_file]
      @parsed_icalendar = parse_calendar(loaded_calendar)
    end

    private

    def loaded_calendar
      @ical_file || load_ical_from_url(@ical_url)
    end

    def check_ical_url(ical_url)
      msg = "Failed to set ical_url to a valid iCalendar URL"
      fail(msg) unless valid_url?(ical_url)
    end

    def valid_url?(url)
      u = URI.parse(url)
      u.kind_of?(URI::HTTP) || u.kind_of?(URI::HTTPS)
    end

    def load_ical_from_url(url)
      check_ical_url(url)
      open(url)
    end

    def parse_calendar(ical_file)
      # TODO: Investigate what happens if Icalendar.parse fails
      Icalendar.parse(ical_file).first
    end

  end
end
