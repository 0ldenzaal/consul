require "rails_helper"

describe Legislation::ProposalsController do
  describe "GET show" do
    let(:proposal) { create(:legislation_proposal) }

    it "has custom order for comments" do
      get :show, params: { process_id: proposal.process.id, id: proposal.id }
      expect(controller.valid_orders).to eq %w[newest most_voted oldest]
    end
  end
end
