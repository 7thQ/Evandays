

//
//
//import Foundation
//import CoreLocation
//
//struct MapAnnotationItem: Identifiable {
//    let id = UUID() // Unique identifier for each annotation
//    let coordinate: CLLocationCoordinate2D
//    let title: String
//    let subtitle: String
//    let zoomLevelRange: ClosedRange<Double>
//}
//
//class MapAnnotationsViewModel: ObservableObject {
//    @Published var annotations: [MapAnnotationItem] = []
//    
//    init() {
//        // Initialize with some annotations or load them from a data source
//        // Example annotation
//        annotations.append(MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 38.58012, longitude: -121.54498), title: "Example Title", subtitle: "Example Subtitle", zoomLevelRange: 15...22))
//    }
//    
//    func annotations(forZoomLevel zoomLevel: Double) -> [MapAnnotationItem] {
//        annotations.filter { $0.zoomLevelRange.contains(zoomLevel) }
//    }
//}
//
