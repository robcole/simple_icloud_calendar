module SimpleIcloudCalendar
  class Calendar

    attr_accessor :config, :events, :parsed_icalendar

    def initialize(config)
      @config = config
    end

    def ical_url
      @config.ical_url
    end

    def parsed_icalendar
      # Allow for parsed_icalendar objects to be directly 
      parsed_cal = -> { CalendarImporter.new(config: config).parsed_icalendar }
      @parsed_icalendar ||= parsed_cal.call
    end

    def events
      @events ||= generate_icalendar_events
    end

    def events_json
      Oj.dump(self.events)
    end

    def start_date
      @config.start_date
    end

    def end_date
      @config.end_date
    end

    def generate_icalendar_events
      ical_events = parsed_icalendar.events
      EventImporter.new(icalendar_events: ical_events,
                        config: @config).events
    end

  end
end
