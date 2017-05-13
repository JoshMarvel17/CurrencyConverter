//
//  UIPickerView.swift
//  currencyConverter
//
//  Created by Joshua Marvel on 5/12/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//


import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)

        
        //colorPickerView.dataSource = self
        //colorPickerView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(_ sender:UISwipeGestureRecognizer)
    {
        //getInput()
        //discountData.Calculate()
        //displayTotals()
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    //Enable unwinding other views
    @IBAction func unwindToPicker(segue:UIStoryboardSegue){}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int )-> Int {
        //code
        //return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //code
        //return pickerData[row]

    }

}
