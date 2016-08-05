//
//  ChatViewController.swift
//  XMPP-Messenger-iOS
//
//  Created by Joshua Motley on 8/4/16.
//  Copyright © 2016 Josh Motley. All rights reserved.
//

import UIKit
import xmpp_messenger_ios
import JSQMessagesViewController
import XMPPFramework

protocol ContactPickerDelegate {
    func didSelectContact(recipient: XMPPUserCoreDataStorageObject)
}

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var recipient = XMPPUserCoreDataStorageObject?
        
        var firstTime = true
        
        var delegate:ContactPickerDelegate?
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        if let recipient = recipient {
            navigationItem.rightBarButtonItems = []
            navigationItem.title = recipient.displayName
        } else {
            navigationItem.title = "New"
            navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addRecipient"), animated: true)
            
            if firstTime {
                firstTime = false
            addRecipient()
            }
        }

    }
    
    func addRecipient() {
        let navController = storyboard?.instantiateViewControllerWithIdentifier("contactListNav") as? UINavigationController
        presentViewController(navController!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
