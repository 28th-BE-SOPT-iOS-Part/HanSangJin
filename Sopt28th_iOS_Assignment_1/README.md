## :notebook_with_decorative_cover:1주차 과제 : 기본 UI요소 및 화면 전환 구현하기
<img src="https://user-images.githubusercontent.com/70688424/114021255-78e47600-98ab-11eb-927d-f50afb3308ea.png" width = "70%">
<img src="https://user-images.githubusercontent.com/70688424/114021464-b0ebb900-98ab-11eb-9995-f003213115db.png" width = "70%">
<img src="https://user-images.githubusercontent.com/70688424/114033430-383f2980-98b8-11eb-9520-526b0d31d387.png" width="70%">
<br>

## :notebook_with_decorative_cover:구현 결과
<img src="https://user-images.githubusercontent.com/70688424/114022334-9e25b400-98ac-11eb-96ca-a4d569e45a04.gif" width="40%">
<br>

## :notebook_with_decorative_cover:코드리뷰
<br>

### :pushpin:텍스트필드

<img src="https://user-images.githubusercontent.com/70688424/114026261-04143a80-98b1-11eb-882d-14f8db263cf3.png" width="320px"><br>
텍스트필드 효과는 https://github.com/raulriera/TextFieldEffects 를 참고했다.<br>
clear버튼은 처음엔 단순히 버튼에 이미지를 넣은 줄 알았는데, Xcode엔 직사각형 모양의 버튼만 존재하여 동그란 모양을 만들기 위해 한참 고생했다...<br>
구글링 하다보니 자체적인 기능으로 존재한다는 것을 처음 알게 되었다.
<pre>
<code>
    // MARK: - 텍스트 필드 clear 버튼 구현
    func clearBtnSet() {
        id.clearButtonMode = .whileEditing
        pw.clearButtonMode = .whileEditing
    }
</pre>
</code>
:point_right: 이 기능은 나중에도 많이 활용될 것 같아 잘 익혀두어야 겠다고 생각했다!!!
<br>
<hr>

### :pushpin:로그인&회원가입

<img src="https://user-images.githubusercontent.com/70688424/114023944-6f104200-98ae-11eb-9998-e115d7ec2442.png" width="30%"> <img src="https://user-images.githubusercontent.com/70688424/114023950-70416f00-98ae-11eb-9f58-93f564a06ef4.png" width="30%"> <img src="https://user-images.githubusercontent.com/70688424/114029638-ac77ce00-98b4-11eb-9a26-4b4f7ca61682.png" width="30%">
<br>

아이디 혹은 비밀번호가 입력되지 않았을 때는 로그인이 되지 않도록 처리했으며, alert가 발생하도록 했다.<br>
추가적으로, 회원가입시 비밀번호 확인 문자가 비밀번호와 일치하지 않을 때도 회원가입이 되지 않도록 했다.<br>

<pre>
<code>
    // MARK: - 로그인 버튼 구현
    @IBAction func loginBtnAction(_ sender: Any) {
        if id.text == "" {
            let alert = UIAlertController(title: "알림", message: "이메일 또는 전화번호를 확인하세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else if pw.text == "" {
            let alert = UIAlertController(title: "알림", message: "비밀번호를 확인하세요.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "CompleteViewController") as? CompleteViewController else { return }
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.message = id.text
            self.present(nextVC, animated: true, completion: clearText)
        }
    }
</code>
</pre>
또한 로그인 이후 다시 메인 화면으로 돌아왔을 때도 텍스트필드에 ID와 비밀번호가 그대로 남아있어 이를 해결하는 함수를 추가했다.<br>
<pre>
<code>
    // MARK: - 텍스트 필드 clear 기능 구현
    func clearText() {
        id.text = nil
        pw.text = nil
    }
</code>
</pre>

<br>
<hr>

### :pushpin:화면 조정

<img src="https://user-images.githubusercontent.com/70688424/114030832-ba7a1e80-98b5-11eb-8cb1-507a1bc5c966.gif" width="40%"><br>
로그인을 하기 위해 텍스트필드를 터치할 때 키보드에 버튼이 가려지는 현상이 생겨 화면을 조정했으며, 화면을 터치하면 키보드가 사라지도록 구현했다.<br>

<pre>
<code>
    // MARK: - 화면 터치 이벤트 구현
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    // MARK: - 키보드 노티피케이션
    func keyboardNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - 키보드 높이 세팅
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -40
    }
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
</code>
</pre>
