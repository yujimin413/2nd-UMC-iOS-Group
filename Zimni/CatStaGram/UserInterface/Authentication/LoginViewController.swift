//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/04/03.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    // 아래에서 text 값 받아왔으므로 controller에서 받아야 함
    var email = String()
    var password = String()
    var userInfo: UserInfo? // UnserInfo 구조체를 optional로 선언
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()

    }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // Option - 두 상태를 하나로 정함
        // 값이 있을 수도 없을 수도 있음
        // ?? "" 붙여서 해결
        let text = sender.text ?? ""
        self.loginButton.backgroundColor
        = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.count > 2 ? .facebookColor : .disabledButtonColor
        
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입정보를 전달받아서, 그것과 textField 데이터가 일치하면,
        // 로그인이 되어야 한다.
        guard let userInfo = self.userInfo else { return }  // optional을 해지하는 새로운 방법
        if userInfo.email == self.email
            && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            
            self.view.window?.windowScene?.keyWindow?.rootViewController = vc
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true, completion: nil)
        }
//        else {
//
//        }
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환
        // 1. 스토리보드 생성
        // 메인스토리보드의 경우 아래처럼 직접 생성하지 않아도 자동으로 연결해주긴히지만 스토리보드가 여러개인 경우 직접 생성해줘야 함
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러 생성
        // 뷰컨트롤러 - 메인스토리보드 내부에 있음
        // withIdentifier : id값으로 insantiateViewController에 접근하므로 id값 ""에 넣어줌
        // as! 타입캐스팅
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해서 화면 전환
        // animated : 애니메이션 유무 (true / false)
        // completion : 화면전환 이후 필요한 동작 있을 때 코드 작성 (없으면 nil)
    
        //화면전환 가로로 나타나게 하기 위한 주석 처리
        // self.present(registerViewController, animated: true, completion: nil)
        
        // navigationController의 push -> 화면전환 가로로 나타나게 함
        // main에서 navigationController 생성 후 사용
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // ARC (swift에서 처리하는 메모리 관리 방법 중 하나)
        // weak self 써주면 강한 참조에서 약한 참조로 바뀜
        // ARC -> 강한참조 / 약한참조 -> ARC 낮춰줌 (강한참조의 경우 메모리 해제해도 남아있어 메모리 낭비 )
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
            
        }
        
        
    }
    
    private func setupAttribute() {
            // registerButton

            let text1 = "계정이 없으신가요?"
            let text2 = "가입하기"

            let font1 = UIFont.systemFont(ofSize: 13)
            let font2 = UIFont.boldSystemFont(ofSize: 13)

            let color1 = UIColor.darkGray
            let color2 = UIColor.facebookColor

            let attributes = generateButtonAttribute(
                self.registerButton,
                texts: text1, text2,
                fonts: font1, font2,
                colors: color1, color2)

            self.registerButton.setAttributedTitle(attributes, for: .normal)
        }
}
