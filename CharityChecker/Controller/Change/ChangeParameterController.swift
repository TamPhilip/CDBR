//
//  ChangeParameterController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-21.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit

class ChangeParameterController: UIViewController {

    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var type : String?
    var mode : String?
    var dropBoxArray = [Dropbox]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        if type == "Charity"{
            secondButton.titleLabel?.text = "Update"
            thirdButton.isHidden = true
        }
        else if type == "Operator"{
            removeButton.titleLabel?.text = "Unregister"
            secondButton.titleLabel?.text = "Telephone"
            thirdButton.titleLabel?.text = "Location"
        }
        else{
            removeButton.titleLabel?.text = "Unregister"
            secondButton.isHidden = true
            thirdButton.isHidden = true
        }
        //TO DO: get dropboxes associated
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        if type == "Charity"{
            mode = "Remove"
        }
        else if type == "Operator"{
            mode = "Unregister"
        }
        else{
            mode = "Unregister"
        }
    }
    
    @IBAction func changeButtonPressed(_ sender: Any) {
        if type == "Charity"{
            mode = "Update"
        }
        else if type == "Operator"{
            mode = "Telephone"
        }
    }
    
    @IBAction func thirdButtonPressed(_ sender: Any) {
        if type == "Operator"{
            mode = "Location"
        }
    }
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ChangeParameterController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if mode == "Update"{
            
        }
        if mode == "Location"{
            
        }
        if mode == "Unregister"{
            
        }
        if mode == "Location"{
            
        }
        if mode == "Remove"{
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropBoxArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parameterCell", for: indexPath) as! ParameterCell
        let collectionItem = dropBoxArray[indexPath.row]
        
        print("created")
        cell.ownerNameOutlet.text = collectionItem.owner
        cell.operatorNameOutlet.text = collectionItem.operate
        cell.charityNameOutlet.text = collectionItem.charity
        cell.telephoneOutlet.text = collectionItem.telephone
        cell.locationOutlet.text = collectionItem.location
    
        return cell
    }
}
