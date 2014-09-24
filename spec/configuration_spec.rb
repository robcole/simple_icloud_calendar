require 'spec_helper'

module SimpleIcloudCalendar
  describe Configuration do
    describe "#start_at" do
      it "default value is beginning_of_month" do
        config = Configuration.new
        expect(config.start_at).to eq Date.today.beginning_of_month
      end
    end

    describe "#start_at=" do
      it "can set value" do
        config = Configuration.new
        config.start_at = Date.parse("31-10-2014")
        expect(config.start_at).to eq Date.parse("31-10-2014")
      end
    end
  end
end
