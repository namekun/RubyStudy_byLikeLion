# 20180607 with LikeLion 2nd



## FrameWork & Library

What's Difference?

In Ruby

프레임워크 : sinatra, Rails

라이브러리 : gem

- Frame Work

  프레임워크는 Application 개발시 코드의 품질, 필수적인 코드, 알고리즘, 암호화, 데이터베이스 연동 같은 기능들을 어느정도 구성이 되어있는 뼈대(구조)를 제공하도록 만들어진걸 프레임워크라고합니다. 

  즉, 개발 구조나 설계 시 제공되는 인터페이스의 집합입니다. 완성된 어플리케이션은 아니지만 어느정도 프로그래머가 제공된 프레임워크의 구조에서 어플리케이션을 개발해야합니다.

- Library

  라이브러리는 특정 기능에 대한 API(도구 / 함수)를 모은 집합을 라이브러리라고 합니다.

  그 기능을 사용하기위해 불러와서 호출하는 방식을 생각하시면 쉬울듯 합니다.

- 차이

  **제어권을 누가 갖고있는가가 가장 중요하다. 즉, 내가 조종하는가 조종당하는가가 둘의 차이라고 할 수 있다.**

  프레임워크도 **제어의 역전** 개념이 적용된 대표적인 기술이다.

  프레임워크는 라이브러리의 다른 이름이 아니다.

  프레임워크는 단지 미리 만들어 둔 반제품이나, 확장해서 사용할 수 있도록 준비된 추상 라이브러리의 집합이 아니다.

  라이브러리를 사용하는 애플리케이션 코드는 애플리케이션 흐름을 직접 제어한다.  단지 동작하는 중에 필요한 기능이 있을 때 능동적으로 라이브러리를 사용할 뿐이다.

  반면에 프레임워크는 거꾸로 애플리케이션 코드가 프레임워크에 의해 사용된다. 보통 프레임워크 위에 개발한 클래스를 등록해두고, 프레임워크가 흐름을 주도하는 중에 개발자가 만든 애플리케이션 코드를 사용하도록 만드는 방식이다.

  최근에는 툴킨, 엔진, 라이브러리 등도 유행을 따라서 무작정 프레임워크라고 부르기도 하는데 이는 잘못된 것이다.

  프레임워크에는 분명한 **제어의 역전** 개념이 적용되어 있어야 한다.

  애플리케이션 코드는 프레임워크가 짜놓은 틀에서 수동적으로 동작해야 한다



## MVC - Model View Controller



MVC란 **M**odel **V**iew **C**ontroller의 약자로 에플리케이션을 세가지의 역할로 구분한 개발 방법론이다. 아래의 그림처럼 사용자가 Controller를 조작하면 Controller는 Model을 통해서 데이터를 가져오고 그 정보를 바탕으로 시각적인 표현을 담당하는 View를 제어해서 사용자에게 전달하게 된다.  

![1262](C:\Users\namkun\Desktop\1262.png)

## **Web 과 MVC**

위의 개념을 웹에 적용해보자. 

1. 사용자가 웹사이트에 접속한다. (Uses)

2. Controller는 사용자가 요청한 웹페이지를 서비스 하기 위해서 모델을 호출한다. (Manipulates)

3. 모델은 데이터베이스나 파일과 같은 데이터 소스를 제어한 후에 그 결과를 리턴한다.

4. Controller는 Model이 리턴한 결과를 View에 반영한다. (Updates)

5. 데이터가 반영된 VIew는 사용자에게 보여진다. (Sees)

   

## Codelgnigter와 MVC

### Controller

사용자가 접근 한 URL에 따라서 사용자의 요청사항을 파악한 후에 그 요청에 맞는 데이터를 Model에 의뢰하고, 데이터를 View에 반영해서 사용자에게 알려준다. 

### model

일반적으로 CI의 모델은 데이터베이스 테이블에 대응된다. 이를테면 Topic이라는 테이블은 topic_model이라는 Model을 만든다. 그런데 이 관계가 강제적이지 않기 때문에 규칙을 일관성 있게 정의하는 것이 필요하다.

### view

View는 클라이언트 측 기술인 html/css/javascript들을 모아둔 컨테이너이다. 



## Class & Instance

우리 실생활의 모든 것들이 전부 객체로 이루어진 것이다. 넓은 의미에서의 객체라는 것은 보고 만질 수 있고, 이해할 수 있으며 생각이나 행동이 추구하는 바를 의미한다. 즉 객체라는 것은 우리가 인지 하고 있는 구체적인 사물이나 시스템이 될 수도 있고, 구체적이지만 물리적으로 경계가 모호한 강, 안개 등도 객체라 할 수 있는 것이다. 인스턴스란, 예로 우리는 하나의 청사진이 되는 클래스를 정의하면 이 클래스에서 각각 구별이 되는 인스턴스를 얼마든지 만들어 낼 수 있는 것이다. 사람이라는 클래스가 있다면 세계 50억명 이상의 각 개인들의 인스턴스가 있는 것이다. 즉 인스턴스란 클래스의 정의를 통해 만들어진 객체를 의미하는 것이다. 

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

