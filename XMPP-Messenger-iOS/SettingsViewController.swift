//
//  SettingsViewController.swift
//  XMPP-Messenger-iOS
//
//  Created by Joshua Motley on 8/4/16.
//  Copyright © 2016 Josh Motley. All rights reserved.
//

import UIKit
import XMPPFramework
import xmpp_messenger_ios

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var validate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if OneChat.sharedInstance.isConnected() {
            username.hidden = true
            password.hidden = true
            validate.setTitle("Disconnect", forState: UIControlState.Normal)
        } else {
            if NSUserDefaults.standardUserDefaults().stringForKey(kXMPP.myJID) != "kXMPPmyJID" {
                username.text = NSUserDefaults.standardUserDefaults().stringForKey(kXMPP.myJID)
                password.text = NSUserDefaults.standardUserDefaults().stringForKey(kXMPP.myPassword)
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func validate(sender: AnyObject) {
        
    }
    
    func DismissKeyBoard(){
        if username.isFirstResponder(){
            username.resignFirstResponder()
        }else if password.isFirstResponder(){
            password.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if password.isFirstResponder(){
            textField.resignFirstResponder()
            validate(self)
        }else{
            textField.resignFirstResponder()
        }
        return true
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
