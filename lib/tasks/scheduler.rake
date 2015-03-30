desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  puts "Sending out email reminders for holidays."
  User.holiday_reminder
  puts "Emails sent!"
end

task :send_feedback => :environment do
  puts "Requesting feedback"
  User.feedback_request_reminder
  puts "Emails sent!"
end