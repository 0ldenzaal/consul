require "rails_helper"

describe "Polls" do
  describe "Index" do
    scenario "Polls display list of questions" do
      poll = create(:poll, :with_image)
      question1 = create(:poll_question, :yes_no, poll: poll)
      question2 = create(:poll_question, :yes_no, poll: poll)

      visit polls_path

      expect(page).to have_content(poll.name)
      expect(page).to have_content(question1.title)
      expect(page).to have_content(question2.title)
    end
  end

  context "Show" do
    let(:geozone) { create(:geozone) }
    let(:poll) { create(:poll, summary: "Summary", description: "Description") }

    scenario "Lists questions from proposals as well as regular ones" do
      normal_question = create(:poll_question, poll: poll)
      proposal_question = create(:poll_question, poll: poll, proposal: create(:proposal))

      visit poll_path(poll)
      expect(page).to have_content(poll.name)
      expect(page).to have_content(poll.summary)

      expect(page).to have_content(proposal_question.title, normalize_ws: true)
      expect(page).to have_content(normal_question.title, normalize_ws: true)

      find("#read_more").click
      expect(page).to have_content(poll.description)

      find("#read_less").click
      expect(page).not_to have_content(poll.description)
    end
  end
end
