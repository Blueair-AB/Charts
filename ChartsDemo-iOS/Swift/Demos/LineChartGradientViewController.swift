import UIKit
import Charts

class LineChartGradientViewController: UIViewController {

    @IBOutlet var chartView: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set x values
        let count = 10
        var xVals: [String]! = []
        for i in 0..<count
        {
            xVals.append("\(i)")
        }
        //set y values
        let range = 5.0
        var yVals: [ChartDataEntry] = []
        for i in 0..<count
        {
            let val = drand48() * range + 35
            yVals.append(ChartDataEntry(x: Double(i), y: val))
        }
        let set1 = LineChartDataSet(values: yVals, label: "DataSet 1")
        
        //Set gradient
        set1.mode = .cubicBezier
        set1.isDrawLineWithGradientEnabled = true
        chartView.drawGridBackgroundEnabled = false
        set1.lineWidth = 2.0
        set1.circleRadius = 3.0
        set1.circleHoleRadius = 1.5
        
        let colors = [UIColor.cyan, UIColor.green, UIColor.yellow, UIColor.red]
        let positions:[CGFloat] = [35.0, 36.6, 38.0, 40.0]
        
        set1.setColors(colors, alpha: 1.0)
        set1.gradientPositions = positions
        
        //axis config
        let xAxis = chartView.xAxis
        let leftAxis = chartView.leftAxis
        let rightAxis = chartView.rightAxis
        
        xAxis.drawGridLinesEnabled = false
        
        leftAxis.drawGridLinesEnabled = false
        rightAxis.drawGridLinesEnabled = false
        
        leftAxis.axisMinimum = 34.0;
        leftAxis.axisMaximum = 41.0;
        leftAxis.drawLabelsEnabled = false
        rightAxis.drawLabelsEnabled = false
        
        //limit lines
        for i in 0..<positions.count {
            let line = ChartLimitLine(limit: Double(positions[i]))
            line.label = "\(positions[i])"
            line.lineWidth = 1.0
            line.lineColor = colors[i]
            line.valueTextColor = colors[i]
            chartView.leftAxis.addLimitLine(line)
        }
        
        // set Data
        var dataSets: [LineChartDataSet] = []
        dataSets.append(set1)
        let chartData = LineChartData(dataSets: dataSets)
        chartView.data = chartData
        
    }
    
}
