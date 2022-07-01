# frozen_string_literal: true

RSpec.describe Seam do
  it "has a version number" do
    expect(Seam::VERSION).not_to be nil
  end

  describe "Seam Client Operations" do
    seam = Seam::SeamClient.new

    it "can poll for health" do
      expect(seam.health).not_to be nil
    end

    it "can convert hashes to instances" do
      puts seam.workspaces.get
    end

    it "can get the current workspace" do
      ws = seam.workspaces.get
      expect(ws).not_to be nil
      puts ws["workspace"]
    end
    # it "can list devices" do
    #   expect(seam.devices.list).not_to be nil
    # end
  end
end
