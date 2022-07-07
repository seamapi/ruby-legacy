# frozen_string_literal: true

RSpec.describe Seam::Clients::Locks do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }

  describe "#unlock" do
    let(:action_attempt_id) { "action_attempt_id_1234" }
    let(:action_attempt_hash) do
      { action_attempt_id: action_attempt_id,
        action_type: "test",
        status: "",
        result: "" }
    end

    let(:device_id) { "device_id_1234" }

    before do
      stub_seam_request(
        :post,
        "/locks/unlock_door",
        {
          action_attempt: action_attempt_hash
        }
      ).with do |req|
        req.body.source == { device_id: device_id }.to_json
      end
    end

    describe "with a device_id" do
      let(:result) { client.locks.unlock_door(device_id) }

      it "returns an action attempt" do
        expect(result).to be_a(Seam::ActionAttempt)
      end
    end

    describe "with a device object" do
      let(:device) { Seam::Device.new({ device_id: device_id }) }
      let(:result) { client.locks.unlock_door(device) }

      it "returns an action attempt" do
        expect(result).to be_a(Seam::ActionAttempt)
      end
    end
  end
end
