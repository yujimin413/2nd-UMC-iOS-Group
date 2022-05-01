//
//  ViewController.swift
//  Protocol
//
//  Created by 임영준 on 2022/04/10.
//

import UIKit


protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        //guard문은 if문과 똑같은 형태 공부할 것!
        
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

