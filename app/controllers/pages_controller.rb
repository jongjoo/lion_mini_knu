require 'mailgun' 

class PagesController < ApplicationController
  def index
    @all_post = Post.all 
    
    @joojum=["부동산건설학부-수육","부동산건설학부-치즈불고기","부동산건설학부-옥수수전","부동산건설학부-부추전",
       "부동산건설학부-장떡","부동산건설학부-옥수수치즈","부동산건설학부-구운떡과 꿀","부동산건설학부-짬뽕홍합탕",
       "부동산건설학부-닭모래집튀김","부동산건설학부-닭튀김가라아캐과 감자튀김",
       
       "한영문화콘텐츠학과-너의 강냉이 대신 콘치즈","한영문화콘텐츠학과-쫠깃쫠깃 닭똥집볶음",
       "한영문화콘텐츠학과-팡팡터지는 곱창볶음","한영문화콘텐츠학과-치즈듬뿍 돈까스",
       "한영문화콘텐츠학과-토마토치즈계란말이냠","한영문화콘텐츠학과-오동통어묵탕 대",
       "한영문화콘텐츠학과-귀여운치즈닭발","한영문화콘텐츠학과-니감자무봤나감자튀김",
       "한영문화콘텐츠학과-내가 만드는 주먹밥",
       
       "공공인재학과-한턱쏘시지(2)","공공인재학과-꼬꼬닭꼬치(5)","공공인재학과-맛있어염통꼬치(5)",
       "공공인재학과-넋이나가사끼오뎅탕","공공인재학과-시켜주오꼬노미야끼","공공인재학과-숙주맵닭발",
       "공공인재학과-혜자set=닭꼬치(2),쏘시지(2),삼겹꼬치(2),대하꼬치(2),염통꼬치(4) ",
       
       "산업데이터 사이언스학부-두부김치","산업데이터 사이언스학부-부추 지짐이와 김치 지짐이",
       "산업데이터 사이언스학부-대홍단 감자튀김과 알옥수수 치즈","산업데이터 사이언스학부-매운잡탕(짬뽕탕)",
       "산업데이터 사이언스학부-평양순대와 껍데기","산업데이터 사이언스학부-꼬지"
       ]
    
    @random=@joojum.sample(1)
    
    
  end
  
  def write
    @one_post = Post.new
    @one_post.content = params[:content]
    @one_post.writer = params[:writer]
    
    if @one_post.save
      redirect_to "/pages/index"
    else  
      render :text => @one_post.errors.messages[:writer][0]
    end
    
    
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
