module ApplicationHelper

  include SimpleIcloudCalendar

  def calendar_importer_mock(file = nil)
    file ||= 'weekly'
    ical_file = File.open(File.expand_path("../../assets/#{file}.ics", __FILE__), 'r')
    CalendarImporter.new(ical_file: ical_file)
  end

  def default_config
    Configuration.new
  end

  def weekly_recurring_calendar
    cal = Calendar.new(default_config)
    cal.parsed_icalendar = calendar_importer_mock('weekly').parsed_icalendar
    cal
  end

end
