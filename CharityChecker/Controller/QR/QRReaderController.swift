//
//  QRReaderController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-19.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMaps
import web3swift
import BigInt

class QRReaderController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

      let jsonString = "[{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"donate\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"}],\"name\":\"createCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"createDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"ownerUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"withdraw\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"charityMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"charityUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"time\",\"type\":\"string\"}],\"name\":\"changeTime\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"ownerMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"boxMap\",\"outputs\":[{\"name\":\"charity\",\"type\":\"address\"},{\"name\":\"operator\",\"type\":\"address\"},{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"balance\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"createOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"changeLocation\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"deleteDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"operatorAddress\",\"type\":\"address\"}],\"name\":\"deleteOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"operatorMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"charityAddress\",\"type\":\"address\"}],\"name\":\"deleteCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"ownerAddress\",\"type\":\"address\"}],\"name\":\"deleteOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"}],\"name\":\"createOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"operatorUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"}]"
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    var type : String?
    var add : Bool?
    var dropBoxLocation : CLLocationCoordinate2D?
    var qrCode : String?
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        messageLabel.adjustsFontSizeToFitWidth = true
        
        captureSession = AVCaptureSession()
        
        // Get the back-facing camera for capturing videos
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("WHAT")
            return
        }
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession!.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession!.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
  
            // Start video capture.
            captureSession!.startRunning()
            view.bringSubview(toFront: topBar)
            view.bringSubview(toFront: messageLabel)
            
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView{
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
       
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
                qrCode = metadataObj.stringValue
                print(qrCode)
                captureSession?.stopRunning()
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
                print("here")
                let contractAddress =  EthereumAddress("0x87D7aFBBFe2653a8b9C491C64dA92Ce2527F8346")
                
                let platform = web3Rinkeby.contract(jsonString, at: contractAddress, abiVersion: 2)
                
                if type! == "Public"{
                    
                    let alert = UIAlertController(title: "Check Map", message: "Do you want to find the dropbox on a map and then donate?", preferredStyle: .alert)
                    let confirm = UIAlertAction(title: "Yes", style: .default) { (action) in
                        self.performSegue(withIdentifier: "goToCheckLocation", sender: self)
                    }
                    let incorrect = UIAlertAction(title: "No", style: .default) { (action) in
                        
                    }
                    alert.addAction(confirm)
                    alert.addAction(incorrect)
                    present(alert, animated: true, completion: nil)
                }
                else if (type! == "Charity" || type! == "Operator") && add == false{
                    captureSession?.stopRunning()
                    //SET PROPER PARAMS
                   let parameter = [metadataObj.stringValue] as [AnyObject]
                    do{
                        let withdraw = try platform!.method("withdraw", parameters: parameter, options: options)!.send(password: "Whocares").dematerialize()
                        print(withdraw)
                     
                    }
                    catch{
                        print(error)
                    }
                }
                else if type! == "Operator" && add == true{
                      print(add)
                    print("Arrived")
                    let parameter = [qrCode!] as [AnyObject]
                    do{
                        let operate = try platform!.method("setOperator", parameters: parameter, options: options)!.send(password: "Whocares").dematerialize()
                    
                        print(operate)
                        let alert = UIAlertController(title: "Box Added!", message: "The box has been linked to the operator", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Okay!", style: .default) { (action) in
                            self.dismiss(animated: true, completion: nil)
                        }
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                    catch{
                        print(error)
                    }
                   
                }
                else if type! == "Owner"{
                    captureSession?.stopRunning()
                    let parameter = [metadataObj.stringValue!] as [AnyObject]
                    do{
                        let owner = try platform!.method("setOwner", parameters: parameter, options: options)!.send(password: "Whocares").dematerialize()
                        print(owner)
                        
                        let alert = UIAlertController(title: "Box Added!", message: "The box has been linked to the owner", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Okay!", style: .default) { (action) in
                            self.dismiss(animated: true, completion: nil)
                        }
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }
                    catch{
                        print(error)
                    }
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCheckLocation"{
            let destionationVC = segue.destination as! PublicLocationController
            destionationVC.dropboxLocation = dropBoxLocation
            destionationVC.qrCode = qrCode
        }
    }
    
    @IBAction func restartButtonPressed(_ sender: CheckButton) {
        self.captureSession?.startRunning()
    }
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true) {
            self.captureSession?.stopRunning()
        }
    }
}
