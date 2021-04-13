## :notebook_with_decorative_cover:2주차 과제 : Autolayout 및 Tabbar 구현하기
<img src="https://user-images.githubusercontent.com/70688424/114558809-0528db80-9ca6-11eb-917f-b39c2f74220b.png" width = "70%">
<img src="https://user-images.githubusercontent.com/70688424/114558813-065a0880-9ca6-11eb-900e-bb362eab8408.png" width = "70%">
<img src="https://user-images.githubusercontent.com/70688424/114558814-06f29f00-9ca6-11eb-9a95-a4c4719eb9bc.png" width="70%">

<br>

## :notebook_with_decorative_cover:구현 결과

<img src="https://user-images.githubusercontent.com/70688424/114559490-bf204780-9ca6-11eb-9b6a-0560103c49dc.png">

**레이아웃 맞추기(모든 기기)**

오토레이아웃은 아무리 연습해도 어려운 것 같다ㅠㅠ


<img src="https://user-images.githubusercontent.com/70688424/114559377-a0ba4c00-9ca6-11eb-8798-5ebb1ec47aa0.gif" width="40%">

**로그인/회원가입 ~ 탭 바 연결**

탭 바는 배웠던 것만 복습해도 어려운 건 없었는데...<br>
탭 바 아이템에 들어가는 시스템 이미지들을 찾는게 너무 힘들었다......

<br>

<img src="https://user-images.githubusercontent.com/70688424/114560781-f2170b00-9ca7-11eb-8f83-ef99eb28c519.png" width="40%">

**프로필 구현**

제플린 자체는 세미나 시간에 배운대로 사용만 하면 어려운 건 없었다.
<br>
<br>

## :notebook_with_decorative_cover:과제리뷰
<br>

### :pushpin:스토리보드 관리

<img src="https://user-images.githubusercontent.com/70688424/114559935-2e963700-9ca7-11eb-9981-0a85d21a5937.png" width="320px"><br>
탭 바 컨트롤러 사용시, 여러개의 뷰 컨트롤러를 만들게 된다.<br>세미나 시간에 배웠던 대로, 각 뷰마다 스토리보드 파일을 생성해주고, 1:1로 연결해주었다.<br>


### :pushpin:탭 바 색상구성

과제 요구조건에 탭이 선택되었을 때 색상을 검은색으로 하라는 것이 있다.<br>
어떻게 하는지 몰라서 고생했지만 관련 자료를 찾아 해결할 수 있었다.<br>
참고 자료 : https://stackoverflow.com/questions/26835148/change-tab-bar-item-selected-color-in-a-storyboard
<br>

<img src="https://user-images.githubusercontent.com/70688424/114569809-41f9d000-9cb0-11eb-9b04-bd80f1539bdc.png" width="40%">

탭 바 컨트롤러에서 탭을 선택한 후,

<img src="https://user-images.githubusercontent.com/70688424/114569945-6190f880-9cb0-11eb-851a-bb5784a2f7e9.png" width="50%">

'User Defined Runtime Attributes'에서 Key Path를 추가해주어 해결하는 것이었다.<br>
까먹지 않게 잘 기억해두어야겠다!<br>
<br>

### :pushpin:버튼과 텍스트

UIButton에 이미지와 텍스트를 같이 넣을 경우,<br>

<img src="https://user-images.githubusercontent.com/70688424/114570708-04e20d80-9cb1-11eb-871d-37f695714f97.png" width="40%">

이처럼 이미지와 텍스트가 한 줄로 붙어서 나오게 된다.<br>
이것도 관련 자료를 찾아 해결할 수 있었다.<br>
참고 자료 : https://zeddios.tistory.com/406<br><br>
과제의 요구사항처럼 이미지를 위로 두고 텍스트를 아래에 두기 위해서는,

<img src="https://user-images.githubusercontent.com/70688424/114571174-6c985880-9cb1-11eb-9053-5817a4649347.png" width="40%">

버튼을 클릭 후, 속성에서 Image Insets, Title Insets을 적절히 조절하면 된다.
<br><br>
<img src="https://user-images.githubusercontent.com/70688424/114571026-48d51280-9cb1-11eb-95c5-7c1f18558a84.png" width="50%">

그럼 이렇게 해결이 된다!
<br>
딱히 어려운 건 없어서 금방 익힐 수 있었다.

<br>

### :pushpin:오토 레이아웃

<img src="https://user-images.githubusercontent.com/70688424/114571616-c7ca4b00-9cb1-11eb-860a-1e8d2df4daaa.png" width="40%">

오토레이아웃은 설정하는 것 자체는 이제는 익숙해서 딱히 어려운 건 없었다.
<br>
하지만 모든 아이폰 기기에서 같은 레이아웃이 보이게 설정하는 것이 어려웠다.
<br>
아이폰11에서는 정상적으로 잘 보이는 게, 아이폰4s에서는 아래 버튼들이 짤리거나 아예 보이지 않았다.
<br>
<br>
이 문제는 세미나에서 배웠던 Priority 값을 조정하는 것으로 해결했다.
<br>
<img src="https://user-images.githubusercontent.com/70688424/114571619-c862e180-9cb1-11eb-9747-0a48e449b338.png" width="50%">

Priority값을 조정하고 Equal과 Less than, Greater than을 적절하게 조정하여 사용하면 된다.
<br>
<br>

## :notebook_with_decorative_cover:도전과제

<img src="https://user-images.githubusercontent.com/70688424/114574545-4de79100-9cb4-11eb-97d5-aa271097ec6c.png">

처음 도전 과제를 보았을 때 어떻게 해야할 지 전혀 감이 안잡혀서 많이 힘들었다.
<br>
알아보니 '제스처'라는 것을 활용해서 하는 것이었고, 아직 공부해본 적이 없어 스택오버플로우에 있는 코드를 참고하여 구현했다.

<br>

<pre>
<code>
     // MARK: - 프로필 스와이프로 닫기 구현
    @objc func dragDownDissmiss(_ panG: UIPanGestureRecognizer) {
        let trY = panG.translation(in: panG.view!).y
        switch panG.state {
        case .began:
            break
        case .changed:
            view.transform = CGAffineTransform(translationX: 0, y: trY)
        case .ended, .cancelled:
            if trY > 160 {
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            }
        case .failed, .possible:
            break
        @unknown default:
            break
        }
    }
</code>
</pre>
제스처는 반드시 공부하고 넘어가야겠다.<br>
<br>
마지막으로, 어찌저찌 기능은 구현했지만 한 가지 문제가 생겼다.<br>
<img src="https://user-images.githubusercontent.com/70688424/114602226-54383600-9cd1-11eb-803b-98654ac233f3.gif" width="40%">
<br>
프로필을 내려서 닫으면 뒷 배경이 검정색으로 나타나는 것이었다.<br>
이 문제는 https://onelife2live.tistory.com/34 를 참고해서 해결했다.<br>

<pre>
<code>
    // MARK: - 프로필 버튼 구현
    @IBAction func profileBtnAction(_ sender: Any) {
        guard let pfVC = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else { return }
        pfVC.modalPresentationStyle = .overFullScreen
        self.present(pfVC, animated: true, completion: nil)
    }
</code>
</pre>

modalPresentationStyle을 FullScreen이 아닌, overFullScreen으로 설정하면 이전의 뷰 계층이 사라지지 않아 dismiss시 뒤에 배경처럼 남아있게 된다.<br>
<img src="https://user-images.githubusercontent.com/70688424/114603372-9ada6000-9cd2-11eb-9ebb-017ce9eabd42.gif" width="40%">

