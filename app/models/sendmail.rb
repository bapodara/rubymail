#!/usr/bin/env ruby
class Sendmail
  attr_reader :to
  attr_writer :to
  attr_reader :subject
  attr_writer :subject
  attr_reader :body
  attr_writer :body
  attr_reader :response
  attr_writer :response

  
  def initialize(to, subject, body, response)
   @to = to
   @subject = subject
   @body = body
   @response = response
  end
  
    
end
