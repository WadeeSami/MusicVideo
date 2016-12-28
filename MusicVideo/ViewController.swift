//
//  ViewController.swift
//  MusicVideo
//
//  Created by Wadee Sami on 12/27/16.
//  Copyright © 2016 Wadee AbuZant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let apiManager = APIManger()
        apiManager.loadData("https://itunes.apple.com/us/rss/topmovies/limit=10/genre=4401/json", completion: didLaodData)
    }
    
    func didLaodData(result:String){
        let Allert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        Allert.addAction(action)
        self.presentViewController(Allert, animated: true, completion: nil)
        
    }


}

