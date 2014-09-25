module ApplicationHelper

  def create_valid_config(file = nil)
    file ||= 'weekly'
    ical_file = File.open(File.expand_path("../../assets/#{file}.ics", __FILE__), 'r')
    SimpleIcloudCalendar::Configuration.new(ical_file: ical_file)
  end
  
end
