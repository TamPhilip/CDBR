//
//  MainMenuController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-20.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit

class MainMenuController: UIViewController {

    @IBOutlet weak var typeLabel: UILabel!
    var type : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if type == nil{
            //GET TYPE FROM BLOCKCHAIN
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: CheckButton) {
        if sender.tag == 0{
            performSegue(withIdentifier: "goToGetQRCode", sender: self)
        }
        if sender.tag == 1{
            performSegue(withIdentifier: "goToChangeParameter", sender: self)
        }
        if sender.tag == 2{
            performSegue(withIdentifier: "goToQRReader", sender: self
            )
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToChangeParameter"{
            let destinationVC = segue.destination as! ChangeParameterController
            destinationVC.type = type!
        }
        if segue.identifier == "GoToQRReader"{
            let destinationVC = segue.destination as! QRReaderController
            destinationVC.type = type!
            
        }
    }
    
}
