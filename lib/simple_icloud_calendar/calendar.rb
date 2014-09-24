module SimpleIcloudCalendar
  class Calendar

    attr_accessor :config, :events, :icloud_events

    def initialize(config = Configuration.new)
      @config = config
      @events = generate_icalendar_events
    end

    def icloud_events
      open(config.ical_url)
    end

    def generate_icalendar_events
      calendar = Icalendar.parse(icloud_events)
      calendar.first.events.map do |ie|
        Event.new(ie)
      end
    end

  end
end
