require 'spec_helper'

module SimpleIcloudCalendar
  describe CalendarImporter do

    describe "#initialize", :skip => true do
    end

    describe "#parsed_icalendar", :skip => true do
    end

    describe "#ical_file" do

      it "should allow for manual passing of an icalendar ICS file" do
        expect(calendar_importer_mock.class).to eq CalendarImporter
      end

    end
  end
end
