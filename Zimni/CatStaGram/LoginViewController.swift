//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/04/03.
//

import UIKit

class LoginViewController: UIViewController {
    
    // 아래에서 text 값 받아왔으므로 controller에서 받아야 함
    var email = String()
    var password = String()
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
        
        
    }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // Option - 두 상태를 하나로 정함
        // 값이 있을 수도 없을 수도 있음
        // ?? "" 붙여서 해결
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
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
