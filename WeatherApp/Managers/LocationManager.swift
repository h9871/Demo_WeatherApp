//
//  LocationManager.swift
//  WeatherApp
//
//  Created by yuhyeonjae on 2022/03/01.
//

import Foundation
import CoreLocation // 위치 관련

class LocationManager: NSObject, ObservableObject {
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        self.manager.delegate = self
    }
    
    func requestLocation() {
        self.isLoading = true
        self.manager.requestLocation()
    }
}

// MARK: - ㄴ 장소 관련
extension LocationManager: CLLocationManagerDelegate {
    /// 위치 업데이트
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
        self.isLoading = false
    }
    
    /// 위치 업데이트 실패 시
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting Location", error)
        self.isLoading = false
    }
}
