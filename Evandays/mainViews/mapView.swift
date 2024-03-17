



import SwiftUI
@_spi(Experimental) import MapboxMaps




struct mapView: View {

    @State private var showDetails = false // State to control sheet presentation
    var gradient = Gradient(colors: [.yellow])
    @State private var zoomLevel: Double = 16 // Initial zoom level
    let MiddleOfNorthAmerica = CLLocationCoordinate2D(latitude: 40.81843, longitude: -103.91020)
    let MiddleofCanda = CLLocationCoordinate2D(latitude: 57.66686, longitude: -105.83409)
    let MiddleOfCountrys = CLLocationCoordinate2D(latitude: 40.81843, longitude: -103.91020)
    let Middleofstates = CLLocationCoordinate2D(latitude: 37.17919, longitude: -119.73603)
    let MiddleofCountys = CLLocationCoordinate2D(latitude: 38.83297, longitude: -121.95558)
    let MiddleOfCitiesOrTowns = CLLocationCoordinate2D(latitude: 38.55647, longitude: -121.54011)
    let MiddleOfNeighboorhoods = CLLocationCoordinate2D(latitude: 38.58284, longitude: -121.54232)
    let userparcel = CLLocationCoordinate2D(latitude: 38.58012, longitude: -121.54498)

    let UserCurrentLocation = CLLocationCoordinate2D(latitude: 38.58012, longitude: -121.54498)


    var body: some View {
        ZStack {
            Map(initialViewport: .camera(center: UserCurrentLocation, zoom: zoomLevel, bearing: 0, pitch: 0)) {
                // Check the current zoom level before displaying the annotation
                if zoomLevel > 15 && zoomLevel <= 22 {
                    
                    MapViewAnnotation(coordinate: userparcel) {
                        Button(action: {
                            showDetails.toggle() // Show the sheet when the annotation is tapped
                        }) {
                            VStack {
                                ParcelMapAnnotationVideoView()

                            }
                        }
                    }
                    .allowOverlap(false)
                    .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])

                    // Zoom level is between 16 and 22
                    // Add your specific view or action here
                } else if zoomLevel > 12 && zoomLevel <= 16 {
                    
                    MapViewAnnotation(coordinate: MiddleOfNeighboorhoods) {
                        Button(action: {
                            showDetails.toggle() // Show the sheet when the annotation is tapped
                        }) {
                            VStack {
                            

                            }
                        }
                    }
                    .allowOverlap(false)
                    .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])




                    // Zoom level is between 12 and 16
                    // Add your specific view or action here
                } 
                else if zoomLevel > 9 && zoomLevel <= 12 {
                    
                    MapViewAnnotation(coordinate: MiddleOfCitiesOrTowns) {
                        Button(action: {
                            showDetails.toggle() // Show the sheet when the annotation is tapped
                        }) {
                            VStack {
                               

                            }
                        }
                    }
                    .allowOverlap(false)
                    .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])




                    // Zoom level is between 9 and 12
                    // Add your specific view or action here
                } 
                else if zoomLevel > 7 && zoomLevel <= 9 {
                    
                    MapViewAnnotation(coordinate: MiddleofCountys) {
                        Button(action: {
                            showDetails.toggle() // Show the sheet when the annotation is tapped
                        }) {
                            VStack {
                            

                            }
                        }
                    }
                    .allowOverlap(false)
                    .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])




                    // Zoom level is between 7 and 9
                    // Add your specific view or action here
                }
                else if zoomLevel > 4 && zoomLevel <= 7 {
                    
                    MapViewAnnotation(coordinate:  Middleofstates) {
                        Button(action: {
                            showDetails.toggle() // Show the sheet when the annotation is tapped
                        }) {
                            VStack {
                               

                            }
                        }
                    }
                    .allowOverlap(false)
                    .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])




                    // Zoom level is between 3 and 7
                    // Add your specific view or action here
                }
                else if zoomLevel > 3 && zoomLevel <= 4 {
                    
                    MapViewAnnotation(coordinate: MiddleOfCountrys) {
                        Button(action: {
                            showDetails.toggle() // Show the sheet when the annotation is tapped
                        }) {
                            VStack {
                               

                            }
                        }
                    }
                    .allowOverlap(false)
                    .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])




                    // Zoom level is between 3 and 7
                    // Add your specific view or action here
                } 
                else if zoomLevel >= 0 && zoomLevel <= 2.9 {
                    
                    MapViewAnnotation(coordinate: MiddleOfNorthAmerica) {
                        Button(action: {
                            showDetails.toggle() // Show the sheet when the annotation is tapped
                        }) {
                            VStack {
                          

                            }
                        }
                    }
                    .allowOverlap(false)
                    .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])




                    // Zoom level is between 0 and 2.9
                    // Add your specific view or action here
                }


            }
            .onCameraChanged { cameraState in
                // Update the zoom level state based on the camera's current zoom
                zoomLevel = cameraState.cameraState.zoom
            }
            .mapStyle(MapStyle(uri: StyleURI(rawValue: "mapbox://styles/davidgomez01/clt7l7yp300i001ptfrriex5u")!))
            .debugOptions([.camera, .padding, .collision])
            .ignoresSafeArea()
            SearchMapBar()
            
        
        }
        .sheet(isPresented: $showDetails) {
            PlaceContentView()
        }
    }
}






struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView()
    }
}














































//
//MapViewAnnotation(coordinate: MiddleOfNorthAmerica) {
//    Button(action: {
//        showDetails.toggle() // Show the sheet when the annotation is tapped
//    }) {
//        VStack {
//            MapAnnotationVideoView()
//            ZStack{
//                Circle()
//                    .stroke(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2.5)
//                    .frame(width: 20, height: 20) // Slightly larger to ensure it's visible around the video
//                Text("#1")
//                    .padding(3)
//                    .foregroundColor(.yellow)
//                    .background(Color.black.opacity(0.8))
//                    .cornerRadius(40)
//                    .truncationMode(.tail)
//                    .font(.caption2)
//            }
//            Text("United States")
//                .foregroundColor(.black)
//                .truncationMode(.tail)
//                .font(.caption2)
//        }
//    }
//}
//.allowOverlap(false)
//.variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)])
//
//






// test view below for zoom in and out



//
//struct GoodExample: View {
//    let coordinate = CLLocationCoordinate2D(latitude: 40.81843, longitude: -103.91020)
//    
//    @StateObject private var model = Model()
//    
//    var body: some View {
//        Map(initialViewport: .camera(center: coordinate, zoom: 3, bearing: 0, pitch: 0)) {
//            if model.showAnnotation {
//                CircleAnnotation(centerCoordinate: coordinate)
//            }
//        }
//        .onCameraChanged {
//            model.setZoom($0.cameraState.zoom)
//        }
//        .debugOptions([.camera, .padding, .collision])
//    }
//    
//    private class Model: ObservableObject {
//        @Published var showAnnotation = false
//        
//        func setZoom(_ zoom: Double) {
//            let showAnnotation = zoom >= 3 && zoom <= 4
//            if showAnnotation != self.showAnnotation {
//                self.showAnnotation = showAnnotation
//            }
//        }
//    }
//}
//
//
//#Preview{
//    GoodExample()
//}
//
//

// end of ftest view


























//
//struct mapView: View {
//    // Specify the coordinate for the annotation
//    let MiddleOfUSA = CLLocationCoordinate2D(latitude: 40.81843, longitude: -103.91020)
////    let MiddleOfCali = CLLocationCoordinate2D(latitude: 37.11965, longitude: -119.93151)
//    let coordinate = CLLocationCoordinate2D(latitude: 38.57995, longitude: -121.54497)
//  
//
//    var body: some View {
//        ZStack{
//            Map(initialViewport: .camera(center: MiddleOfUSA, zoom: 2.8, bearing: 0, pitch: 0)) {
//                
//
//                MapViewAnnotation(coordinate: MiddleOfUSA) {
//
//                    MapAnnotationVideoView()
//                    Text("#1")
//                        .foregroundColor(.yellow)
//                        .truncationMode(.tail)
//                        .font(.caption2)
//                    Text("United States")
//                        .foregroundColor(.white)
//                        .truncationMode(.tail)
//                        .font(.caption2)
//
//
//                    
//                }
//                
//                
//                
//                
//                .allowOverlap(false) // Ensures the annotation does not overlap with others
//                
//                .variableAnchors([ViewAnnotationAnchorConfig(anchor: .center)]) // Anchors the annotation
//          
//            }
//            
//            
//            .mapStyle(MapStyle(uri: StyleURI(rawValue: "mapbox://styles/davidgomez01/clt1xkcdx008101ptedgo6kh7")!))
//                .debugOptions([.camera,.padding,.collision])
//
//           
//            .ignoresSafeArea()
//
//            
//            SearchMapBar()
//        }
//    }
//}
//
//
//#Preview{
//        mapView()
//    }
//
//


//
//
//
//
//
//
//



























//
//
//import SwiftUI
//// As SwiftUI support is experimental it needs to be imported with @_spi(Experimental)
//// The API may change in future releases.
//@_spi(Experimental) import MapboxMaps
// 
//struct mapView: View {
//        @State private var islegendpresented  = false
//        @State private var textFieldInput: String = ""
//var body: some View {
//let center = CLLocationCoordinate2D(latitude: 39.5, longitude: -98.0)
//    ZStack{
//        Map(initialViewport: .camera(center: center, zoom: 2, bearing: 0, pitch: 0)){
//            
//        }
//                .mapStyle(MapStyle(uri: StyleURI(rawValue: "mapbox://styles/davidgomez01/clsoy6fna008l01r65t9ba1qo")!))
//                .debugOptions([.camera,.padding,.collision])
//
//                .ignoresSafeArea()
//    }
//}
//}
//#Preview{
//    mapView()
//}
//


  


//
//











