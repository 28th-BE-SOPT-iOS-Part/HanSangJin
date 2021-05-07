<img src="https://user-images.githubusercontent.com/70688424/117447672-bdc9fe00-af78-11eb-8552-21c946c51a77.png">

<hr><br><br>

# :notebook_with_decorative_cover:데이터 전달

데이터 전달 방식은 크게 두 방식으로 볼 수 있다.

**1. 직접 전달 방식(뷰컨 에서 뷰컨으로 데이터 직접 전달)**
   - Present/Push 방식 : 프로퍼티에 접근하여 데이터 전달하기
   - Segue 방식 : Segue prepare를 활용해 데이터 전달하기
   - Delegate 패턴 방식 : Protocol, Delegate를 활용해 데이터 전달하기
   - Closure를 활용해 데이터 전달하기
   - Notification Center를 활용해 데이터 전달하기

**2. 간접 전달방식(데이터를 저장하고, 필요할 때 꺼내오기)**
   - UserDefaults 활용
   - AppDelegate 활용
   - CoreData 또는 Realm 활용

이번 세미나 시간에는 데이터 전달 방식 중 Protocol/Delegate 패턴과 Notification에 대해 배웠다.

<br>

### 📌Protocol

Protocol은 특정 작업이나 역할을 수행하기 위한 청사진이라고 한다.

반드시 구현해야하는 기능들만 나열하고, 실제 구현은 프로토콜에서 이루어지지 않는다.

<pre>
<code>
protocol 치킨메뉴얼
{
    func 반죽을 한다()
    func 재료를 섞는다()
    func 튀긴다()
    func 장식을 한다()
}
</code>
</pre>

프로토콜은 '특정 기능 및 역할을 수행하기 위해 필요한 것들'이 적혀있는 설명서와 동일한 개념이다.

이러한 프로토콜은 다른 타입(구조체, 클래스, 열거형)이 채택을 하고, 프로토콜의 요소들을 실제로 구현할 수 있다.

<pre>
<code>
class 사장님A: 치킨메뉴얼
{
    func 반죽을 한다() { 반죽을 찰지게 하고...}
    func 재료를 섞는다() { 민트초코를 한 스푼 넣고...}
    func 튀긴다() { 200도에서 5분간 튀기고...}
    func 장식을 한다() {위에 초코칩을 올려보자...}
}

class 사장님B: 치킨메뉴얼
{
    func 반죽을 한다() { 반죽을 대충 하고...}
    func 재료를 섞는다() { 치즈를 두 스푼 넣고...}
    func 튀긴다() { 300도에서 15분간 튀기고...}
    func 장식을 한다() {위에 다시 치즈를 올려보자...}
}
</code>
</pre>

이와 같은 구조로 클래스가 프로토콜을 채택해 각자의 방식으로 구현을 하는 것이다.

### 📌Delegate

Delegate는 사전적으로 "위임하다", "대표하다"와 같은 뜻을 가지고 있으며 처리해야하는 일을 다른 객체에게 위임하는 것을 의미한다.

<img src="https://user-images.githubusercontent.com/70688424/117487936-b4578a80-afa6-11eb-988f-0bb6431268b2.gif" width="280">

<pre>
<code>
override func viewDidLoad() {
    super.viewDidLoad()
    sampleTextField.delegate = self
}

extension TextFieldDelegateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField)->Bool {
        self.sampleLabel.text = textField.text
        return true
    }
}
</code>
</pre>

위의 코드 같은 경우, sampleTextField 라는 객체의 delegate(대리자)가 self, 즉 자기 자신이라는 것을 의미한다.

따라서 sampleTextField의 기능을 class가 대신하는 것으로 위임되는 것이다.

### 📌NotificationCenter

NotificationCenter는 정보를 전달하기 위한 구조체이다.<br>하나의 정보를 전달하기 위한 '방송국'개념으로 생각하면 된다.

뷰컨에서 특정 신호를 NotificationCenter를 통해 post 하고, 해당 신호를 Observer로 등록해놓고 있다면 해당 Observer에 걸린 함수가 실행되는 형태이다.

<img src="https://user-images.githubusercontent.com/70688424/117490355-9fc8c180-afa9-11eb-880e-e83c403bfdfc.gif" width="280">

<br>
<br>

# :notebook_with_decorative_cover:TableView

TableView는 ScorllView를 상속하여 목록 형태의 뷰를 구현하는데 용이하다. 또한 재사용 큐를 활용하여 메모리 관리에 효율적이다.

<img src="https://user-images.githubusercontent.com/70688424/117491498-406bb100-afab-11eb-8b3c-e1221ffe5193.png" width="400">

위와 같이 여러개의 반복되는 UIView를 구현할 때, Autolay을 잘 잡으면 어찌저찌 되겠지만, View를 다수 구현하면 비효율적이며 메모리 이슈가 발생할 수 있다.

따라서 TableView를 활용해 효율적인 구성을 하는 것이 좋다.

<img src="https://user-images.githubusercontent.com/70688424/117492180-3302f680-afac-11eb-9a7b-b5e56bfc2199.png" width="280">

row가 모여서 section이 되고, section이 모여서 tableView를 구성한다.<br>또한 section은 header와 footer를 가질 수 있다.

TableView는 Delegate와 DataSource 프로토콜을 채택해 속성을 설정한다.

>**UITableViewDelegate**<br>\<화면에 보이는 모습과 행동을 담당한다><br><br>cell을 터치하면 무엇을 하는가?<br>cell의 높이는 어떻게 보여주는가?<br>cell의 들여쓰기는 어떻게 하는가?<br><br>**UITableViewDataSource**<br>\<테이블을 만들 때, 필요한 정보를 제공한다><br><br>cell은 몇 개를 그리는가?<br>cell에는 어떤 내용을 담아서 보여주는가?<br>section의 타이틀은 무엇으로 하는가?

<br>
<br>

# :notebook_with_decorative_cover:CollectionView

CollectionView는 일자 목록이 아닌 그리디 형태로 아이템을 나열하는 방식이다.

TableView와 비슷하게 ScrollView를 상속받았고, Delegate 패턴을 활용해 구현하게 되며 TableView와 사용법이 매우 비슷하다.

Cell 내부에 이미지, 라벨, 버튼 등을 넣어서 반복적인 형태의 구조를 만든다.

TableView는 단순한 목록 구현에 맞춘 형태라면, CollectionView는 좀 더 복잡하고 다양한 형태로 커스터마이징이 가능하다는 차이가 있다.

<img src="https://user-images.githubusercontent.com/70688424/117494813-d0abf500-afaf-11eb-8c02-c7fb53991c7f.png" width="400">

컬렉션 뷰는 이처럼 격자형태의 구조를 띈다.