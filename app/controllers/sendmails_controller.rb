require 'rubygems'
require 'json'
require 'net/http'

class SendmailsController < ApplicationController
#  before_action :set_sendmail,only: [:show, :edit, :update, :destroy]


  # GET /sendmails
  # GET /sendmails.json
  def index
    @sendmails = Sendmail.all
  end



  # POST /sendmails
  # POST /sendmails.json
  def create
    
      txtresponse = ''
      to = params[:to]
      subject = params[:subject]
      body = params[:body]
      
          if to.to_s == ''
	  	txtresponse=  '"to" field missing'
	  end	
          if subject.to_s == ''
	  	txtresponse=  txtresponse + ' "subject" field missing'
	  end	
	  if body.to_s == ''
	  	txtresponse=  txtresponse + ' "body" field missing'
          end
          if txtresponse == ''
             txtresponse = 'Success'
          end
          
          @sendmail = Sendmail.new(to, subject, body, txtresponse) 
	  
	  if txtresponse == 'Success'
            UserMailer.send_email(to, subject, body ).deliver
            puts 'Mail Sent'
            respond_to do |format|  
              format.json { render :show, status => 200 }
            end
          else
            puts txtresponse
            respond_to do |format|  
              format.json { render :show, status: :bad_request}
            end
          end	  
  end


  private
=begin  
    # Use callbacks to share common setup or constraints between actions.
    def set_sendmail
      @sendmail = Sendmail.find(params[:id])
    end
=end
    # Never trust parameters from the scary internet, only allow the white list through.
    def sendmail_params
      params.require(:sendmail).permit(:to, :subject, :body)
    end
end
