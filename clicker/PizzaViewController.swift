//
//  PizzaViewController.swift
//  clicker
//
//  Created by James Caldwell on 4/19/21.
//  Copyright © 2021 James Caldwell. All rights reserved.
//

import UIKit

class PizzaViewController: UIViewController {
    //testing label
    @IBOutlet weak var testLabel: UILabel!
    
    //daylight timer that will take money from how many employees you have
    var employees = Gemployees
    var daylightTimer = GdaylightTimer
    var DayLightTimer: Timer?
    
    //variabales for money you earn
    var money = Gmoney
    var customers = 0
    var moneyTimer = GmoneyTimer
    var MoneyTimer: Timer?
    var MoneyTimerChange = 30
   
   // timer for the pizza button & Pizza button
    var PizzaTimer = 4
    var pizza = 0
    var timer: Timer?
    @IBOutlet weak var pizzaClicker: UIButton!
   
    //text labels
    @IBOutlet weak var customersText: UILabel!
    @IBOutlet weak var employeeText: UILabel!
    @IBOutlet weak var moneyText: UILabel!
    @IBOutlet weak var pizzaText: UILabel!
    @IBOutlet weak var pizzaClickedTimer: UILabel!
   
   //loadin objects after this point
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
        DayLightTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(DayTime), userInfo: nil, repeats:true)
        
        //timer that counts from 30 the second your in the view
        MoneyTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(moneyTime), userInfo: nil, repeats:true)
    }
    
     @objc func DayTime(){
                   
                       daylightTimer -= 1
        testLabel.text = "\(daylightTimer)"

                       if daylightTimer == 0 {
                        daylightTimer = 300
                           }
        
    }
    
     @objc func moneyTime(){
                       moneyTimer -= 1
                    // when timer hits 0 add $2.50 to money but only if you have pizza made
        if pizza != 0 {
                       if moneyTimer == 1   {
                        moneyTimer = MoneyTimerChange
                        money += 2.50
                        pizza -= 1
                        moneyText.text = "\(money)"
                        pizzaText.text = "\(pizza)"
                          }
        }
        if moneyTimer == 1   {
            moneyTimer = MoneyTimerChange
            moneyText.text = "\(money)"
            pizzaText.text = "\(pizza)"
        }
    }
    //pizza button clicked and after 3 seconds adds 1 pizza to pizzaText
    @IBAction func pizzaClicked(_ sender: Any) {
       PizzaTimer = 4
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerGo), userInfo: nil, repeats:true)
        pizzaClicker.isEnabled = false
    }
    //resets timer
    @objc func timerGo(){
        PizzaTimer -= 1
       pizzaClickedTimer.text = "\(PizzaTimer)"
        if PizzaTimer == 0 {
        timer?.invalidate()
        timer = nil}
        pizzaText.text = "Pizzas: \(pizza)"
        if PizzaTimer == 1 {
              pizza += 1
        }
        if PizzaTimer == 0{
            pizzaClicker.isEnabled = true
        }
    
    }
    
}
