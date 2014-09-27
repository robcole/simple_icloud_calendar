module ApplicationHelper

  include SimpleIcloudCalendar

  def calendar_importer_mock(file = 'non_recurring')
    ical_file = File.open(File.expand_path("../../assets/#{file}.ics", __FILE__), 'r')
    CalendarImporter.new(ical_file: ical_file)
  end

  def default_config
    Configuration.new
  end

  def load_calendar(file = 'non_recurring')
    cal = Calendar.new(default_config)
    cal.parsed_icalendar = calendar_importer_mock(file).parsed_icalendar
    cal
  end

  def mocked_ical_event(**opts)
    # summary, #dtend, #dtstart, #location, #rrule
    @summary = opts[:summary] || 'A Stub of a Summary'
    @dtstart = opts[:dtstart] || DateTime.now
    @dtend = opts[:dtend] || DateTime.now + 1.hour
    @location = opts[:location] || 'A Stubbed Location'

    event = double('event')
    expect(event).to receive(:summary) { @summary }
    expect(event).to receive(:dtstart) { @dtstart }
    expect(event).to receive(:dtend) { @dtend }
    expect(event).to receive(:location) { @location }
    expect(event).to receive(:rrule) { "Rules" }
    event
  end

end
