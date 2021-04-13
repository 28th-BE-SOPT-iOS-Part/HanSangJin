<img src="https://images.velog.io/images/sangjin98/post/052b805d-f16a-4541-a40a-73dd81b78052/2%EC%A3%BC%EC%B0%A8%20%EC%84%B8%EB%AF%B8%EB%82%98.jpg">

<hr><br><br>

# :notebook_with_decorative_cover:Tabbar Controller

<img src="https://images.velog.io/images/sangjin98/post/585101a5-d07a-438f-90d4-264963f53e2b/%ED%83%AD%EB%B0%941.jpg" width="80%">

Tabbar Controller는 동시에 여러개의 ViewController를 관리하고,<br>탭바 Item을 누르면 해당 아래에 묶여있는 ViewController의 Contents View를 보여주는 형식이다.

<img src="https://images.velog.io/images/sangjin98/post/2b8108e1-cf63-4040-b6d8-3823f827ba26/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-04-11%20%EC%98%A4%ED%9B%84%206.21.54.png" width="50%">

스토리보드에서는 이처럼 하나의 탭바 컨트롤러에 여러개의 뷰 컨트롤러가 연결되어있는 형태이다.

<img src="https://user-images.githubusercontent.com/70688424/114311915-a5a6c080-9b2b-11eb-9341-fe621c44cf68.gif" width="30%">
실행해보면, 탭바 아이템을 터치할 때 마다 각각의 뷰 컨트롤러의 뷰가 나오게 된다.
<br><br>

# :notebook_with_decorative_cover:스토리보드 관리

Tabbbar Controller와 View Controller는 동시에 사용가능하다.<br>
하지만, 한 스토리보드에 많은 scene을 넣게 되면 Xcode 빌드가 느려져 메모리 낭비 현상이 발생하거나, Git Merge시에 스토리보드에서 충돌이 발생할 수도 있다.<br>
이를 해결하기 위해 보통 3가지 방법으로 진행한다.<br><br>
🎈스토리보드 1개당 View Controller를 1개만 사용해서 파일을 분리한다.<br>
🎈Nibs를 사용한다.<br>
🎈코드를 베이스로 UI를 개발한다.<br>
<br>
결국 회사마다 방침이 다르고 사용하는 방식이 달라 결국엔 3가지를 다 할 줄 알아야하지만,<br>우선 2주차 세미나에서는 1번 방식(스토리보드, 뷰컨 1대1 관계)을 배웠다.
<br><br>

<img src="https://images.velog.io/images/sangjin98/post/87586526-8ba8-453f-84f6-45eab864897a/image.png" width="70%">

<img src="https://images.velog.io/images/sangjin98/post/d66830b8-d279-4461-94c6-f9fef06b5e17/storyboard.jpg" width="30%">

Storyboard Reference를 추가한 후, 탭 바 컨트롤러와 연결해주면 다른 스토리보드에 있는 View Controller와 연결이 되어 앞서 한 스토리보드에 구성을 했을 때와 동일하게 작동한다.
<br>
<br>

# :notebook_with_decorative_cover:Auto Layout

<img src="https://images.velog.io/images/sangjin98/post/e5c9e0cd-a462-4302-86b6-7d62fe80e697/%EC%98%A4%ED%86%A0%EB%A0%88%EC%9D%B4%EC%95%84%EC%9B%83.jpg" width="80%">

기종마다 스크린의 크기가 다르기 때문에 앱을 개발할 때에도 이에 따라 적절한 레이아웃을 구성해주어야한다.<br>
레이아웃을 구성하기 위해서는<br><br>
🎈Frame 기반으로 레이아웃 잡기 (Frame-based)<br>
🎈Autoresizing masks<br>
🎈Autolayout<br>
<br>
3가지의 방법이 있는데, View들의 관계를 정의하여 외부와 내부 변경에 동적으로 대응이 가능한 형태인 Autolayout이 가장 안정적이며 많이 사용되는 방식이다.<br>

<img src="https://images.velog.io/images/sangjin98/post/50cde886-e945-44c4-8385-d0457dfd0a3f/auto.jpg" width="50%">

Autolayout은 스토리보드 우측 하단의 Constraint 메뉴를 클릭하여 설정할 수 있다.<br><br>

# :notebook_with_decorative_cover:Stack View

StackView란, View 요소들을 일정한 간격으로 가로 또는 세로로 배치하기 위해 사용하는 형태이다.<br>
StackView를 사용하지 않더라도 일일이 다 배치에 제약을 준다면 레이아웃을 설계하는데는 아무 문제가 없다.<br>
하지만, 스택뷰를 활용한다면 동시에 여러 요소들의 간격 등을 관리하기 용이하다.<br>

<img src="https://images.velog.io/images/sangjin98/post/dcd0776c-a153-429e-9afe-ef0954d1c186/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-04-11%20%EC%98%A4%ED%9B%84%207.09.49.png" width="30%">

예를 들어 빨, 주, 노의 색을 가진 View들을 세로로 일정한 길이로 배치하고자 할 때,<br>
View 각각의 길이에 제약을 주어 레이아웃을 조절할 수 있지만

<img src="https://images.velog.io/images/sangjin98/post/235fd6eb-0a52-47aa-815c-929768135d01/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-04-11%20%EC%98%A4%ED%9B%84%207.22.44.png" width="30%">

StackView에 넣어 Fill Equally를 설정해준다면 자동으로 조절이 된다.<br>
이외에도 여러 요소들을 쉽고 깔끔하게 정리하기 위해 사용하기 용이하다.<br><br>

# :notebook_with_decorative_cover:Scroll View

<img src="https://user-images.githubusercontent.com/70688424/114613024-c9aa0380-9cdd-11eb-96bf-a9184300b027.gif" width="40%">

ScrollView란, 스크롤 기능을 통해 상하좌우로 움직이며 추가 컨텐츠를 보여주는 뷰이다.<br>

<img src="https://images.velog.io/images/sangjin98/post/fb7b6f37-15c1-42d5-807b-9a7a40c4399c/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-04-11%20%EC%98%A4%ED%9B%84%207.31.04.png">

스토리보드에서 뷰 컨트롤러는 길이를 자유롭게 조절할 수 있다는 점과,<br>

<img src="https://images.velog.io/images/sangjin98/post/8906dc5d-3c69-4d8c-976b-858a01126aed/image.png">

ScrollView는 크기를 조절할 때 Content Layout Guieds 사항을 버튼해제 해야한다는 점을 알게 되었다.
