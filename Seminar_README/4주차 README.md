<img src="https://user-images.githubusercontent.com/70688424/118404270-3cc3e280-b6ad-11eb-986f-e536f3386240.png">

<hr><br><br>

# :notebook_with_decorative_cover:Network

### 🎈HTTP 프로토콜
서버와 클라이언트는 정해진 형태로 "요청"과 "응답"을 주고 받게 된다.

|클라이언트|서버|
|:--------:|:--------:|
|서버에 데이터 처리를 요청|클라에게 네트워크를 통해 정보나 서비스를 제공|
|필요한 정보들을 서버에 요청하고 받아와서 보여줌|클라가 요청을 하면 데이터를 처리하여 결과를 보내줌|

<br>

클라이언트가 서버에게 HTTP 방식으로 요청을 할 때는 여러가지 메서드가 존재한다.

|메서드|기능|
|:--------:|:--------:|
|GET|데이터를 얻고 싶을 때 요청|
|HEAD|헤더 정보를 얻고 싶을 때 요청|
|POST|내용을 전송할 때|
|PUT|내용을 갱신하고 싶을 때|
|DELETE|내용을 삭제하고 싶을 때|
|OPTIONS|가능한 메소드 옵션을 파악할 때|
|TRACE|리소스가 수신되는 경로를 파악할 때|
|PATCH|리소스를 일부 수정할 때|

<br>

### 🎈REST API

REST란, Representational State Transfer의 약자로, 자원을 이름으로 구분해 자원의 정보를 주고 받는 것을 의미한다.<br>하나의 개발 아키텍쳐 개념이다.

REST API는 행위/자원/메세지 로 구성이 된다.
> <행위> HTTP 메서드 중에서 GET/POST/PUT/DELETE를 사용<br><자원> URI를 통해 오브젝트에 접근<br><메세지> JSON 포맷의 데이터로 메세지 수령

### 🎈JSON

JSON은 JavaScript Object Notation의 약자로, 데이터를 저장하거나 전송할 때 사용하는 형식(데이터를 표시하는 방법)이다.

key-value 형태이며, 모두 쌍따옴표("")를 이용해 표기해야 한다. 객체, 배열등을 사용할 수 있고, 중첩이 가능한 형태이다.

<br>

# :notebook_with_decorative_cover:Network 방식

네트워킹은 클라이언트가 서버에게 해당 URI를 통해 GET 요청을 하면, JSON 형태로 데이터를 받는 방식으로 이루어진다.

### 🎈Decode & Encode

JSON을 데이터 모델로 변환하는 과정을 Decode라고 한다.<br>반면, 데이터 모델을 JSON으로 변환하는 것을 Encode라고 한다.

앞으로, 실제 서버에서 주는 JSON파일을 Swift 데이터 모델로 변환하는 Decode를 주로 다루게 될 것이다.

<br>

# :notebook_with_decorative_cover:Escaping Closure

우리는 함수 매개변수로 클로저를 넘길 수 있다.

```
override func viewDidLoad() {
    super.viewDidLoad()
    callback {
        print("Closure가 실행되었습니다.")
    }
}

func callback(closure: () -> Void) {
    closure()
}
```

하지만, 클래스에 클로저 변수를 선언하고 함수에서 매개변수로 받은 closure를 대입하려고 하면 에러가 발생한다.

Swift에서는 함수의 매개변수로 전달된 클로저는 기본적으로 **해당 함수 내부에서만** 사용이 가능하다.

클로저가 매개변수로 넘어가게 되면, 반드시 해당 함수가 끝나서 리턴되기 전에 해당 클로저가 실행되기 때문인데, 즉 해당 함수가 끝나게 되면 매개변수로 넘어간 클로저는 사용이 불가능하다는 것이다.

<br>
매개변수로 넘어온 클로저 앞에 @escaping을 달아주면, 이전에 생기던 에러가 발생하지 않는다.

```
func callback(closure: @escaping () -> Void) {
    sampleClosure = closure
    sampleClosure
}
```

이렇게 클로저를 탈출 가능하게 만들면, 다음과 같은 두 가지가 가능하다.

1. 해당 클로저를 외부 변수/상수에 저장 가능
2. 해당 함수가 끝난 리턴 이후에 해당 클로저 실행이 가능

이러한 Escaping Closure는 서버에서 데이터를 받아오는 작업에서 데이터를 안전하게 받는 것을 보장할 수 있다.

<br>

# :notebook_with_decorative_cover:Singleton

특정 용도로 객체를 **하나만** 생성하여 **공용**으로 사용하고 싶을 때 Singleton 디자인 패턴을 활용한다.

```
class UserInfo {
    var id: String?
    var password: String?
    var name: String?
}

// A뷰컨
let userInfo = Userinfo()
userInfo.id = "HSJ"

// B뷰컨
let userInfo = Userinfo()
userInfo.password = "1234"

// C뷰컨
let userInfo = Userinfo()
userInfo.name = "Han Sang Jin"
```

위와 같이 각 뷰컨에서 따로 따로 정보를 받게 되면, 각각의 인스턴스에서 정보가 따로 놀게 된다.

따라서 이를 해결 하기 위해, 해당 인스턴스는 최초 생성될 때 **전역으로 저장**해두고, 그 이후에는 이 전역 인스턴스에만 접근하게 하는 방법을 사용하게 된다.

```
class UserInfo {
    static let shared = UserInfo()

    var id: String?
    var password: String?
    var name: String?
}

// A뷰컨
let userInfo = UserInfo.shared
userInfo.id = "HSJ"

// B뷰컨
let userInfo = UserInfo.shared
userInfo.password = "1234"

// C뷰컨
let userInfo = UserInfo.shared
userInfo.name = "HanSangJin"
```

이처럼 간단하게 static을 이용해 인스턴스를 전역으로 저장할 프로퍼티를 하나 생성해주면 된다.

위의 예시에서 UserInfo 클래스가 **싱글턴 객체**라고 부르며, 위와 같은 방식을 **싱글턴 패턴**이라고 부른다.