//
//  ChangeParameterController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-21.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import web3swift
import BigInt

class ChangeParameterController: UIViewController {

    @IBOutlet weak var removeButton: CheckButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var secondButton: CheckButton!
    @IBOutlet weak var thirdButton: CheckButton!
    
    let jsonString = "[{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"donate\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"}],\"name\":\"createCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"createDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"ownerUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"withdraw\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"charityMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"charityUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"time\",\"type\":\"string\"}],\"name\":\"changeTime\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"ownerMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"boxMap\",\"outputs\":[{\"name\":\"charity\",\"type\":\"address\"},{\"name\":\"operator\",\"type\":\"address\"},{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"balance\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"createOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"changeLocation\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"deleteDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"operatorAddress\",\"type\":\"address\"}],\"name\":\"deleteOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"operatorMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"charityAddress\",\"type\":\"address\"}],\"name\":\"deleteCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"ownerAddress\",\"type\":\"address\"}],\"name\":\"deleteOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"}],\"name\":\"createOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"operatorUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"}]"
    var type : String?
    var mode : String?
    var dropBoxArray = [Dropbox]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type)
        updateUI()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        if type! == "Charity"{
            secondButton.setTitle("Update", for: .normal)
            thirdButton.setTitle("Unregister", for: .normal)
        }
        else if type! == "Operator"{
            print("arrived")
            secondButton.setTitle("Telephone", for: .normal)
            thirdButton.setTitle("Location", for: .normal)
        }
        else if type! == "Owner"{
            secondButton.setTitle("Unregister", for: .normal)
            thirdButton.isHidden = true
        }
        //TO DO: get dropboxes associated
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        if type == "Charity"{
            mode = "Remove"
        }
        else if type == "Operator"{
            mode = "Remove"
        }
        else{
            mode = "Remove"
            
        }
        secondButton.defaultColor = UIColor.clear
        thirdButton.defaultColor = UIColor.clear
        removeButton.defaultColor = UIColor.lightGray
    }
    
    @IBAction func changeButtonPressed(_ sender: Any) {
        if type == "Charity"{
            mode = "Update"
        }
        else if type == "Operator"{
            mode = "Telephone"
        }
        else if type == "Owner"{
            mode = "Unregister"
        }
        secondButton.defaultColor = UIColor.lightGray
        thirdButton.defaultColor = UIColor.clear
        removeButton.defaultColor = UIColor.clear
    }
    
    @IBAction func thirdButtonPressed(_ sender: Any) {
        if type == "Operator"{
            mode = "Location"
        }
        else if type == "Charity"{
            mode = "Unregister"
        }
        thirdButton.defaultColor = UIColor.lightGray
        removeButton.defaultColor = UIColor.clear
        secondButton.defaultColor = UIColor.clear
    }
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ChangeParameterController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")
        let ks : EthereumKeystoreV3?
        
        ks = keystoreManager?.walletForAddress((keystoreManager?.addresses![0])!) as! EthereumKeystoreV3
        
        let web3Rinkeby = Web3.InfuraRinkebyWeb3()
        web3Rinkeby.addKeystoreManager(keystoreManager)
        var options = Web3Options.defaultOptions()
        options.gasLimit = BigUInt(10000000)
        options.from = ks?.addresses![0]
        options.value = 0
        
         let contractAddress = EthereumAddress("0x87D7aFBBFe2653a8b9C491C64dA92Ce2527F8346")
        
        let platform = web3Rinkeby.contract(jsonString, at: contractAddress, abiVersion: 2)
        
        let dropboxAddress = dropBoxArray[indexPath.row].etherAddress
        
        if mode == "Update"{
            let alert = UIAlertController(title: "Update Dropbox", message: "Change Operator or Owner", preferredStyle: .alert)
        }
        if mode == "Location"{
            //TO DO: Fix Location (GET LOCATION)
            let latitude = 0
            let longitude = 0
            
            
            let parameter = [dropboxAddress, latitude, longitude] as [AnyObject]
            do{
                let location = try platform?.method("changeLocation", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
                print(location)
            }
            catch{
                print(error)
            }
        }
        if mode == "Unregister"{
            if type == "Owner"{
                let alert = UIAlertController(title: "Confirmation", message: "Do you want to unregister as the owner for this drop box?", preferredStyle: .alert)
            }
            else if type == "Charity"{
                let alert = UIAlertController(title: "Confirmation", message: "Do you want to unregister as the operator for this drop box?", preferredStyle: .alert)
            }
            else if type == "Operator"{
                let alert = UIAlertController(title: "Confirmation", message: "Do you want to unregister as the charity for this drop box?", preferredStyle: .alert)            }
        }
        if mode == "Remove"{
            
        }
        tableView.reloadData()
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
        cell.locationOutlet.text = ("Cooridnates:( latitude:\(collectionItem.latitude), longtitude: \(collectionItem.longitude) )")
    
        return cell
    }
}
