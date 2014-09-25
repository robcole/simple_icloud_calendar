module SimpleIcloudCalendar
  class Calendar

    attr_accessor :config, :events

    def initialize(config)
      @config = config
      @events = generate_icalendar_events
    end

    def generate_icalendar_events
      config.parsed_ical.events.map do |ie|
        Event.new(ie)
      end
    end

  end
end
