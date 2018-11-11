//
//  CurrentStatistics.swift
//  Greencycle
//
//  Created by Julia Iiuaavi on 11/10/18.
//  Copyright © 2018 Julia Iiuaavi. All rights reserved.
//

import UIKit
import Foundation
import Charts

class CurrentStatistics: UIViewController{
    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var countryAverage: UIStepper!
    @IBOutlet weak var userCurrent: UIStepper!
    @IBOutlet weak var worldAverage: UIStepper!
    
    var countryDataEntry = BarChartDataEntry(x: 4, yValues: [5])
    var userDataEntry = BarChartDataEntry(x: 4, yValues: [5])
    var worldDataEntry = BarChartDataEntry(x: 4, yValues: [5])
    
    
    var numberOfDownloadsDataEntries = [BarChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChart.chartDescription?.text = "kek"
        
        countryDataEntry.yValues = countryAverage.value
        
        updateChartData()
    }
    
    @IBAction func changeUS(sender: UIStepper){
        
    }
    
    @IBAction func changeYou(sender: UIStepper){
        
    }
    
    @IBAction func changeWorld(sender: UIStepper){
        
    }
    
    //create colors for: coutry average, your current, your previous
    
    func updateChartData(){
        let chartDataSet = BarChartDataSet(values: numberOfDownloadsDataEntries, label: nil)
        let chartData = BarChartData(dataSet: chartDataSet)
        //let colors = [UIColor(named:"iosColor")]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}
