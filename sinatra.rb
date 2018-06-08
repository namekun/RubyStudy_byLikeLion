require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'json' # 기본적으로 Ruby에 있다.


get '/weather' do # 아래에 컨트롤러가 작동할 내용을 작성한다.
 
    responseNaverMo =HTTParty.get("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT001013")
    responseNaverAf =HTTParty.get("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT001013")
    responseNaverWthinfo  =HTTParty.get("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT001013")

    moweatherNV = Nokogiri::HTML(responseNaverMo)
    afweatherNV = Nokogiri::HTML(responseNaverAf)
    weatherinfo = Nokogiri::HTML(responseNaverWthinfo)

    resultwthmo = moweatherNV.css("#content > table.tbl_weather.tbl_today3 > tbody > tr > td:nth-child(1) > div:nth-child(1) > ul > li.nm > span")
    resultwthaf = afweatherNV.css("#content > table.tbl_weather.tbl_today3 > tbody > tr > td:nth-child(1) > div:nth-child(3) > ul > li.nm > span")
    resultfeel = weatherinfo.css("#content > div.w_now2 > ul > li:nth-child(1) > div > em > strong")

    "금일 강남구 역삼동의 오전은 #{resultwthmo.text}℃이고, 오후는 #{resultwthaf.text}℃ 이며, 오늘은 #{resultfeel.text}입니다."
end

get '/rain' do
    responseRainMo =HTTParty.get("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT001013")
    responseRainAf =HTTParty.get("https://weather.naver.com/rgn/cityWetrCity.nhn?cityRgnCd=CT001013")


    rainmo = Nokogiri::HTML(responseRainMo)
    rainaf = Nokogiri::HTML(responseRainAf)

    resultRainMo = rainmo.css("#content > table.tbl_weather.tbl_today3 > tbody > tr > td:nth-child(1) > div:nth-child(1) > ul > li.info > span > strong")
    resultRainAf = rainaf.css("#content > table.tbl_weather.tbl_today3 > tbody > tr > td:nth-child(1) > div:nth-child(3) > ul > li.info > span > strong")

    "금일 오전 강수확률은 #{resultRainMo.text}이고, 오후는 #{resultRainAf.text} 입니다."
end

get '/kospi' do
    response = HTTParty.get("http://finance.daum.net/quote/kospi.daum?nil_stock=refresh")
    kospi = Nokogiri::HTML(response)

    # f12 누르고 코스피부분놀러서 받아오는것
    result = kospi.css("#hyenCost > b")
    "오늘의 코스피지수는 #{result.text}입니다."
end

get '/exchange' do
   
    responseUS = HTTParty.get("http://finance.daum.net/exchange/exchangeDetail.daum?code=USD")
    responseJP = HTTParty.get("http://finance.daum.net/exchange/exchangeDetail.daum?code=JPY")
    responseCN = HTTParty.get("http://finance.daum.net/exchange/exchangeDetail.daum?code=CNY")
    exchangeUS = Nokogiri::HTML(responseUS)
    exchangeJP = Nokogiri::HTML(responseJP)
    exchangeCN = Nokogiri::HTML(responseCN)
    # f12 누르고 환율부분놀러서 받아오는것
    resultUSD = exchangeUS.css("#hyenCost > b") 
    resultJPY = exchangeJP.css("#hyenCost > b")
    resultCNY = exchangeCN.css("#hyenCost > b")

    us = "금일 미국의 환율은 #{resultUSD.text}원 입니다"
    jp = "금일 일본의 환율은 #{resultJPY.text}원 입니다"
    cn = "금일 중국의 환율은 #{resultCNY.text}원 입니다" 

    us +" "+ jp +" "+ cn
end

get '/lotto' do
    number = *(1..45)
    lotto = number.sample(6).sort
    "이번주 추천 로또 번호는" + lotto.to_s + "입니다."
end

get '/checklotto' do

    url = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=809"
    lotto = HTTParty.get(url)
    result = JSON.parse(lotto)
    numbers = []
    bonus = result["bnusNo"]
    result.each do |k, v|
        if k.include?("drwtNo") # 포함하고있는가? = .include?, 같은가? = .equal?
            numbers << v # numbers에 v를 넣는다.
        end    
    end
    
    my_number = *(1..45)
    my_lotto = my_number.sample(6).sort
    count = 0
    numbers.each do |num|
        count += 1 if my_lotto.include?(num)
    end
    "당첨 개수는 #{count} 입니다."
end

get '/html' do
    "<html>
        <head></head>
        <body><h1>hello</h1><body>
        </html>"
end

get '/html_file' do
    @name = params[:name] #[:~~] = symbol, 변수랑 똑같지만, 그냥 이 자체가 변수로 활용된다. 
    # 사용하던 변수를 view에서 쓰고 싶다면 변수 앞에 @를 찍어주면된다. 즉, 허가를 해준다는 개념?
    erb :my_first_html # my_first_html 에 사용자가 입력한 name 을 넣어줍니다.
end


get '/calculator' do
   num1 = params[:num1].to_i
   num2 = params[:num2].to_i
   
   @plus = num1 + num2
   @minus = num1 - num2
   @multi = num1 * num2
   @div = num1 / num2
  erb :calc
   
end