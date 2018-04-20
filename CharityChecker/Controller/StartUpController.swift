//
//  StartUpController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-19.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import web3swift

class StartUpController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ownerButton: CheckButton!
    @IBOutlet weak var operatorButton: CheckButton!
    @IBOutlet weak var publicButton: CheckButton!
    @IBOutlet weak var charityButton: CheckButton!
    
    var type : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.adjustsFontSizeToFitWidth = true
        
        let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")
      
        if keystoreManager?.addresses?.count != 0{
            performSegue(withIdentifier: "loggedIn", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: CheckButton) {
        if sender.tag == 0{
            type = "Charity"
            
        }
        else if sender.tag == 1{
            type = "Owner"
        }
        else if sender.tag == 2{
            type = "Operator"
        }
        else if sender.tag == 3{
            performSegue(withIdentifier: "goToQRReader", sender: self)
        }
         performSegue(withIdentifier: "goToLogIn", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLogIn"{
            let destinatioVC = segue.destination as? UINavigationController
            let loginVC = destinatioVC?.viewControllers.first as! LogInController
            loginVC.type = type
        }
    }
}
