require "rails_helper"

RSpec.describe User do
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
