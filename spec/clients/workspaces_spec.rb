# frozen_string_literal: true

RSpec.describe Seam::Clients::Workspaces do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }

  describe "#list" do
    let(:workspace_hash) { { workspace_id: "123" } }

    before do
      stub_seam_request(:get, "/workspaces/list", { workspaces: [workspace_hash] })
    end

    let(:workspaces) { client.workspaces.list }

    it "returns a list of Workspaces" do
      expect(workspaces).to be_a(Array)
      expect(workspaces.first).to be_a(Seam::Workspace)
      expect(workspaces.first.workspace_id).to be_a(String)
    end
  end

  describe "#get" do
    let(:workspace_id) { "workspace_id_1234" }
    let(:workspace_hash) { { workspace_id: workspace_id } }

    before do
      stub_seam_request(
        :get, "/workspaces/get", { workspace: workspace_hash }
      ).with(
        query: { workspace_id: workspace_id }
      )
    end

    let(:result) { client.workspaces.get(workspace_id) }

    it "returns a Device" do
      expect(result).to be_a(Seam::Workspace)
    end
  end

  describe "#reset_sandbox" do
    let(:workspace_id) { "workspace_id_1234" }

    before do
      stub_seam_request(
        :post, "/workspaces/reset_sandbox", { message: "ok" }
      ).with(
        query: { workspace_id: workspace_id }
      )
    end

    let(:result) { client.workspaces.reset_sandbox(workspace_id) }

    it "returns a Resets the Workspace" do
      expect(result).to be_a(Hash)
    end
  end
end
