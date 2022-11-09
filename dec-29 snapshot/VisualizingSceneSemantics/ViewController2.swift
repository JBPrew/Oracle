//
//  ViewController2.swift
//  VisualizingSceneSemantics
//
//  Created by Sam Shridhar on 8/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//
import SwiftUI

class ViewController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    // time slider
    @IBOutlet weak var textLabel:UILabel?
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var switch_: UISwitch!
    @IBOutlet weak var menu: UIButton!
    @IBOutlet weak var hapticSwitch: UISwitch!
    @IBOutlet weak var langpicker: UIPickerView!
    var pickerData = ["English", "Spanish", "French", "Mandarin", "Hindi", "Arabic"]

    
    
    
    

    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        langpicker.delegate = self
        langpicker.dataSource = self
        label.text =  "Time Interval (" + String(globalInterval) + " sec)"
        langpicker.selectRow(pickerData.firstIndex(of: globalLang.capitalized)!, inComponent: 0, animated: false)

        textLabel?.text = "Click the button"
        switch_.setOn(globalSystem == " centimeters", animated: false)
        hapticSwitch.setOn(hapticBool == true, animated: false)
        

    }
        
    func numberOfComponents(in langpicker: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ langpicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ langpicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ langpicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        globalLang = pickerData[row].lowercased()
        print(globalLang)
    }

//    @IBAction func menuValueChanged(_ sender: Any) {
//        globalLang = menu.menu?.selectedElements.description.lowercased() ?? "english"
//    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        globalInterval = Int(slider.value)
        label.text = "Time Interval  (" + String(globalInterval) + " sec)"
    }
    
    
    //    @IBAction func submitLanguage(_ send: Any) {
//        globalLanguage = String(textfield.text!)
//        print(globalLanguage)
//
//
//    }
    
    @IBAction func systemValueChanged(_ sender: Any) {
        if switch_.isOn != true {
            globalSystem = " inches"
        }
        else {
            globalSystem = " centimeters"
        }
    }
    
    @IBAction func hapticValueChanged(_ sender: Any) {
        hapticBool = hapticSwitch.isOn
    }
    
    // still need to add unit conversions, only unit names have changed

    
    
    
    
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


