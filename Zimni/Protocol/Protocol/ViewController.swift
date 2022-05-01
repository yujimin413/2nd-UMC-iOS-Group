//
//  ViewController.swift
//  Protocol
//
//  Created by 유지민 on 2022/04/11.
//

import UIKit


protocol SayHi {
    func hi()
}

class Hi : SayHi {
    func hi() {
        print("안녕하세요")
    }
}
//protocol Receiveable {
//    func frceived(data: Any, from: Sendable)
//}
//
//extension Receiveable {
//    //메세지 수신
//    func received(data: Any, from: Sendable) {
//        print("\(self) received \(data) from \(from)")
//    }
//}
//
////발신 기능
//protocol Sendable {
//    var from: Sendable { get }
//    var to: Receiveable? { get }
//
//    func send(data: Any)
//
//    static func isSendableInstacnce(_ instance: Any) -> Bool
//}
//
//extension Sendable {
//    var from: Sendable {
//        return self
//    }
//}
//
//// 메세지 발신
//func send(data: Any) {
//    guard let receiver: Receiveable = self.to else {
//        print("Message has no receiver")
//        return
//    }
//    receiver.received(data: data, from: self.from)
//}
//
//static func isSendableInstance(_ instance: Any) -> Bool {
//    if let sendableInstance: Sendable = instance as? Sendable {
//        return sendableInstance.to != nil
//    }
//    return false
//}
    
     


class ViewController: UIViewController {
    
    let sayHi = Hi()
    //let person = Person()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sayHi.hi()
    }


}

