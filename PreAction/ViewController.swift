//
//  ViewController.swift
//  PreAction
//
//  Created by Arie Peretz on 22/11/2020.
//  Copyright © 2020 Arie Peretz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        let viewModel: MessageViewModel = MessageViewModel.fetchMessage()
        let sb = UIStoryboard(name: "Main", bundle: nil)
            if let vc = sb.instantiateViewController(withIdentifier: "MessageViewController") as? MessageViewController {
            vc.setMessagee(viewModel: viewModel)
            self.present(vc, animated: true, completion: nil)
        }
    }

}

struct MessageModel {
    let name: String
}

class MessageViewModel {
    var message: MessageModel?
    
    init(message: MessageModel) {
        self.message = message
    }
    
    static func fetchMessage() -> MessageViewModel {
        let message: MessageModel = MessageModel(name: "some message")
        print("Pre Action Performed")
        return MessageViewModel(message: message)
    }
    
    func performAction() {
        if let message = self.message {
            print("Action Performed with message: \(message.name)")
        } else {
            print("Action Performed with no message")
        }
    }
}

class MessageViewController: UIViewController {

    var viewModel: MessageViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setMessagee(viewModel: MessageViewModel) {
        self.viewModel = viewModel
    }
    
    @IBAction func onPerformAction(_ sender: UIButton) {
        self.viewModel?.performAction()
    }

}

