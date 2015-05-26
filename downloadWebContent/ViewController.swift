//
//  ViewController.swift
//  downloadWebContent
//
//  Created by Scott Yoshimura on 3/3/15.
//  Copyright (c) 2015 west coast dev. All rights reserved.
//



//this app download html content and display it to the user.

import UIKit

class ViewController: UIViewController {

    //later on we need to load the content into a webview, so we need to create an outlet for it.
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //let's define the URL that will be used. the contents will be downloaded.
        // the variable has a type of NSURL from a string, in swift, a URL is different from a string, so we have to convert a URL to a string.
        let url1 = NSURL(string: "http://www.stackoverflow.com")
    
        
        //let's create a task. the task will go to stackoverflow and get the contents.
        //first, we define the task, and then specify the method that is associated with that task.
        //NSURLSession type with the sharedSession method opens an http session inside of the app.
        //.dataTaskWithURL gets the data from the URL
        let task = NSURLSession.sharedSession().dataTaskWithURL(url1!){
            //the task is of type NSURLSession, we are using the sharedSessionMethod, and passing in url1
            //there are three variables that are returned by a task with type NSURLSession.
            (data, response, error) in //"in" is used to indicate that there is a chunk of code coming up.
            
                if error == nil {
                
                    println(data)
                    
                
                //if we simply println(data) it will pring the data to log, but not in any format we can understand, so we have to turn the data into UTF8. we will convvert into a string from data.
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                    println(urlContent)
                
                    
               
                
                    
            //the below code will allow the app to process the code in it asynchronously, so that task.resume can start in parallel with self.webview
            dispatch_async(dispatch_get_main_queue()){
                //to refer to any variable that it outside the closure, we need to identify it within the closure using self. webView is the closure.
                
                self.webView.loadHTMLString(urlContent! as? String, baseURL: nil)
                
                //self.webView.loadHTMLString(urlContent, baseURL: nil)
                //webView.loadHTMLString will load the content through the webView Outlet.
                
                    }
                    
            //

            
            }
        }
        
        //task.resume() actually kicks off the task. note how above we just defined it and did not kick it off
        
        task.resume()
  
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

