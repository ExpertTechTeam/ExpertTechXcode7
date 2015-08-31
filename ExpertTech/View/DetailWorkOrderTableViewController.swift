//
//  DetailWorkOrderTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/31/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit
import MapKit

class DetailWorkOrderTableViewController: UITableViewController, MKMapViewDelegate {

    @IBOutlet weak var vCustomerNameLabel: UILabel!
    @IBOutlet weak var vCustomerDetailTxtView: UITextView!
    
    @IBOutlet weak var vRequestNameLabel: UILabel!
    @IBOutlet weak var vRequestDetailTxtView: UITextView!
    @IBOutlet weak var vMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    var indexNumber:Int = 0
    var workOrderId:NSDecimalNumber = 0
    //var workOrderList = Constants.WorkOrderList.workOrderList
    //var curWorkOrder:WorkOrder!
    var curWorkOrder:NSDictionary = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vMapView.delegate = self
        GetWorkOrderDetailByWorkUnitController().getFromSelectMenu(workOrderId, uiView: self)
    }
    
    override func viewDidAppear(animated: Bool) {
       // self.centerAndPointOnLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = PinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        return annotationView
    }
    
    func centerAndPointOnLocation(){
        let lat = Double(curWorkOrder["WOO_LATITUDE"] as! String)!
        let long = Double(curWorkOrder["WOO_LONGITUDE"] as! String)!
        let location = CLLocation(latitude: lat, longitude: long)
        print("\(lat), \(long)")
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        vMapView.setRegion(coordinateRegion, animated: false)
        let point:MKPointAnnotation = MKPointAnnotation()
        point.coordinate = location.coordinate
        point.title = String(indexNumber+1)
        point.subtitle = String(workOrderId)
        self.vMapView.addAnnotation(point)
    }
    func updateView(response: NSArray){
        let workOrderDetailList = response
        print("Found the result from DtailWorkOrderTableViewController : \(response.count) item")
        if workOrderDetailList.count > 0 {
            self.curWorkOrder = workOrderDetailList[0] as! NSDictionary
            // Customer Detail
            let custname = self.curWorkOrder["WOO_CUS_NAME"] as! String
            // line 1
            let custaddress = self.curWorkOrder["WOO_CUS_ADDRESS"] as! String
            // line 2
            let custservid = self.curWorkOrder["WOO_CUS_SERV_ID"] as! String
            // line 3
            let custphoneno = self.curWorkOrder["WOO_ORDER_NO"] as! String
            // line 4
            let custexchange = self.curWorkOrder["WOO_EXCHANGE"] as! String
            let custgis = self.curWorkOrder["WOO_GIS"] as! String
            // line 5
            let custtie = self.curWorkOrder["WOO_TIE"] as! String
            let custpri = self.curWorkOrder["WOO_PRI"] as! String
            let custcab = self.curWorkOrder["WOO_CAB"] as! String
            let custsec = self.curWorkOrder["WOO_SEC"] as! String
            let custdp = self.curWorkOrder["WOO_DP"] as! String
            let custpin = self.curWorkOrder["WOO_PIN"] as! String
            let custdw = self.curWorkOrder["WOO_DW"] as! String
            // line 6
            let custadslinfo = self.curWorkOrder["WOO_ADSL_INFO"] as! String
            let custadslsys = self.curWorkOrder["WOO_ADSL_SYSTEM"] as! String
            let custadslnetwork = self.curWorkOrder["WOO_ADSL_NETWORK"] as! String
            let custadslspeed = self.curWorkOrder["WOO_ADSL_SPEED"] as! String
            let custrouterbrand = self.curWorkOrder["WOO_ROUTER_BRAND"] as! String
            // line 7
            let custport = self.curWorkOrder["WOO_PORT"] as! String
            let custmodembrand = self.curWorkOrder["WOO_MODEM_BRAND"] as! String
            let custslotln = self.curWorkOrder["WOO_SLOTLN"] as! String
            let custportln = self.curWorkOrder["WOO_PORTLN"] as! String
            
            
            // Request Detail
            let requestproducttype1 = self.curWorkOrder["WOO_PRODUCT_TYPE1"] as! String
            let requestproducttype2 = self.curWorkOrder["WOO_PRODUCT_TYPE2"] as! String
            
            let requestreportdate = self.curWorkOrder["WOO_REPORT_DATE"] as! String
            let requesttestresult = self.curWorkOrder["WOO_TEST_RESULT"] as! String
            let requestfaultdesc = self.curWorkOrder["WOO_FAULT_DESC"] as! String
            let requestnote = self.curWorkOrder["WOO_NOTE"] as! String
            let requestreportedby = self.curWorkOrder["WOO_REPORTED_BY"] as! String
            let requestcontact = self.curWorkOrder["WOO_CONTACT"] as! String
            let requestdispatcher = self.curWorkOrder["WOO_DISPATCHER"] as! String
            
            
            self.vCustomerNameLabel.text = "\(custname)"
            self.vCustomerDetailTxtView.text = "\(custaddress)\r\n\(custservid)\r\n\(custphoneno)\r\nชุมสาย:\(custexchange)\t\tหมายเหตุ GIS:\(custgis)\r\n" +
                                                "TIE:\(custtie) PRI:\(custpri) Cab:\(custcab) Sec:\(custsec) dp:\(custdp) หมุด:\(custpin) d.w.:\(custdw)\r\n" +
                                                "ข้อมูล ADSL: ระบบ-\(custadslinfo)\(custadslsys) โครงข่าย-\(custadslnetwork) ความเร็ว-\(custadslspeed) ยี่ห้อ-\(custrouterbrand)\r\n" +
                                                "Port-\(custport) Modem ยี่ห้อ-\(custmodembrand) Slotln-\(custslotln) Portln-\(custportln)"
            self.vRequestNameLabel.text = "\(requestproducttype1) \(requestproducttype2)"
            self.vRequestDetailTxtView.text = "วันที่รับแจ้ง: \(requestreportdate)\r\n" +
                                                "เหตุเสีย: \(requesttestresult)\r\n" +
                                                "ผลการทดลอง: \(requestfaultdesc)\r\n" +
                                                "หมายเหตุ: \(requestnote)\r\n" +
                                                "ผู้แจ้ง: \(requestreportedby)       ติดต่อ: \(requestcontact)\r\n" +
                                                "ผู้จ่ายงาน: \(requestdispatcher)"
            
            self.centerAndPointOnLocation()
        }else{
            
        }
        
        
    }


}
