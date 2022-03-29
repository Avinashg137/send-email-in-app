//
//  ViewController.swift
//  mailcompose
//
//  Created by MAC OS on 29/03/22.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController , MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        // Do any additional setup after loading the view.
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        view.addSubview(button)
        button.setTitle("click here", for: .normal)
        button.backgroundColor = .link
        button.center = view.center
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    @objc private func didTapButton() {
        
        if MFMailComposeViewController.canSendMail() {
            
            let vc = MFMailComposeViewController()
            vc.delegate = self
            vc.setSubject("contact")
            vc.setToRecipients(["avinashg.itpath@gmail.com"])
            vc.setMessageBody("<h1> hello world </h1>", isHTML: true)
            present(UINavigationController(rootViewController: vc), animated: true)
        } else {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
      
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
        
        
}

