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
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue()){
                    completion(result :(error?.localizedDescription)!)
                }
            }else{
                //there must be a data, go and try to parse
                do{
                   let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                    print (jsonData)
                    
                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                    dispatch_async(dispatch_get_global_queue(priority, 0)){
                        dispatch_async(dispatch_get_main_queue()){
                            completion(result: "JSON Parsed Successfully")
                        }
                    }
                }catch {
                    dispatch_async(dispatch_get_main_queue()){
                        completion(result: "Failed to parse the JSON")
                    }
                    
                }
            }
                    }
        task.resume();
    }
}