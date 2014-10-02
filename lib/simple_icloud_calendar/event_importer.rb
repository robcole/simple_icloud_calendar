module SimpleIcloudCalendar
  # Finds events between dates in Icalendar object, then creates
  # "virtual" events for easier display
  class EventImporter

    attr_accessor :icalendar_events, :events, :date_range

    def initialize(**opts)
      @config = opts[:config]
      @icalendar_events = opts[:icalendar_events]
      @date_range = date_range
    end

    def find_events
      # TODO: Add Recurring Event Support
      nonrecurring_events.find_all do |event|
        @date_range.cover?(event.dtstart.to_date)
      end.force
    end

    def date_range
      ((@config.start_date)..(@config.end_date))
    end

    def recurring_events
      self.icalendar_events.lazy.find_all do |event|
        recurring_event?(event)
      end
    end

    def nonrecurring_events
      self.icalendar_events.lazy.find_all do |event|
        nonrecurring_event?(event)
      end
    end

    def recurring_event?(event)
      event.rrule.any?
    end

    def nonrecurring_event?(event)
      event.rrule.empty?
    end

    def events
      find_events.map { |ie| Event.new(ie) }
    end

  end
end
