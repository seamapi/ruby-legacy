# frozen_string_literal: true

RSpec.describe Seam::Clients::ConnectedAccounts do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }
  let(:connected_account_id) { "connected_account_id_1234" }

  describe "#get" do
    let(:connected_account_hash) { {connected_account_id: connected_account_id} }

    context "with connected_account_id" do
      before do
        stub_seam_request(
          :get, "/connected_accounts/get", {connected_account: connected_account_hash}
        ).with(
          query: {connected_account_id: connected_account_id}
        )
      end

      let(:result) { client.connected_accounts.get(connected_account_id) }

      it "returns a ConnectedAccount" do
        expect(result).to be_a(Seam::ConnectedAccount)
      end
    end

    context "with email" do
      let(:email) { "jane@example.com" }

      before do
        stub_seam_request(
          :get, "/connected_accounts/get", {connected_account: connected_account_hash}
        ).with(
          query: {email: email}
        )
      end

      let(:result) { client.connected_accounts.get(email: email) }

      it "returns a ConnectedAccount" do
        expect(result).to be_a(Seam::ConnectedAccount)
      end
    end
  end

  describe "#list" do
    let(:connected_account_hash) { {connected_account_id: connected_account_id} }

    before do
      stub_seam_request(
        :get, "/connected_accounts/list", {connected_accounts: [connected_account_hash]}
      )
    end

    let(:result) { client.connected_accounts.list }

    it "returns a ConnectedAccount Array" do
      expect(result).to be_a(Array)
      expect(result.first).to be_a(Seam::ConnectedAccount)
    end
  end
end
