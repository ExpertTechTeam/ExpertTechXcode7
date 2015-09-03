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
    var curWorkOrder:WorkOrder = WorkOrder()
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
        let lat = Double(curWorkOrder.woo_latitude)!
        let long = Double(curWorkOrder.woo_longitude)!
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
            let curWorkOrderDict = workOrderDetailList[0] as! NSDictionary
            self.curWorkOrder = WorkOrder(dict: curWorkOrderDict)
            // Customer Detail
            let custname = self.curWorkOrder.woo_cus_name
            // line 1
            let custaddress = self.curWorkOrder.woo_cus_address
            // line 2
            let custservid = self.curWorkOrder.woo_cus_serv_id
            // line 3
            let custphoneno = self.curWorkOrder.woo_order_no
            // line 4
            let custexchange = self.curWorkOrder.woo_exchange
            let custgis = self.curWorkOrder.woo_gis
            // line 5
            let custtie = self.curWorkOrder.woo_tie
            let custpri = self.curWorkOrder.woo_pri
            let custcab = self.curWorkOrder.woo_cab
            let custsec = self.curWorkOrder.woo_sec
            let custdp = self.curWorkOrder.woo_dp
            let custpin = self.curWorkOrder.woo_pin
            let custdw = self.curWorkOrder.woo_dw
            // line 6
            let custadslinfo = self.curWorkOrder.woo_adsl_info
            let custadslsys = self.curWorkOrder.woo_adsl_system
            let custadslnetwork = self.curWorkOrder.woo_adsl_network
            let custadslspeed = self.curWorkOrder.woo_adsl_speed
            let custrouterbrand = self.curWorkOrder.woo_router_brand
            // line 7
            let custport = self.curWorkOrder.woo_port
            let custmodembrand = self.curWorkOrder.woo_modem_brand
            let custslotln = self.curWorkOrder.woo_slotln
            let custportln = self.curWorkOrder.woo_portln
            
            
            // Request Detail
            let requestproducttype1 = self.curWorkOrder.woo_product_type1
            let requestproducttype2 = self.curWorkOrder.woo_product_type2
            
            let requestreportdate = self.curWorkOrder.woo_report_date
            let requesttestresult = self.curWorkOrder.woo_test_result
            let requestfaultdesc = self.curWorkOrder.woo_fault_desc
            let requestnote = self.curWorkOrder.woo_note
            let requestreportedby = self.curWorkOrder.woo_reported_by
            let requestcontact = self.curWorkOrder.woo_contact
            let requestdispatcher = self.curWorkOrder.woo_dispatcher
            
            
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
