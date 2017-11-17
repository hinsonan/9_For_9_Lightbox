//
//  SelectJudgeViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/14/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class SelectJudgeViewController: UIViewController {

    @IBOutlet weak var leftJudgeImage: UIImageView!
    @IBOutlet weak var headJudge: UIImageView!
    @IBOutlet weak var rightJudge: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.hidesBackButton = true;
        self.navigationItem.title = "Judge Position"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
