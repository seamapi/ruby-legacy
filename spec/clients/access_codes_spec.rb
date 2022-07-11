# frozen_string_literal: true

RSpec.describe Seam::Clients::AccessCodes do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }

  describe "#list" do
    let(:access_code_hash) { { access_code_id: "123" } }
    let(:device_id) { "device_id_1234" }

    before do
      stub_seam_request(:get, "/access_codes/list", { access_codes: [access_code_hash] }).with(query: { device_id: device_id })
    end

    let(:access_codes) { client.access_codes.list(device_id) }

    it "returns a list of Devices" do
      expect(access_codes).to be_a(Array)
      expect(access_codes.first).to be_a(Seam::AccessCode)
      expect(access_codes.first.access_code_id).to be_a(String)
    end
  end

  describe "#get" do
    let(:access_code_id) { "access_code_id_1234" }
    let(:access_code_hash) { { access_code_id: access_code_id } }

    before do
      stub_seam_request(
        :get, "/access_codes/get", { access_code: access_code_hash }
      ).with(
        query: { access_code_id: access_code_id }
      )
    end

    let(:result) { client.access_codes.get(access_code_id) }

    it "returns a Device" do
      expect(result).to be_a(Seam::AccessCode)
    end
  end

  describe "#create" do
    let(:access_code_hash) { { device_id: "1234", name: "A C", code: 1234 } }
    let(:action_attempt_hash) { { action_attempt_id: "1234", status: "pending" } }

    before do
      stub_seam_request(
        :post, "/access_codes/create", { action_attempt: action_attempt_hash }
      )

      stub_seam_request(
        :get, "/action_attempts/get", { action_attempt: { result: { access_code: access_code_hash }, status: "success" } }
      ).with(query: { action_attempt_id: action_attempt_hash[:action_attempt_id] })
    end

    let(:result) { client.access_codes.create(**access_code_hash) }

    it "returns an Access Code" do
      expect(result).to be_a(Seam::AccessCode)
    end
  end

  describe "#delete" do
    let(:access_code_id) { "access_code_1234" }
    let(:action_attempt_hash) { { action_attempt_id: "1234", status: "pending" } }

    before do
      stub_seam_request(
        :post, "/access_codes/delete", { action_attempt: action_attempt_hash }
      ).with do |req|
        req.body.source == { access_code_id: access_code_id }.to_json
      end

      stub_seam_request(
        :get,
        "/action_attempts/get",
        {
          action_attempt: {
            status: "success"
          }
        }
      ).with(query: { action_attempt_id: action_attempt_hash[:action_attempt_id] })
    end

    let(:result) { client.access_codes.delete(access_code_id) }

    it "returns an Access Code" do
      expect(result).to be_a(Seam::ActionAttempt)
    end
  end
end
