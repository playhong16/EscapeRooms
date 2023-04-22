//
//  ThemesManager.swift
//  EscapeRooms
//
//  Created by playhong on 2023/02/23.
//

import UIKit

final class ThemeDataManager {
    
    static let shared = ThemeDataManager()
    private init() {}
    
    func makeThemeData() -> [Theme] {
        let themeData = [
            Theme(image: UIImage(named: "그림자 없는 상자.jpeg"), name: "그림자 없는 상자", company: "방탈출, 단편선", difficulty: "🎮🎮🎮", playTime: "75분" , personnel: "2인 ~ 4인",
                  story: """
                  "미안해 누나. 근데 내가 맞았어.
                  결국 끝도, 시작도 누나한테 달렸어."
                  
                  안다. 비극에 대처하는 방법은 우리 모두 각자 다르다는 것을.
                  또한 안다. 어린 나이의 동생에게 막내의 죽음은 감당하기 힘든 일이었을 것이라는 것을.
                  
                  하지만 시현아, 누나도 사람이고, 힘들고 아파.
                  
                  초자연적인 물체니 뭐니... 동생의 망상을 견뎌주는 것도 이제 한계다.
                  지쳐버린 나는 이 허무맹랑한 문자를 받고, 마지막으로 쓴소리를 해주러 시현이의 집으로 향했다.
                  """, price: "25000원", address: nil),
            Theme(image: UIImage(named: "MAYDAY.jpeg"), name: "MAYDAY", company: "비트포비아 강남 던전Ⅱ", difficulty: "🎮🎮🎮🎮", playTime: "65분" , personnel: "2인 ~ 5인",
                  story: """
                  오랜 꿈이었던 우주연구원이 된 당신.
                  첫 번째 미션을 성공적으로 완수하고 지구로 돌아가려던 그때
                  
                  멀지 않은 곳에서 구조요청 신호가 들어오는데...
                   
                  “MAYDAY! MAYDAY!”
                  
                        
                  ʹ̴̵̸͙͖̹̼͓̺͉͎͚͒̉́͟͢͜ͅVʹ̸̵͇͚̻͖͒̃͆̿̎͜͟Aʹ̴͕͉̻͔͝Nʹ̴͚͙͔͎͉͓̼͕̹̻͖͢͟͜ ̾̐̀͂̎̒̇내ʹ̴̵̸̶͓͈͔͍̺͉͕͇͎͙͖̼͚͜͟͢ ͚͐̐̓̈̀̎̊̋마ʹ̴̵̸͚͇̺͕̹̻͍͈͔͖͎͢͜͟ͅ ͗͝ㄹʹ͈͖̺͇͉̻̈́ͅ들ʹ͈̉̍̌̋̕려ʹ̶̼͕͓͎͙?

                  ̑̂̍̽́̈́̑̂̍̽́̈́̚̚나ʹ̵̶̸͇̼͓͉̺͢ ̎̓͋͡좀ʹ̴̷͚͇̺͍͈͕͔̻͓͙͢͜ͅ ̽구ʹ̸̷̵̴̛͍̹͓͕͎͔̼͉͈͖̺̍̐͂̀͊͟͜͢͠해ʹ̸̷͓͖̹̻͉͎͍͙͚͕͔̑̂̀̆͡ͅ줘ʹ͓͉̺͎͙͢ͅ ̏͗̇̊̅제ʹ̛̹͔͕͓͚̀̎̂̋̏̚͟͠͝발ʹ̹͚͟
                  """, price: "25000원", address: nil),
            Theme(image: UIImage(named: "강남목욕탕.jpeg"), name: "강남목욕탕", company: "비트포비아 강남 던전", difficulty: "🎮🎮", playTime: "60분" , personnel: "2인 ~ 5인",
                  story: """
                  “한 번 들어갔다 나오면 무조건 100% 피로가 회복되는 1인 강남목욕탕”
                   
                  중요한 경기를 앞두고 완벽한 컨디션 관리를 위해서 강남목욕탕에 방문했는데,
                  아뿔사! 오늘이 강남목욕탕 휴일이라니…
                  이대로 돌아갈 순 없다.

                  어떻게든 들어가서 최고의 컨디션을 만들어 나와야 한다!
                  """, price: "25000원", address: nil),
            Theme(image: UIImage(named: "꿈의 공장.jpeg"), name: "꿈의 공장", company: "비트포비아 홍대 던전", difficulty: "🎮🎮🎮", playTime: "60분" , personnel: "2인 ~ 5인",
                  story: """
                  "OK 컷! 모두 수고하셨습니다!!!"
                  이게 무슨 소리냐고요? 꿈 제작이 완료됐음을 알리는 소리에요!

                  여기는 꿈의 공장, 당신의 오늘 하루를 마무리 짓고
                  내일 하루를 열어 주는 즐거운 꿈을 만드는 곳이죠.
                     
                  당신도 꿈이 필요하신가요?
                  그렇다면 당신의 이야기를 꿈의 공장으로 보내주세요!
                  """, price: "25000원", address: nil),
            Theme(image: UIImage(named: "전래동자살사건.png"), name: "전래동 자살사건", company: "비트포비아 던전101", difficulty: "🎮🎮🎮", playTime: "70분" , personnel: "2인 ~ 5인",
                  story: """
                  시스템을 이용해 시공간을 넘나드는 수사가 가능해진 사회.
                  과거 전래동에서 발생했던 의문의 자살 사건에 대한 진상을 파헤치기 위해,
                   
                  우리는 포탈을 열고 2060년의 전래동으로 향한다.
                  """, price: "25000원", address: nil),
            Theme(image: UIImage(named: "MST엔터테인먼트.png"), name: "MST 엔터테인먼트", company: "비트포비아 던전101", difficulty: "🎮🎮🎮", playTime: "60분" , personnel: "2인 ~ 5인",
                  story: """
                  [단독] 유명 기획사 MST, 숨겨진 충격 비밀!

                  최근 우리나라 대표 기획사인 MST 엔터테인먼트가 의혹에 휩싸였다.
                  기획사 측은 해당 의혹에 관해 "사실 무근이다. 강경대응 하겠다." 라고 전했다.

                  MST 엔터테인먼트를 둘러싼 의혹은 여전히 풀리지 않았으며, 확실한 증거가 필요할 것으로 보인다.

                  던지연 기자(dungeon@xphobia.net)

                  "자..미끼는 던졌고, 오늘 밤 잠입 취재 시작이다!"
                  """, price: "25000원", address: nil)
        ]
        return themeData
    }
    
    func getThemeData() -> [Theme] {
        let themeData = makeThemeData()
        return themeData
    }
    
//    func getLikeThemesData() -> [Theme] {
//        print(likeThemes)
//        return likeThemes
//    }
    
//    func updateLikeThemeData(_ data: Theme) {
//        print(#function)
//        likeThemes.append(data)
//        print(likeThemes.count)
//    }
    
//    func removeLikeThemeData(_ Index: Int) {
//        print(#function)
//        likeThemes.remove(at: Index)
//        print(likeThemes.count)
//    }
}
