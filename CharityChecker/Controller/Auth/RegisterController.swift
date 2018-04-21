//
//  RegisterController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-19.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import web3swift

class RegisterController: UIViewController {

    var type : String!

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!


    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    
    @IBOutlet var charityLabels: [UILabel]!
    @IBOutlet var charityField: [UITextField]!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    
    var address : String?
    var latitude : CLLocationDegrees?
    var longitude : CLLocationDegrees?
    
    let operatorTypeArray = ["Charity","Charity-Authorized","Unaffiliated Collector"]
    var operatorType : String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        updateUI(type: type)
        view.sendSubview(toBack: imageView)
        addressLabel.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleRegister(_ sender: UIButton) {
        if type == "Charity"{
            //TO DO: RegistrationKey & Name
            let registrationKey = firstField.text
            let name = secondField.text
            
            let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")
            let ks : EthereumKeystoreV3?
            if keystoreManager?.addresses?.count == 0{
                ks = try! EthereumKeystoreV3(password: registrationKey!)
                let keydata = try! JSONEncoder().encode(ks!.keystoreParams)
                FileManager.default.createFile(atPath: userDir + "/keystore"+"/key.json", contents: keydata, attributes: nil)
            }else{
                ks = keystoreManager?.walletForAddress((keystoreManager?.addresses![0])!) as! EthereumKeystoreV3
            }
        }
        else if type == "Operator"{
            //TO DO: Name & Telephone & Type
            let name = secondField.text
            let telephone = thirdField.text
            let type = operatorType
            
            let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")
            let ks : EthereumKeystoreV3?
            if keystoreManager?.addresses?.count == 0{
                ks = try! EthereumKeystoreV3.init()
                let keydata = try! JSONEncoder().encode(ks!.keystoreParams)
                FileManager.default.createFile(atPath: userDir + "/keystore"+"/key.json", contents: keydata, attributes: nil)
            }else{
                ks = keystoreManager?.walletForAddress((keystoreManager?.addresses![0])!) as! EthereumKeystoreV3
            }
            
            guard let sender = ks?.addresses?.first else {return}
            
            print(sender)
            
        }
        else{
            //TO DO: Address & Name
            var coordinatesIsAddress : Bool
            if address != nil{
                coordinatesIsAddress = true
            }
            else{
                coordinatesIsAddress = false
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if address != nil{
            addressLabel.text = "Address: \(address!)"
        }
        else if longitude != nil{
            addressLabel.text = "Google Coordinates:        longitude: \(longitude!),        latitude: \(latitude!)"
        }
    }
    
    func updateUI(type : String){
        if type == "Charity"{
            firstLabel.text = "Registration Number:"
            charityLabels.forEach { (label) in
                label.isHidden = true
            }
            charityField.forEach { (textfield) in
                textfield.isHidden = true
            }
            addressLabel.isHidden = true
            pickerView.isHidden = true
            mapButton.isHidden = true
        }
        else if type == "Owner"{
            charityLabels.forEach { (label) in
                label.isHidden = true
            }
            charityField.forEach { (textfield) in
                textfield.isHidden = true
            }
            pickerView.isHidden = true
            firstField.isHidden = true
            
        }
        else if type == "Operator"{
            mapButton.isHidden = true
            addressLabel.isHidden = true
            firstLabel.isHidden = true
            firstField.isHidden = true
        }
         navigationItem.title = type
    }
    @IBAction func mapButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToMap", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMap"{
            address = nil
            longitude = nil
            latitude = nil
        }
    }
}

extension RegisterController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operatorTypeArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operatorTypeArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        operatorType = operatorTypeArray[row]
    }
    
}
