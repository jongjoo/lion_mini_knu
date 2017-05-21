require 'mailgun' 

class PagesController < ApplicationController
  def index
  end
  
  def mail_ok
        @emailtitle = params[:emailtitle]
        @emailcontent = params[:emailcontent]
        
    mg_client = Mailgun::Client.new("key-032563be0cea3c9af52e30e383e2596b")

    message_params =  {
                       from: @emailtitle,
                       to:   'zeni9@naver.com',
                       subject: '축제페이지 관련 문의내용',
                       text:    @emailcontent
                      }
    
    result = mg_client.send_message('sandbox649391cda02140bca82bd51856e2ef4e.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
    
    redirect_to :back

  end
end
