//
//  ThemeDetailViewContoller().swift
//  EscapeRooms
//
//  Created by playhong on 2023/02/23.
//

import UIKit
import MapKit
import CoreLocation

class ThemeDetailViewContoller: UIViewController {

    // MARK: - Properties
    
    private let detailView = ThemeDetailView()
    
    let locationManager = CLLocationManager()
    
    // 지도에 표시 할 좌표 설정
    let coordinate = CLLocationCoordinate2D(latitude: 37.4974033, longitude: 127.0310522)
    
    var themes: Theme?
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureDelegate()
        locationInfomation()
        addMapPin()
    }
    
    // MARK: - Configure
    
    func setupUI() {
        title = themes?.name
        detailView.image.image = themes?.image
        detailView.nameLabel.text = themes?.name
        detailView.companyLabel.text = themes?.company
        detailView.difficultyLabel.text = themes?.difficulty
        detailView.playTimeLabel.text = themes?.playTime
        detailView.personnelLabel.text = themes?.personnel
        detailView.storyTextView.text = themes?.story
        detailView.priceLabel.text = themes?.price
    }
    
    func configureDelegate() {
        detailView.mapView.delegate = self
    }
    
    func locationInfomation() {
        // 좌표 지정 및 확대
        detailView.mapView.setRegion(MKCoordinateRegion(center: coordinate,
                                             span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: false)
    }
    
    func addMapPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "비트포비아 강남 던전"
        pin.subtitle = "서울시 강남구 역삼동 824-25 대우디오빌플러스 지하 1층 111호" 
        detailView.mapView.addAnnotation(pin)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Custom")
//
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Custom")
//            annotationView?.canShowCallout = true
//
//        } else {
//            annotationView?.annotation = annotation
//
//        }
//
//        annotationView?.image = exitImage
//
//        return MKAnnotationView()
//    }
}

// MARK: - Extension

extension ThemeDetailViewContoller: MKMapViewDelegate {
    
}

extension ThemeDetailViewContoller: CLLocationManagerDelegate {
}

extension ThemeDetailView: UIWebViewDelegate {
    
}
