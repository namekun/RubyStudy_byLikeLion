# 20180607 with LikeLion 2nd
 

## Today Ruby Class

* 웹페이지에 내가 원하는 내용을 나타내고싶다? get '/address' do ~ end 사이에 원하는 코드를 넣어주자!

  ex)

  ```ruby
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
  ```
  

* ruby는 메소드의 리턴값중 가장 마지막의 값만 리턴해주기때문에, Web에서 띄울때는 하나하나 지정해주고, + 로 나타내주자.

* send_file은 파일을 가져오는 역할을 한다. 사용법은 send_file "경로/파일명"

* html에서 ruby의 명령을 사용하고 싶다면? = 확장자를 erb로 해주면 편하다

* erb = embadded ruby, 즉 이 문장은 루비파일을 포함하고 있습니다. 라는 의미- html 안에서 `<%=내용%>` 라는 형식으로 사용하며 = 뒤에 루비파일이 들어간다.

* 사용하던 변수를  view에서 똑같이 쓰고싶다면, 변수앞에 @를 모두 찍어준다. 즉, @는 허가도장같은 느낌?



## MarkDown Tips

#하면 제목!

ul

"``` + 언어를 쓰면 " 해당 언어를 작성하는 코드창이 뜬다

```ruby
$ ruby test_app.rb -o $IP -p $PORT
```



```ruby
#include <iostream>
using namespace std;

int main(){
    return 0;
```



`ruby -v`는 루비의 버전을 볼 수 있는 명령어 입니다.

`` 이거 두개면 코드를 간결히 볼 수 있습니다.

**글씨를 굵게 보고 싶어요** 

*글씨를 기울여 보고 싶어요* 

> 요거는 색깔도 변하고 뭔가 예쁘네요?

> > 입력 안될때까지 계속 쓸 수 있어요

> > > 두 단계나 들어왔네요? 요건 좀 보기 싫어요

[네이버로 떠납니다](www.naver.com)

![윤영민](https://infosocio.files.wordpress.com/2011/07/e5d8fdcc1fa082de4304341b237e3d393b44192799eee0671.jpg)

| 안녕 | 안녕  |
| ---- | ----- |
| 안녕 | 안녕! |

