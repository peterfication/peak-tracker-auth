RSpec.describe UserMailer do
  describe "reset_password_instructions" do
    let(:user) { create(:user) }
    let(:mail) { described_class.reset_password_instructions(user, "fake-token") }

    it "renders the headers" do
      expect(mail.subject).to eq("Reset password instructions")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["mail@example.com"])
      expect(mail.body.encoded).to include("fake-token")
    end
  end

  describe "confirmation_instructions" do
    let(:user) { create(:user) }
    let(:mail) { described_class.confirmation_instructions(user, "fake-token") }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmation instructions")
      expect(mail.from).to eq(["mail@example.com"])
      expect(mail.body.encoded).to include("fake-token")
    end
  end

  describe "unlock_instructions" do
    let(:user) { create(:user) }
    let(:mail) { described_class.unlock_instructions(user, "fake-token") }

    it "renders the headers" do
      expect(mail.subject).to eq("Unlock instructions")
      expect(mail.from).to eq(["mail@example.com"])
      expect(mail.body.encoded).to include("fake-token")
    end
  end

  describe "email_changed" do
    let(:user) { create(:user, email: "new@example.com") }
    let(:mail) { described_class.email_changed(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Email Changed")
      expect(mail.from).to eq(["mail@example.com"])
      expect(mail.body.encoded).to include("new@example.com")
    end
  end
end
