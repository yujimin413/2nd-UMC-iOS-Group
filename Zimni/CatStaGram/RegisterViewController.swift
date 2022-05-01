//
//  RegisterViewController.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/04/03.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    // 유효성 검사를 위한 프로퍼티
    var isValidEmail = false {
        didSet {    //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet {    //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet {    //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet {    //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
// 기존 Back button 제거 코드
//    override func viewWillAppear(_ animated: Bool) {
//         super.viewWillAppear(animated)
//         self.navigationItem.hidesBackButton = true
//    }
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    // Textfields
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    // 연산 프로퍼티 사용하여 반복되는 코드 줄이기
    // 배열 선언해서 forEach 사용
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil

    }
    
    // MARK: - Actions
    @objc   // IBAction과 차이
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?
            .popViewController(animated: true)
    }
    @IBAction func registerButtonDidtap(_ sender: UIButton) {
        //뒤로가기
        self.navigationController?
            .popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    
    
    
    
    // MARK: - Helpers
    // textfield와 action 연결
    private func setupTextField() {
        
        // 여러개 동시 연산,, forEach 활용
        textFields.forEach { tf in
            tf.addTarget(self,
                         action: #selector(textFieldEditingChanged(_:)),
                         for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI 업테이트
    private func validateUserInfo() {
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
        } else {
            // 유효성 검사 -> 유효하지 않음
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .disabledButtonColor
            }
        }
    }
    
    private func setupAttribute() {
            // registerButton

            let text1 = "계정이 있으신가요?"
            let text2 = "로그인"

            let font1 = UIFont.systemFont(ofSize: 13)
            let font2 = UIFont.boldSystemFont(ofSize: 13)

            let color1 = UIColor.darkGray
            let color2 = UIColor.facebookColor

            let attributes = generateButtonAttribute(
                self.popToLoginButton,
                texts: text1, text2,
                fonts: font1, font2,
                colors: color1, color2)

            self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
        }


}

// 정규표현식 -> 문법 구글링하기. 내용 복잡해서 보통 한 번 만들어두고 재사용
extension String {
    func isValidPassword() -> Bool {
        //대문자, 소문자, 특수문자, 숫자 8자 이상일 때, -> True
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @ 2글자
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9,-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}
