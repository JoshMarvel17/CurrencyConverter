//
//  UIPickerView.swift
//  currencyConverter
//
//  Created by Joshua Marvel on 5/12/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//


import UIKit


class UICurrencyViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var homePickerData = [String]()
    var foreignPickerData = [String]()
    

    @IBOutlet weak var homePickerView: UIPickerView!
    
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
        homePickerData = sharedData.pickerArray
        foreignPickerData = sharedData.pickerArray

        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)

        
        homePickerView.dataSource = self
        homePickerView.delegate = self
        
        //foreignPickerView.dataSource = self
        //foreignPickerView.delegate = self
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int {
        return homePickerData.count
        //return foreignPickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return homePickerData[row]
        //return foreignPickerData[row]
    }
    
    // should retrun the text of the selected element in pickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        sharedData.home = homePickerData[row]
        sharedData.foreign = foreignPickerData[row]
    }
    
    
    // updates the data inside the pickerView
    @IBAction func updatePickerButton(_ sender: UIButton) {
        homePickerData = sharedData.pickerArray
        homePickerView.reloadAllComponents()
        
 
    }
    
    func getData()
    {
        let myYQL = YQL()
        
        let queryString = "select * from yahoo.finance.xchange where pair in" +
            "(\"USDEUR\",\"USDINR\", \"USDGBP\", \"USDAUD\", \"USDCAD\", " +
            "\"EURUSD\", \"EURGBP\", \"EURINR\", \"EURAUD\", \"EURCAD\", " +
            "\"GBPUSD\", \"GBPEUR\", \"GBPINR\", \"GBPAUD\", \"GBPCAD\", " +
            "\"INRUSD\", \"INRGBP\", \"INREUR\", \"INRAUD\", \"INRCAD\", " +
            "\"AUDUSD\", \"AUDGBP\", \"AUDINR\", \"AUDEUR\", \"AUDCAD\", " +
        "\"CADUSD\", \"CADGBP\", \"CADINR\", \"CADAUD\", \"CADEUR\" )"
        var rate:Float = 0
        
        
        myYQL.query(queryString) { jsonDict in
            
            
            
            let queryDict = jsonDict["query"] as! [String: Any]
            let resultsDict = queryDict["results"] as! [String: Any]
            let rateArray = resultsDict["rate"] as! [Any]
            let rateDict = rateArray[0] as! [String: Any]
            
          
            rate = Float(rateDict["Rate"] as! String)!
            
            self.sharedData.getSetRate(rate)
            self.sharedData.rate = rate
            
            self.sharedData.converted = self.sharedData.amount * self.sharedData.rate
        }

    
        
        
        
    }
    
    let sharedData: currencyData = currencyData.shared
    

}
