<img src="https://user-images.githubusercontent.com/70688424/121516720-8512be00-ca29-11eb-9c9a-eb33a0b7ffe3.png" width="1200">

<hr><br><br>

# :notebook_with_decorative_cover:Animation

### 🎈로딩중 나타내기

앱이 로딩중이라면 사용자들에게 명확하게 나타내 줄 필요가 있다.

사용자들은 보길 원하는 화면이 곧바로 보여지길 원하기 때문에 애니메이션, 그래픽, 플레이스 홀더 등을 활용해 컨텐츠가 로딩중인지 식별하도록 해야한다.

<img src="https://user-images.githubusercontent.com/70688424/121513791-34e62c80-ca26-11eb-9293-bb1626e08d8b.gif" width="320">

UIActivityIndicator를 사용하거나, Lottie와 같은 커스텀 로딩바를 구현하여 컨텐츠가 로딩중임을 나타내준다.

```
    lazy var lottieView : AnimationView = {
            let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
            animationView.frame = CGRect(x: 0, y: 0,
                                         width: 100, height: 100)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFill
            animationView.stop()
            animationView.isHidden = true
        
            
            return animationView
        }()

    @IBAction func startBtnAction(_ sender: Any) {
        lottieView.isHidden = false
        lottieView.play()
    }
    
    @IBAction func stopBtnAction(_ sender: Any) {
        lottieView.isHidden = true
        lottieView.stop()
    }
```

<br>

### 🎈당겨서 새로고침 중 나타내기

SNS 혹은 커뮤니티 앱 등에서 화면을 당겨 목록을 새로고침하는 제스처가 자주 사용된다.

<img src="https://user-images.githubusercontent.com/70688424/121513071-690d1d80-ca25-11eb-845f-a57b3e4f9878.gif" width="320">

이러한 상황에선 사용자들에게 화면을 당겨 새로고침이 진행되고 있음을 나타내주기 위한 애니메이션이 사용된다.

<br>

### 🎈시각적 효과

이외에도 시각적인 효과를 주거나 사용자의 행동에 따른 피드백을 주고자 할 때, 시작적 애니메이션 효과가 사용된다.

<img src="https://user-images.githubusercontent.com/70688424/121514276-cbb2e900-ca26-11eb-9481-62369b95e819.gif" width="320">

```
lazy var lottieView : AnimationView = {
        let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
        animationView.frame = CGRect(x: 0, y: 0,
                                     width: 100, height: 100)
        
        let centerX = UIScreen.main.bounds.width / 2
        animationView.center = CGPoint(x: centerX, y: 40)
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        
        return animationView
    }()

    func initRefresh()
    {
        refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
        refreshControl.addSubview(lottieView)
        refreshControl.tintColor = .clear
        sampleTableView.refreshControl = refreshControl
    }
    
    @objc func refreshTable(refresh: UIRefreshControl){
        print("새로고침!")
        lottieView.isHidden = false
        lottieView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.sampleTableView.reloadData()
            self.lottieView.isHidden = true
            self.lottieView.stop()
            refresh.endRefreshing()
        } 
    }
```
