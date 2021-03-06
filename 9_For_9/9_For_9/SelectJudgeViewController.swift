//
//  SelectJudgeViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/14/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class SelectJudgeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true;
        self.navigationItem.title = "Judge Position"

        // Do any additional setup after loading the view.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func leaveSession(_ sender: UIBarButtonItem) {
        alert(message: "Do you want to leave", title: "Leave Meet")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 1
        //var nav = self.navigationController?.navigationBar
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
    //these functions will be used later to give the judge the correct position
  
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //gives the judge the correct position based on the button they hit
        if let identifier = segue.identifier{
            if identifier == "leftJudge" || identifier == "headJudge" || identifier == "rightJudge"{
               if let jvc = segue.destination as? JudgeViewController{
                if identifier == "leftJudge"{
                    jvc.judge = Judge(position: Judge.Position.Left)
                }else if identifier == "headJudge"{
                    jvc.judge = Judge(position: Judge.Position.Head)
                }else{
                    jvc.judge = Judge(position: Judge.Position.Right)
                    }
                }
            }
    

        }
    }
}
