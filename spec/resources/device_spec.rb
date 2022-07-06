# frozen_string_literal: true

RSpec.describe Seamapi::Device do
  describe ".list" do
    let(:device_hash) { { device_id: "123" } }

    before do
      stub_seam_request(:get, "devices/list", { devices: [device_hash] })
    end

    let(:devices) { described_class.list }

    it "returns a list of Devices" do
      expect(devices).to be_a(Array)
      expect(devices.first).to be_a(Seamapi::Device)
      expect(devices.first.device_id).to be_a(String)
    end
  end

  describe "operations" do
    let(:action_attempt_id) { "action_attempt_id_1234" }
    let(:action_attempt_hash) do
      { action_attempt_id: action_attempt_id,
        action_type: "test",
        status: "",
        result: "" }
    end

    describe "#lock" do
      before do
        stub_seam_request(:post, "locks/lock_door", { action_attempt: action_attempt_hash })
      end

      let(:action_attempt) { Seamapi::Device.lock("123") }

      it "returns an ActionAttempt" do
        expect(action_attempt).to be_a(Seamapi::ActionAttempt)
        expect(action_attempt.action_attempt_id).to be_a(String)
        expect(action_attempt.action_attempt_id).to eq(action_attempt_id)
      end
    end

    describe "#unlock" do
      before do
        stub_seam_request(:post, "locks/unlock_door", { action_attempt: action_attempt_hash })
      end

      let(:action_attempt) { Seamapi::Device.unlock("123") }

      it "returns an ActionAttempt" do
        expect(action_attempt).to be_a(Seamapi::ActionAttempt)
        expect(action_attempt.action_attempt_id).to be_a(String)
        expect(action_attempt.action_attempt_id).to eq(action_attempt_id)
      end
    end
  end
end
