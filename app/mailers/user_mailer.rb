class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_email(toaddr, mailsubject, mailbody)
  	@mailbody = mailbody
  	mail(to: toaddr, subject: mailsubject)
  end
end



