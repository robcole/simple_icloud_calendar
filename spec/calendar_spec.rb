require 'spec_helper'

module SimpleIcloudCalendar
  describe Calendar do

    let(:calendar) { weekly_recurring_calendar }

    describe "#initialize" do

      it "should generate icalendar events from the icalendar feed" do
        event_classes = calendar.events.map(&:class).uniq
        expect(event_classes).to eq [SimpleIcloudCalendar::Event]
      end

    end

  end
end
