//
//  ScanQRController.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-22.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import UIKit
import web3swift
import BigInt
import AVFoundation

class ScanQRController: UIViewController {

      let jsonString = "[{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"donate\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"}],\"name\":\"createCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"createDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"ownerUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"withdraw\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"charityMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"charityNumber\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"charityUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"time\",\"type\":\"string\"}],\"name\":\"changeTime\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"ownerMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"boxMap\",\"outputs\":[{\"name\":\"charity\",\"type\":\"address\"},{\"name\":\"operator\",\"type\":\"address\"},{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"},{\"name\":\"time\",\"type\":\"string\"},{\"name\":\"balance\",\"type\":\"uint256\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"createOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"},{\"name\":\"latitude\",\"type\":\"string\"},{\"name\":\"longitude\",\"type\":\"string\"}],\"name\":\"changeLocation\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"deleteDropBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"operatorAddress\",\"type\":\"address\"}],\"name\":\"deleteOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"operatorMap\",\"outputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"},{\"name\":\"isSet\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"charityAddress\",\"type\":\"address\"}],\"name\":\"deleteCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"ownerAddress\",\"type\":\"address\"}],\"name\":\"deleteOwner\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"phoneNumber\",\"type\":\"uint256\"},{\"name\":\"operatorType\",\"type\":\"string\"}],\"name\":\"createOperator\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"operatorUnregisterBox\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"dropBoxAddress\",\"type\":\"address\"}],\"name\":\"setCharity\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"}]"
    
    @IBOutlet weak var dropboxbutton: UIButton!
    @IBOutlet weak var dismissButton: CheckButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    let picker = UIImagePickerController()
    var camera : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        view.bringSubview(toFront: imageView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func changeImagePressed(_ sender: Any) {
        show(picker, sender: self)
        
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        
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
            let alert = UIAlertController(title: "Change Picture", message: "Please change the picture to a QRPicture", preferredStyle: .alert)
            let action = UIAlertAction(title: "Understood", style: .default) { (action) in
                
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let userDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        var keystoreManager = KeystoreManager.managerForPath(userDir + "/keystore")
        let ks = keystoreManager?.walletForAddress((keystoreManager?.addresses![0])!) as! EthereumKeystoreV3
        
         if let keyAddress = ks.addresses?.first{
            let web3Rinkeby = Web3.InfuraRinkebyWeb3()
            web3Rinkeby.addKeystoreManager(keystoreManager)
            var options = Web3Options.defaultOptions()
            options.gasLimit = BigUInt(10000000)
            options.from = keyAddress
            options.value = 0
            
            let contractAddress = EthereumAddress("0x87D7aFBBFe2653a8b9C491C64dA92Ce2527F8346")
            
            let parameter = [qrCodeLink] as [AnyObject]
            
            let platform = web3Rinkeby.contract(jsonString, at: contractAddress, abiVersion: 2)
            do{
                 let charity = try platform?.method("setCharity", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
                print(charity)
                let alert = UIAlertController(title: "Box Added!", message: "The box has been linked to the charity", preferredStyle: .alert)
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
    
    @IBAction func cameraPressed(_ sender: Any) {
        if camera == true{
            camera = false
            cameraButton.titleLabel?.text = "Library"
            captureSession?.stopRunning()
            view.bringSubview(toFront: imageView)
            view.bringSubview(toFront: dropboxbutton)
            
        }else{
            camera = true
            cameraButton.titleLabel?.text = "Camera"
            
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
                videoPreviewLayer?.frame = qrCodeFrameView!.layer.bounds
                view.layer.addSublayer(videoPreviewLayer!)
                
                // Start video capture.
                captureSession!.startRunning()
                view.sendSubview(toBack: imageView)
                
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
    }
    
    @IBOutlet weak var cameraButton: CheckButton!
}

extension ScanQRController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

extension ScanQRController : AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
              
                let qrCodeLink = metadataObj.stringValue
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
                
                let parameter = [qrCodeLink] as [AnyObject]
                
                let platform = web3Rinkeby.contract(jsonString, at: contractAddress, abiVersion: 2)
                do{
                    let charity = try platform?.method("setCharity", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
                    print(charity)
                    let alert = UIAlertController(title: "Box Added!", message: "The box has been linked to the charity", preferredStyle: .alert)
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
