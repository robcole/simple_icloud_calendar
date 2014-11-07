require 'spec_helper'

module SimpleIcloudCalendar

  describe IcloudRequest do

    describe "#initialize" do

      it "should accept https URLS" do
      end

      it "should accept webcal URLS" do
      end

      it "should responsd with a valid ics_file" do
        url = 'webcal://p19-calendarws.icloud.com/ca/subscribe/1/wokZez_XBuLUcpsLv4C4bXAGeaTJAuEX1SbdvOkBEbPP_f1-of2kJ7D2WMU8crBF4CsnZQa9rb9Gxg_FJOvxqdj-N6aD_qMG-w0rQnSCpKA'
        ics_file = IcloudRequest.new(url).ics_file
        fail("Need to check if ICS file is valid via Icalendar")
      end

    end
  end
end
