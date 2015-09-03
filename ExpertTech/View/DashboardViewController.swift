//
//  DashboardViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/14/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit
import MapKit

class DashboardViewController: UIViewController,MKMapViewDelegate, UIPopoverControllerDelegate{
    @IBOutlet weak var vMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    var openWorkOrderList = [WorkOrder]()
    
    var vWorkUnit:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Work Unit : \(vWorkUnit)")
        // Do any additional setup after loading the view.
        self.vMapView.delegate = self
        self.pointMapOnLocation()
        self.centerMapOnLocation()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Pin and centerlize MapView
    func centerMapOnLocation(){
        /*
        print("\(Double(workOrderList[0].woo_latitude)!), \(Double(workOrderList[0].woo_longitude)!)")
        let initialLocation = CLLocation(latitude: Double(workOrderList[0].woo_latitude)!, longitude: Double(workOrderList[0].woo_longitude)!)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        vMapView.setRegion(coordinateRegion, animated: false)
        */
        if vMapView.annotations.count == 0 {
            return
        }
        var topLeftCoord: CLLocationCoordinate2D = CLLocationCoordinate2D()
        topLeftCoord.latitude = -90
        topLeftCoord.longitude = 180
        var bottomRightCoord: CLLocationCoordinate2D = CLLocationCoordinate2D()
        bottomRightCoord.latitude = 90
        bottomRightCoord.longitude = -180
        for annotation: MKAnnotation in vMapView.annotations as [MKAnnotation]{
            topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude)
            topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude)
            bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude)
            bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude)
        }
        
        var region: MKCoordinateRegion = MKCoordinateRegion()
        region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5
        region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5
        region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 2
        region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 2
        region = vMapView.regionThatFits(region)
        vMapView.setRegion(region, animated: true)
        
        
    }
    func pointMapOnLocation(){
        print("Point Map on location : \(openWorkOrderList.count)")
        var i:Int = 1
        for workOrder:WorkOrder in openWorkOrderList{
            let lat = Double(workOrder.woo_latitude)!
            let long = Double(workOrder.woo_longitude)!
            let wooId = workOrder.woo_id
            let location = CLLocation(latitude: lat, longitude: long)
            //print("\(lat), \(long)")
            let point:MKPointAnnotation = MKPointAnnotation()
            point.coordinate = location.coordinate
            point.title = String(i)
            print("WOO_ID \(wooId)")
            point.subtitle = String(wooId)
           // let dict: [String : AnyObject] = ["workorder" : workOrder as! NSDictionary]
           // point.dictionaryWithValuesForKeys(["workorder" : workOrder as! NSDictionary])
            self.vMapView.addAnnotation(point)
            i++
        }

    }
    // MARK: - MapView delegate
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("PopOverDetailMapTableViewController") as! PopOverDetailMapTableViewController
        let popover = UIPopoverController(contentViewController: controller)
        popover.delegate = self
        let title:String = (view.annotation?.title!!)!
        let subtitle:String = (view.annotation?.subtitle!!)!

        controller.indexNumber = Int(title)!
        controller.workOrderId = NSDecimalNumber(string: subtitle)
        
        popover.presentPopoverFromRect(view.frame, inView: view.superview!, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)

    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = PinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        return annotationView
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

    

}
