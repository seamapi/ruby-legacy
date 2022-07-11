# frozen_string_literal: true

RSpec.describe Seam::Clients::ConnectedAccounts do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }

  describe "#get" do
    let(:connected_account_id) { "connected_account_id_1234" }
    let(:connected_account_hash) { { connected_account_id: connected_account_id } }

    before do
      stub_seam_request(
        :get, "/connected_accounts/get", { connected_account: connected_account_hash }
      ).with(
        query: { connected_account_id: connected_account_id }
      )
    end

    let(:result) { client.connected_accounts.get(connected_account_id) }

    it "returns a Device" do
      expect(result).to be_a(Seam::ConnectedAccount)
    end
  end
end
