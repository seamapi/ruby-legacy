# frozen_string_literal: true

RSpec.describe Seam do
  it "has a version number" do
    expect(Seam::VERSION).not_to be nil
  end

  xdescribe "#health" do
    before do
      stub_seam_request(:get, "health", { ok: true })
    end

    it "returns a hash" do
      expect(Seam.health).to be_a(Hash)
    end
  end
end
