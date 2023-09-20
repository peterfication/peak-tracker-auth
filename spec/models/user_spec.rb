RSpec.describe User do
  describe "callbacks" do
    describe "after_commit_on_create" do
      it "publishes a message" do
        messages = []

        MessageBus.subscribe "/models/user/created" do |message|
          messages << message.data
        end

        user = create(:user)

        wait_for(-> { messages.any? })
        expect(messages).to eq([{ "id" => user.id }])
      end
    end
  end

  describe "#current_sign_in_ip" do
    it "is accessible" do
      expect { subject.current_sign_in_ip = "" }.not_to raise_error
    end
  end

  describe "#last_sign_in_ip" do
    it "is accessible" do
      expect { subject.last_sign_in_ip = "" }.not_to raise_error
    end
  end
end
