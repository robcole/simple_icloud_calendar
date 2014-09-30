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

      context "event is within date range of config" do
        it "should find 1 event" do
          expect(calendar.events.size).to eq 1
        end
      end

      context "event it outside date range of config" do
        it "should find 0 events" do
          start_date = Date.today.beginning_of_year - 1.year
          end_date = start_date.end_of_month
          config = Configuration.new(start_date: start_date,
                                     end_date: end_date)

          cal = Calendar.new(config)
          cal.parsed_icalendar = calendar_importer_mock('weekly').parsed_icalendar
          expect(cal.events.size).to eq 0
        end

      end

    end

    describe "#events_json" do

      it "should output json" do
        byebug
        puts "Test"
      end
    end

  end
end
