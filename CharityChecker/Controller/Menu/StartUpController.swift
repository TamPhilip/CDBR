//
//  StartUpController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-19.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import web3swift
import BigInt

class StartUpController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ownerButton: CheckButton!
    @IBOutlet weak var operatorButton: CheckButton!
    @IBOutlet weak var publicButton: CheckButton!
    @IBOutlet weak var charityButton: CheckButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var buttons: [CheckButton]!
    
     let jsonString = "[{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"donate\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"}],\"name\":\"createCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"createDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"ownerUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"withdraw\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"charityMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"charityUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"time\",\"type\":\"string\"}],\"name\":\"changeTime\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"ownerMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"boxMap\",\"outputs\":[{\"name\":\"charity\",\"type\":\"address\"},{\"name\":\"operator\",\"type\":\"address\"},{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"balance\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"createOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"changeLocation\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"deleteDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"operatorAddress\",\"type\":\"address\"}],\"name\":\"deleteOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"operatorMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"charityAddress\",\"type\":\"address\"}],\"name\":\"deleteCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"ownerAddress\",\"type\":\"address\"}],\"name\":\"deleteOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"}],\"name\":\"createOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"operatorUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"}]" 
    
    var type : String = ""
    var ks : EthereumKeystoreV3?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.adjustsFontSizeToFitWidth = true
        view.sendSubview(toBack: imageView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    
        let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")

        if keystoreManager?.addresses?.count == 0{
            ks = try! EthereumKeystoreV3.init(password: "Whocares")
            let keydata = try! JSONEncoder().encode(ks!.keystoreParams)
            FileManager.default.createFile(atPath: userDir + "/keystore"+"/key.json", contents: keydata, attributes: nil)
            print(ks?.addresses?.first)
        }else{
            ks = keystoreManager?.walletForAddress((keystoreManager?.addresses![0])!) as! EthereumKeystoreV3
            print(keystoreManager?.addresses![0])
        }
        
        print(type)
        type = getType()
        
        if type == "Public"{
            
        }else{
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
            type = "Public"
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
        if segue.identifier == "loggedIn"{
            let destinationVC = segue.destination as! MainMenuController
            destinationVC.type = type
        }
    }
    
    
    func getType() -> String{
        let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")
        
        if let keyAddress = keystoreManager!.addresses!.first{
            let web3Rinkeby = Web3.InfuraRinkebyWeb3()
            web3Rinkeby.addKeystoreManager(keystoreManager)
            var options = Web3Options.defaultOptions()
            options.gasLimit = BigUInt(10000000)
            options.from = keyAddress
            options.value = 0
            
            let contractAddress = EthereumAddress("0x87D7aFBBFe2653a8b9C491C64dA92Ce2527F8346")
            
            let platform = web3Rinkeby.contract(jsonString, at: contractAddress, abiVersion: 2)
            
            
            let parameter = [keyAddress] as [AnyObject]
            
            do {
                let operate = try platform!.method("operatorMap", parameters: parameter, options: options)!.call(options: options).dematerialize()
                print(operate)
                if operate["name"] as! String != ""{
                     return "Operator"
                }
            }catch{
                print(error)
            }
            do {
                let operate = try platform!.method("ownerMap", parameters: parameter, options: options)!.call(options: options).dematerialize()
                print(operate)
                if operate["name"] as! String != ""{
                    return "Owner"
                }
            }catch{
                print(error)
            }
            do {
                let operate = try platform!.method("charityMap", parameters: parameter, options: options)!.call(options: options).dematerialize()
                print(operate)
                if operate["name"] as! String != ""{
                    return "Charity"
                }
            }catch{
                print(error)
            }
        }
        return "Public"
    }
}
