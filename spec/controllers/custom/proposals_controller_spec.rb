require "rails_helper"

describe ProposalsController do
  describe "GET show" do
    let(:proposal) { create(:proposal) }

    it "has custom order for comments" do
      get :show, params: { id: proposal.id }
      expect(controller.valid_orders).to eq %w[newest most_voted oldest]
    end
  end
end
