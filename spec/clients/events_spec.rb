# frozen_string_literal: true

RSpec.describe Seam::Clients::Locks do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }

  describe "#list" do
    let(:event_hash) { {event_id: "1234"} }

    before do
      stub_seam_request(:get, "/events/list", {events: [event_hash]})
    end

    let(:events) { client.events.list(since: "asd") }

    it "returns a list of events" do
      expect(events).to be_a(Array)
      expect(events.first).to be_a(Seam::AccessCode)
      expect(events.first.event_id).to be_a(String)
    end
  end
end
