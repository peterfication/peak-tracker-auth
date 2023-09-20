RSpec.describe "MessageBus - /models/user/created" do
  it "enqueues a NewUserNotificationJob" do
    expect do
      MessageBus.publish "/models/user/created", { id: "some-id" }
      wait_for_job(NewUserNotificationJob)
    end.to(have_enqueued_job(NewUserNotificationJob).with({ "id" => "some-id" }))
  end
end
