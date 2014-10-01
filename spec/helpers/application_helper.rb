module ApplicationHelper

  include SimpleIcloudCalendar

  def calendar_importer_mock(file = 'non_recurring')
    ical_file = File.open(File.expand_path("../../assets/#{file}.ics", __FILE__), 'r')
    CalendarImporter.new(ical_file: ical_file)
  end

  def default_config
    # Currently the raw ICS calendar files are time-sensitive with
    # dates in September, so setting default start_date here of Sept 1
    Configuration.new(start_date: DateTime.parse('01-09-2014'))
  end

  def load_calendar(**opts)
    start_date = opts[:start_date] || default_config.start_date
    end_date = opts[:end_date] || default_config.end_date
    file = opts[:file] || 'non_recurring'
    cal = Calendar.new(start_date: start_date, end_date: end_date)
    cal.parsed_icalendar = calendar_importer_mock(file).parsed_icalendar
    cal
  end

  def mocked_ical_event(**opts)
    # summary, #dtend, #dtstart, #location, #rrule
    @summary = opts[:summary] || 'A Stub of a Summary'
    @dtstart = opts[:dtstart] || DateTime.now
    @dtend = opts[:dtend] || DateTime.now + 1.hour
    @location = opts[:location] || 'A Stubbed Location'
    @rrule = opts[:rrule] || []
    event = double('event')
    expect(event).to receive(:summary) { @summary }
    expect(event).to receive(:dtstart) { @dtstart }
    expect(event).to receive(:dtend) { @dtend }
    expect(event).to receive(:location) { @location }
    expect(event).to receive(:rrule) { @rrule }
    event
  end

end
