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
import AVFoundation

class ChangeParameterController: UIViewController {

    @IBOutlet weak var removeButton: CheckButton!
    @IBOutlet weak var secondButton: CheckButton!
    @IBOutlet weak var thirdButton: CheckButton!
    @IBOutlet weak var startRecordingButton: CheckButton!
    @IBOutlet weak var qrView: UIView!
    
    var type : String?
    var mode : String?
    var current : String?
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goUpdate"{
            let destinationVC = segue.destination as! QRReaderController
            destinationVC.set = true
            destinationVC.updateField = current
        }
    }
    @IBAction func startRecording(_ sender: Any) {
        startRecordingButton.setTitle("Restart", for: .normal)
        
        startVideo()
    }
    
    
    
    func startVideo(){
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
            videoPreviewLayer?.frame = qrView.layer.bounds
            videoPreviewLayer?.frame.origin.y = qrView.frame.origin.y
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture.
            captureSession!.startRunning()
            
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
    
    func changeParameters(qrCode: String, mode: String){
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
        
        let parameter = [qrCode] as [AnyObject]
        
        let platform = web3Rinkeby.contract(jsonString, at: contractAddress, abiVersion: 2)
        
        if mode == "Update"{
            let alert = UIAlertController(title: "Update Dropbox", message: "Change Operator or Owner", preferredStyle: .alert)
            let opt = UIAlertAction(title: "Operator", style: .default) { (action) in
                //Unregister Operator
                self.current = "Operator"
                self.performSegue(withIdentifier: "goUpdate", sender: self)
            }
            let own = UIAlertAction(title: "Owner", style: .default) { (action) in
                //Unregister Owner
                self.current = "Owner"
                self.performSegue(withIdentifier: "goUpdate", sender: self)
            }
            alert.addAction(own)
            alert.addAction(opt)
            present(alert, animated: true, completion: nil)
        }
        if mode == "Location"{
            //TO DO: Fix Location (GET LOCATION)
            let latitude = 0
            let longitude = 0
            
            
            let parameter = [qrCode, latitude, longitude] as [AnyObject]
            do{
                let location = try platform?.method("changeLocation", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
                print(location)
            }
            catch{
                print(error)
            }
        }
        if mode == "Unregister"{
            let completionAlert = UIAlertController(title: "Unregistered", message: "You have been unregistered", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay!", style: .default, handler: nil)
            completionAlert.addAction(action)
            if type == "Owner"{
                let alert = UIAlertController(title: "Confirmation", message: "Do you want to unregister as the owner for this drop box?", preferredStyle: .alert)
                let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
                    do{
                        let result = try platform?.method("ownerUnregisterBox", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
                        print(result)
                    }
                    catch{
                        print(error)
                    }
                }
                let no = UIAlertAction(title: "No", style: .default) { (action) in
                    self.present(completionAlert, animated: true, completion: {
                        self.captureSession?.startRunning()
                    })
                }
            }
            else if type == "Charity"{
                let alert = UIAlertController(title: "Confirmation", message: "Do you want to unregister as the charity for this drop box?", preferredStyle: .alert)
                let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
                    do{
                        let result = try platform?.method("charityUnregisterBox", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
                        print(result)
                    }
                    catch{
                        print(error)
                    }
                }
                let no = UIAlertAction(title: "No", style: .default) { (action) in
                    self.present(completionAlert, animated: true, completion: {
                        self.captureSession?.startRunning()
                    })
                }
            }
            else if type == "Operator"{
                let alert = UIAlertController(title: "Confirmation", message: "Do you want to unregister as the operator for this drop box?", preferredStyle: .alert)
                let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
                    do{
                        let result = try platform?.method("operatorUnregisterBox", parameters: parameter, options: options)?.send(password: "Whocares").dematerialize()
                        print(result)
                    }
                    catch{
                        print(error)
                    }
                }
                let no = UIAlertAction(title: "No", style: .default) { (action) in
                    self.present(completionAlert, animated: true, completion: {
                        self.captureSession?.startRunning()
                    })
                }
                alert.addAction(yes)
                alert.addAction(no)
                present(alert, animated: true, completion:nil)
            }
        }
        if mode == "Remove"{
            
        }
    }
}

extension ChangeParameterController : AVCaptureMetadataOutputObjectsDelegate {
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
                
                captureSession?.stopRunning()
                let dropboxAddress = metadataObj.stringValue!
                changeParameters(qrCode: dropboxAddress, mode: mode!)
            }
        }
        
    }
}
