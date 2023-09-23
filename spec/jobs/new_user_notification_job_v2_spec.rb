RSpec.describe NewUserNotificationJobV2 do
  it "performs without errors" do
    expect { described_class.perform_now("id" => 1) }.not_to raise_error
  end
end
