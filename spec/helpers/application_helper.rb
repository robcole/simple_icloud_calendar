module ApplicationHelper

  def create_config(**opts)
    opts[:ical_url] ||= 'https://p19-calendarws.icloud.com/ca/subscribe/1/G2F6yAt4vAI0VzSKzT0wvEKb1bj2Gxfo8lS3SfEeGi5haGjwbPhE9D9uuHBBH69DtTBN8luR44qJC5pljF6iLCJnkLNC-D0n3XfbeBef_fk'
    SimpleIcloudCalendar::Configuration.new(opts)
  end

end
