module SimpleIcloudCalendar
  class Event
    attr_accessor :title, :start, :end, :location, :schedule

    def initialize(ical_event)
      # Goal: set values on self based on ical_event key
      @title = ical_event.summary
      @start = ical_event.dtstart
      @end = ical_event.dtend
      @location = ical_event.location
      @schedule = process_schedule(ical_event.rrule)
    end

    def recurring?
      @schedule.present?
    end

    def to_hash
      self.instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete("@")] = self.instance_variable_get(var)
      end
    end

    private

    def process_schedule(rules)
      {rule: 'Rule1'} unless rules.empty?
    end

  end

end
