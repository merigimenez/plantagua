namespace :user do
  desc "Check plants to be watered today"
  task run_notification: :environment do
    # users = User.all
    User.all.each do |element|
      CreateNotificationJob.perform_now(element)
    end
  end
end
