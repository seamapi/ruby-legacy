# frozen_string_literal: true

RSpec.describe Seamapi do
  it "has a version number" do
    expect(Seamapi::VERSION).not_to be nil
  end

  describe "#health" do
    before do
      stub_seam_request(:get, "health", { ok: true })
    end

    it "returns a hash" do
      expect(Seamapi.health).to be_a(Hash)
    end
  end
end
