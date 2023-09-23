RSpec.describe User do
  describe "callbacks" do
    describe "after_commit_on_create" do
      let(:test_listener) { TestListener.new }

      before do
        # Test listener for Wisper.
        stub_const(
          "TestListener",
          Class.new do
            attr_reader :messages

            def initialize
              @messages = []
            end

            def models_user_created(user_id)
              @messages << user_id
            end
          end,
        )
      end

      it "publishes a message to MessageBus" do
        messages = []

        MessageBus.subscribe "/models/user/created" do |message|
          messages << message.data
        end

        user = create(:user)

        wait_for(-> { messages.any? })
        expect(messages).to eq([{ "id" => user.id }])
      end

      it "publishes a message to Wisper" do
        Wisper.subscribe(test_listener, scope: described_class, on: :models_user_created) do
          user = create(:user)

          wait_for(-> { test_listener.messages.any? })
          expect(test_listener.messages).to eq([user.id])
        end
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
