module SimpleIcloudCalendar
  class Event
    attr_accessor :summary, :start_date, :end_date, :location, :schedule

    def initialize(ical_event)
      # Goal: set values on self based on ical_event key
      wanted_keys = { summary: 'summary', dtend: 'end_date', 
                      dtstart: 'start_date', location: 'location',
                      rrule: 'rules' }
      wanted_keys.each do |key, value|
        self.instance_variable_set("@#{value}", ical_event.send(key))
      end
    end

    def schedule
    end

  end

end
