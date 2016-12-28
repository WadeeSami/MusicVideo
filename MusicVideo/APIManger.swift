//
//  APIManger.swift
//  MusicVideo
//
//  Created by Wadee Sami on 12/27/16.
//  Copyright © 2016 Wadee AbuZant. All rights reserved.
//

import Foundation

class APIManger {
    
    /*
     This method will  get a url, load data using NSUrlSession
     */
    func loadData (urlString:String, completion : (result : String) -> Void) {
        //create a session object
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration();
        //let defaultSession = NSURLSession.sharedSession()
        let defaultSession = NSURLSession(configuration: config)
        let url:NSURL = NSURL(string: urlString)!
        
        //create a task
        let task = defaultSession.dataTaskWithURL(url) {
            (data,response,error) -> Void in
            dispatch_async(dispatch_get_main_queue()) {
                if error != nil {
                    completion(result :(error?.localizedDescription)!)
                    
                }else{
                    completion(result:"Successfull")
                    print (data)
                }
            }
        }
        task.resume();
    }
}