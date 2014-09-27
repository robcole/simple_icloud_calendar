require 'spec_helper'

module SimpleIcloudCalendar
  describe Calendar do

    let(:calendar) { load_calendar }

    describe "#initialize" do
      it "should generate icalendar events from the icalendar feed" do
        event_classes = calendar.events.map(&:class).uniq
        expect(event_classes).to eq [SimpleIcloudCalendar::Event]
      end
    end

    describe "#events" do
      it "should find 2 events" do
        expect(calendar.events.size).to eq 2
      end
    end

  end
end
