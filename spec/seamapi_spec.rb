# frozen_string_literal: true

RSpec.describe Seamapi do
  it "has a version number" do
    expect(Seamapi::VERSION).not_to be nil
  end

  # describe "#health" do
  #   it "returns a hash" do
  #     expect(Seamapi.health).to be_a(Hash)
  #   end
  # end
end
