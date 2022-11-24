# frozen_string_literal: true

RSpec.describe Seam do
  it "has a version number" do
    expect(Seam::VERSION).not_to be nil
  end

  describe "#health" do
    before do
      stub_seam_request(:get, "/health", {ok: true})
    end

    let(:client) { Seam::Client.new(api_key: "some_api_key") }

    it "returns a hash" do
      expect(client.health).to be_a(Hash)
    end
  end
end
