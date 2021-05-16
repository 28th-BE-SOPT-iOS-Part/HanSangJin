## :notebook_with_decorative_cover:4주차 과제 : 서버 연동

<img src="https://user-images.githubusercontent.com/70688424/118405790-62a0b580-b6b4-11eb-8d4b-300d6032ec7b.png" width="70%">

<img src="https://user-images.githubusercontent.com/70688424/118405792-65030f80-b6b4-11eb-95c9-e369aa58fd30.png" width="70%">

<br>

## :notebook_with_decorative_cover:구현 결과

<img src="https://user-images.githubusercontent.com/70688424/118405911-e9ee2900-b6b4-11eb-8072-b47286df5d66.png" width="330">

Alamofire를 활용해 서버와 통신하기 위한 기본 작업들 자체가 아직 익숙하지도 않고, 솔직히 어떤 것들을 해야하는지도 확실히 알지를 못해서 그냥 세미나 때 했던 것들을 거의 대부분 그대로 복붙해서 해결했다.

세미나 때 스킵하고 넘어갔던, 로그인이 아닌 회원가입을 하는 과정은 로그인과 관련된 코드들에서 조금씩 수정하니 해결할 수 있었다.

처음에 TableView와 CollectionView를 배웠을 때도 많이 낯설고 어려웠는데, 이번에 배운 서버연동은 훨~~~씬 더 낯설고 어렵다...ㅠㅠㅠ

<br>
<br>

## :notebook_with_decorative_cover:도전과제

<img src="https://user-images.githubusercontent.com/70688424/118405793-659ba600-b6b4-11eb-8329-be48c911be5e.png">

로그인을 다루는 네트워킹 관련 파일에서 judgeStatus 함수 부분을 수정하는 것으로 해결했다.

```
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LoginDataModel.self, from: data)
        else { return .pathErr}
        
        switch statusCode {
        
        case 200:
            if let token = decodedData.data?.token {
                UserDefaults.standard.set(token, forKey: "user_token")
            }
            print("저장된 토큰: ", UserDefaults.standard.value(forKey: "user_token")!)
            return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
```

내가 회원가입 했던 아이디로 로그인을 하면, 아래와 같은 토큰이 출력되는 것을 확인할 수 있었다.

<img src="https://user-images.githubusercontent.com/70688424/118406180-135b8480-b6b6-11eb-991f-c977b96bd1cb.png">

구글링하며 알아보니, 이런 토큰을 통해 자동 로그인 같은 기능을 구현할 수 있다는데 맞는 정보인지는 모르겠다.