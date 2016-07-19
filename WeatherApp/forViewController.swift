//
//  forViewController.swift
//  WeatherApp
//
//  Created by liangwx on 16/6/29.
//  Copyright © 2016年 David Dume. All rights reserved.
//

import UIKit

class forViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UISearchBarDelegate{

    @IBOutlet weak var fortv: UITableView!
    
    @IBAction func update(sender: AnyObject) {
            self.fortv.addSubview(self.refreshControl)
            refreshData()
    }
    
    var refreshControl = UIRefreshControl()
    
   // var weathers : [forweather] = [forweather(foricon: <#T##String#>, fordate: <#T##String#>, fortemp: <#T##Double#>, fortime: <#T##String#>)]
    
    var weathers: Weather!
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weathers = Weather(name: "Baoding")
        searchBar.delegate = self
        
        weathers.forcastJSON {
            ()-> () in
            self.selfforcastweather = self.weathers.forweathers
        }
        refreshControl.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "天气刷新")
        fortv.addSubview(refreshControl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print (self.weathers.forweathers.count)
        
        return  20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIndentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier, forIndexPath:indexPath)  as! forTableViewCell
        weathers.forcastJSON {
            ()-> () in
        let forcastweather = self.selfforcastweather[indexPath.row]
            
        cell.fordate.text = forcastweather.fordate  
        //print(forcastweather.fordate)
        cell.fortime.text = forcastweather.fortime
        cell.foricon.image = UIImage(named: "\(forcastweather.foricon)")
        cell.fortemp.text = "\(forcastweather.fortemp)"
            

        }
        return cell
    }
    
    var selffordate : String!
    var selffortemp : Double!
    var selfforday : String!
    var selfforicon : String!
    var selfforcastweather : [forweather] = []
    
    // 刷新数据
    func refreshData() {
        //weathers = Weather(name: "baoding")
        weathers.forcastJSON{
            ()->() in
            self.selffordate = self.weathers.fordate
            self.selfforday = self.weathers.fortime
            self.selffortemp = self.weathers.fortemp
            self.selfforicon = self.weathers.foricon
            self.selfforcastweather = self.weathers.forweathers
            print(self.selffordate,self.selfforday,self.selffortemp)
            }
        self.fortv.reloadData()
        refreshControl.endRefreshing()
        
    }
    
    @IBOutlet weak var forcity: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    //搜索数据
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let searchedCity = searchBar.text!.stringByReplacingOccurrencesOfString(" ", withString: "")
        weathers = Weather(name: searchedCity)
        
        forcity.text = searchedCity
        refreshData()
        view.endEditing(true)
    }

    
    
    
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
