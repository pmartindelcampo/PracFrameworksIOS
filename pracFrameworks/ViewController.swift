//
//  ViewController.swift
//  pracFrameworks
//
//  Created by XCode on 4/12/18.
//  Copyright © 2018 XCode. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation
import AVKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet var localizate: UIButton!
    @IBOutlet var latitude: UILabel!
    @IBOutlet var longitude: UILabel!
    let locationManager: CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func localizar(_ sender: Any) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = locations.last!.coordinate.latitude
        let lon = locations.last!.coordinate.longitude
        latitude.text = String(lat)
        longitude.text = String(lon)
        let location = CLLocation(latitude: lat, longitude: lon)
        let fromLocation = CLLocation(latitude: 40.388987, longitude: -3.629127)
        if (location.distance(from: fromLocation) < 100) {
            playVideo(uri: "http://aicu.eui.upm.es/~paco/muelle/KY/Summertime.mov")
        }
    }
    
    func playVideo(uri: String) {
        var playerViewController: AVPlayerViewController!
        playerViewController = AVPlayerViewController()
        present(playerViewController, animated: true) {
            let videoURL = URL(string: uri)
            playerViewController.player = AVPlayer(url: videoURL!)
            playerViewController.player?.play()
        }
    }
    
    
}

