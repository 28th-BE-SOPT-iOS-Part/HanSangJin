<img src="https://user-images.githubusercontent.com/70688424/121516720-8512be00-ca29-11eb-9c9a-eb33a0b7ffe3.png" width="1200">

<hr><br><br>

# :notebook_with_decorative_cover:Animation

### ๐๋ก๋ฉ์ค ๋ํ๋ด๊ธฐ

์ฑ์ด ๋ก๋ฉ์ค์ด๋ผ๋ฉด ์ฌ์ฉ์๋ค์๊ฒ ๋ชํํ๊ฒ ๋ํ๋ด ์ค ํ์๊ฐ ์๋ค.

์ฌ์ฉ์๋ค์ ๋ณด๊ธธ ์ํ๋ ํ๋ฉด์ด ๊ณง๋ฐ๋ก ๋ณด์ฌ์ง๊ธธ ์ํ๊ธฐ ๋๋ฌธ์ ์ ๋๋ฉ์ด์, ๊ทธ๋ํฝ, ํ๋ ์ด์ค ํ๋ ๋ฑ์ ํ์ฉํด ์ปจํ์ธ ๊ฐ ๋ก๋ฉ์ค์ธ์ง ์๋ณํ๋๋ก ํด์ผํ๋ค.

<img src="https://user-images.githubusercontent.com/70688424/121513791-34e62c80-ca26-11eb-9293-bb1626e08d8b.gif" width="320">

UIActivityIndicator๋ฅผ ์ฌ์ฉํ๊ฑฐ๋, Lottie์ ๊ฐ์ ์ปค์คํ ๋ก๋ฉ๋ฐ๋ฅผ ๊ตฌํํ์ฌ ์ปจํ์ธ ๊ฐ ๋ก๋ฉ์ค์์ ๋ํ๋ด์ค๋ค.

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

### ๐๋น๊ฒจ์ ์๋ก๊ณ ์นจ ์ค ๋ํ๋ด๊ธฐ

SNS ํน์ ์ปค๋ฎค๋ํฐ ์ฑ ๋ฑ์์ ํ๋ฉด์ ๋น๊ฒจ ๋ชฉ๋ก์ ์๋ก๊ณ ์นจํ๋ ์ ์ค์ฒ๊ฐ ์์ฃผ ์ฌ์ฉ๋๋ค.

<img src="https://user-images.githubusercontent.com/70688424/121513071-690d1d80-ca25-11eb-845f-a57b3e4f9878.gif" width="320">

์ด๋ฌํ ์ํฉ์์  ์ฌ์ฉ์๋ค์๊ฒ ํ๋ฉด์ ๋น๊ฒจ ์๋ก๊ณ ์นจ์ด ์งํ๋๊ณ  ์์์ ๋ํ๋ด์ฃผ๊ธฐ ์ํ ์ ๋๋ฉ์ด์์ด ์ฌ์ฉ๋๋ค.

<br>

### ๐์๊ฐ์  ํจ๊ณผ

์ด์ธ์๋ ์๊ฐ์ ์ธ ํจ๊ณผ๋ฅผ ์ฃผ๊ฑฐ๋ ์ฌ์ฉ์์ ํ๋์ ๋ฐ๋ฅธ ํผ๋๋ฐฑ์ ์ฃผ๊ณ ์ ํ  ๋, ์์์  ์ ๋๋ฉ์ด์ ํจ๊ณผ๊ฐ ์ฌ์ฉ๋๋ค.

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
        print("์๋ก๊ณ ์นจ!")
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
