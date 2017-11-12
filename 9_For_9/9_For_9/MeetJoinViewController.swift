//
//  MeetJoinViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/11/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class MeetJoinViewController: UIViewController {
    
    var meet: Meet?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
        locationLabel.text = meet?.location
        dateLabel.text = meet?.timestamp.description
        if let imageName = meet?.imageName {
            meetImageView.image = UIImage(named: imageName)
            // Do any additional setup after loading the view.
        } else if let imageURL = meet?.imageURL{
            let session = URLSession(configuration: .default)
            if let url = URL(string: imageURL){
                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let data = data{
                        DispatchQueue.main.async {
                            self.stacheImageView.image = UIImage(data: data)
                        }
                        
                        
                    }
                })
                task.resume()
            }
        }*/
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 1
        var nav = self.navigationController?.navigationBar
        // 2
        //nav?.barStyle = UIBarStyle.Black
        //nav?.tintColor = UIColor.yellowColor()
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        imageView.contentMode = .scaleAspectFit
        // 4
        let image = UIImage(named: "Nav_Logo")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
