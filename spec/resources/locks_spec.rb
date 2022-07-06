# frozen_string_literal: true

RSpec.describe Seam::Clients::Locks do
  let(:client) { Seam::Client.new("some_api_key") }

  xdescribe "operations" do
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

      let(:action_attempt) { Seam::Device.lock("123") }

      it "returns an ActionAttempt" do
        expect(action_attempt).to be_a(Seam::ActionAttempt)
        expect(action_attempt.action_attempt_id).to be_a(String)
        expect(action_attempt.action_attempt_id).to eq(action_attempt_id)
      end
    end

    describe "#unlock" do
      before do
        stub_seam_request(:post, "locks/unlock_door", { action_attempt: action_attempt_hash })
      end

      let(:action_attempt) { Seam::Device.unlock("123") }

      it "returns an ActionAttempt" do
        expect(action_attempt).to be_a(Seam::ActionAttempt)
        expect(action_attempt.action_attempt_id).to be_a(String)
        expect(action_attempt.action_attempt_id).to eq(action_attempt_id)
      end
    end
  end
end
