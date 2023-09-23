RSpec.describe "Wisper - :models_user_created" do
  it "enqueues a NewUserNotificationJobV2" do
    user = nil
    expect do
      user = create(:user)
      wait_for_job(NewUserNotificationJobV2)
    end.to(
      have_enqueued_job(NewUserNotificationJobV2).with { |args| expect(args["id"]).to eq(user.id) },
    )
  end
end
