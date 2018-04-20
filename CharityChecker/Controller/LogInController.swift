//
//  LogInController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-19.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import web3swift

class LogInController: UIViewController{
    
    
    @IBOutlet weak var imageView: UIImageView!
    var type : String!
    let picker = UIImagePickerController()
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func imageIsPressed(_ sender: Any) {
        show(picker, sender: self)
    }
    
    @IBAction func handleSignUp(_ sender: Any) {
        if type == "Charity" && buttonOutlet.isHidden == false{
            var detector:CIDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])!
            
            var ciImage:CIImage = CIImage(image:imageView.image!)!
            var qrCodeLink : String = ""
            
            let features = detector.features(in: ciImage)
            
            if features.count != 0{
                for feature in features as! [CIQRCodeFeature] {
                    qrCodeLink += feature.messageString!
                }
            }
            
            if qrCodeLink=="" {
                navigationItem.title = "Wrong QR Code"
            }else{
              
            }
            buttonOutlet.isHidden = true
            
            if qrCodeLink.hasPrefix("ethereum%3A") == true{
                for _ in "ethereum%3A"{
                    qrCodeLink.removeFirst()
                }
            }
              print(qrCodeLink)
            let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")
            let ks : EthereumKeystoreV3?
            
            }
        
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "goToRegister", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRegister"{
            let destinationVC = segue.destination as? RegisterController
            destinationVC?.type = type
        }
    }
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI(){
        navigationItem.title = type
    }

}

extension LogInController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage{
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
