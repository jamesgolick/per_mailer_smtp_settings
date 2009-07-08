class ActionMailer::Base
  class_inheritable_accessor :smtp_settings
  self.smtp_settings = @@smtp_settings
end

