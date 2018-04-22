//
//  GetDonationBoxQRController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-21.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import web3swift
import BigInt
import QRCode

class GetDonationBoxQRController: UIViewController {

    @IBOutlet weak var qrCodeView: UIImageView!
    @IBOutlet weak var qrView: UIView!
    
    
    let jsonString = "[{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"donate\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"}],\"name\":\"createCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"createDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"ownerUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"withdraw\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"charityMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"charityUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"time\",\"type\":\"string\"}],\"name\":\"changeTime\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"ownerMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"boxMap\",\"outputs\":[{\"name\":\"charity\",\"type\":\"address\"},{\"name\":\"operator\",\"type\":\"address\"},{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"balance\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"createOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"changeLocation\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"deleteDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"operatorAddress\",\"type\":\"address\"}],\"name\":\"deleteOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"operatorMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"charityAddress\",\"type\":\"address\"}],\"name\":\"deleteCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"ownerAddress\",\"type\":\"address\"}],\"name\":\"deleteOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"}],\"name\":\"createOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"operatorUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"}]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let dropBoxKS = try! EthereumKeystoreV3.init()
        let keydata = try! JSONEncoder().encode(dropBoxKS?.keystoreParams)
        FileManager.default.createFile(atPath: userDir + "/keystore"+"/dropbox.json", contents: keydata, attributes: nil)
        
        let dropbox = (keystoreManager?.addresses![1])!
        
         let contractAddress = EthereumAddress("0x87D7aFBBFe2653a8b9C491C64dA92Ce2527F8346")
        
        let parameter = ["","","",dropbox] as [AnyObject]
        
        let platform = web3Rinkeby.contract(jsonString, at: contractAddress, abiVersion: 2)
        
        do{
            let data = try platform?.method("createDropBox", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
            print(data)
        }
        catch{
            print(error)
        }
        
        var qrCode = QRCode.init(dropbox.address)
        qrCode!.size = CGSize(width: qrCodeView.bounds.size.width, height:  qrCodeView.bounds.size.height)
        self.qrCodeView.image = qrCode?.image
        self.qrCodeView.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveImage(_ sender: Any) {
       UIImageWriteToSavedPhotosAlbum(qrCodeView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
}
