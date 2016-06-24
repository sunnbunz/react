//
//  ViewController.swift
//  React
//
//  Created by Moeed Mohammad on 6/16/16.
//  Copyright © 2016 Moeed Mohammad. All rights reserved.
//

import UIKit
import PBJVision

class ViewController: UIViewController, UIScrollViewDelegate, PBJVisionDelegate {
    
    @IBOutlet weak var previewView: UIView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 375, height: 500)
        scrollView.delegate = self
        
        let previewLayer = PBJVision.sharedInstance().previewLayer
        previewLayer.frame = previewView.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        previewView.layer.addSublayer(previewLayer)
        
        let vision = PBJVision.sharedInstance()
        vision.delegate = self;
        vision.cameraMode = .Photo
        vision.cameraOrientation = .Portrait
        vision.focusMode = .ContinuousAutoFocus
        vision.outputFormat = .Square
        vision.cameraDevice = .Front
        
        
        vision.startPreview()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        let vision = PBJVision.sharedInstance()
        vision.capturePhoto()
    
    }
    
//    func visionDidCapturePhoto(vision: PBJVision) {
//        vision.startPreview()
//    }
    
    
//    func vision(vision: PBJVision, capturedPhoto photoDict: [NSObject : AnyObject]?, error: NSError?) {
//        let imageData = photoDict![PBJVisionPhotoJPEGKey] as! NSData
//        
//        capturedImageView.image = UIImage(data: imageData)
//    }

}

