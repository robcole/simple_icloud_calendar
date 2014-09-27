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

    def detect_rule
    end

    def convert_rules_to_icecube_format
      # This is where we need to alter the rules field, building recurring rules
      # that ice_cube can easily use to build a schedule and find events.
    end

    def convert_weekly_event
      #schedule = IceCube::Schedule.new(Time.now) do |s|
        #s.add_recurrence_rule(IceCube::Rule.weekly)
      #end
      #schedule
    end

    def convert_daily_event
    end

    def convert_monthly_event
    end

    def convert_yearly_event
    end
  end
end
