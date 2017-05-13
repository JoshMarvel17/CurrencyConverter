//
//  UITableView.swift
//  currencyConverter
//
//  Created by Joshua Marvel on 5/12/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//

import UIKit

/*
 FAVORITE VIEW CONTROLLER
 */

class UITableView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make swip gestures
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer)
    {
        self.performSegue(withIdentifier: "unwindToPicker", sender: self)
        
        
    }


}

