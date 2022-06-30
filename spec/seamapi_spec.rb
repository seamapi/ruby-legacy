# frozen_string_literal: true

RSpec.describe Seam do
  it "has a version number" do
    expect(Seam::VERSION).not_to be nil
  end

  it "can poll for health" do
    seam = Seam::SeamClient.new
    expect(seam.health).not_to be nil
  end

  it "can list devices" do
    seam = Seam::SeamClient.new
    expect(seam.devices.list).not_to be nil
  end
end
