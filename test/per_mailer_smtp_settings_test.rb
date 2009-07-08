require 'test_helper'

class PerMailerSmtpSettingsTest < Test::Unit::TestCase
  context "Sending a normal mailing" do
    should "deliver through the settings on Base" do
      Net::SMTP.expects(:new).with("smtp.example.com", 25).
          returns(stub_everything)
      NormalMailer.deliver_something
    end
  end

  context "Sending from a mailer with overridden settings" do
    should "deliver with the overridden settings" do
      Net::SMTP.expects(:new).
        with("highpriority.example.com", 25).
          returns(stub_everything)
      HighPriorityMailer.deliver_something
    end
  end
end
