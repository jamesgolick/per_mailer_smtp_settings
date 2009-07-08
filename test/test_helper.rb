require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'actionmailer'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'per_mailer_smtp_settings'

ActionMailer::Base.smtp_settings = {
  :address => "smtp.example.com"
}
ActionMailer::Base.template_root =
  File.dirname(__FILE__) + "/fixtures"

class NormalMailer < ActionMailer::Base
  def something; end
end

class HighPriorityMailer < ActionMailer::Base
  self.smtp_settings = {
    :address => "highpriority.example.com"
  }

  def something; end
end

class Test::Unit::TestCase
end
