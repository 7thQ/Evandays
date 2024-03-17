import SwiftUI
@_spi(Experimental) import MapboxMaps

private struct WeatherData: Identifiable, Equatable {
    let id = UUID().uuidString
    let coordinate: CLLocationCoordinate2D
    let temperature: Measurement<UnitTemperature>
    let iconName: String
}

@available(iOS 14.0, *)
struct WeatherAnnotationExample: View {
    
    
    @State private var viewport: Viewport = .camera(center: .dc, zoom: 3)

    @State private var selectedData: WeatherData?
    private var weatherData: [WeatherData] = [
        WeatherData(coordinate: .helsinki, temperature: Measurement(value: 25, unit: .celsius), iconName: "sun.min.fill"),

        WeatherData(coordinate: .dc, temperature: Measurement(value: 15, unit: .celsius), iconName: "cloud.drizzle.fill"),
        WeatherData(coordinate: .berlin, temperature: Measurement(value: 30, unit: .celsius), iconName: "cloud.bolt.rain.fill")
    ]
    @State private var islegendpresented  = false
    @State private var textFieldInput: String = ""
    var body: some View {
        
        ZStack{


            Map(viewport: $viewport) {
                ForEvery(weatherData) { data in
                    MapViewAnnotation(coordinate: data.coordinate) {
                        WeatherIconView(data: data, selectedData: $selectedData)
                    }
                    
                }
                
            }
            
            .mapStyle(MapStyle(uri: StyleURI(rawValue: "mapbox://styles/davidgomez01/clsoy6fna008l01r65t9ba1qo")!))
           
            
            .onChange(of: selectedData?.coordinate) { center in
                guard let center else { return }

                withViewportAnimation(.default(maxDuration: 0.5)) {
                    viewport = .camera(center: center, zoom: 2.5)
                }
                
            }
            
            .ignoresSafeArea()

        }
        
    }
}


@available(iOS 14.0, *)
private struct WeatherIconView: View {
    var data: WeatherData
    @Binding var selectedData: WeatherData?
    @State private var isSelected = false

    private let formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter
    }()

    var body: some View {
        ZStack {
            Circle()
                .stroke(.white, lineWidth: 3)
                .overlay(Circle().fill(.blue))
                .frame(width: isSelected ? 50 : 35, height: isSelected ? 50 : 35)
            VStack {
                if isSelected {
                    Text(formatter.string(from: data.temperature))
                        .font(.caption2)
                }
                Image(systemName: data.iconName)
            }
        }
        .foregroundColor(.white)
        .onTapGesture {
            selectedData = data
        }
        .onChange(of: selectedData) { selectedData in
            withAnimation(.interactiveSpring()) {
                isSelected = selectedData == data
            }
        }
    }
}
@available(iOS 14.0, *)
struct WeatherAnnotationExample_Preview: PreviewProvider {

    static var previews: some View {
        WeatherAnnotationExample()
        
    }
}


//
//
//VStack{
//           ZStack{
//
//               HStack{
//                   Spacer()
//                   HStack{
//                       Button(action: { /* who you follow/maps Action 2 */ }) {
//
//                           TextField("Placeholder", text: $textFieldInput)
//                               .textFieldStyle(RoundedBorderTextFieldStyle())
//                               .padding(0)
//                               .cornerRadius(10)
//                               .padding(.trailing, 10)
//
//                       }
//
//                   }
//                   .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)
//
//                   Spacer()
//
//                   HStack{
//
//                       Button(action: { islegendpresented = true}) {
//                           Text("Legend")
//                               .padding(13)
//                               .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.4)) // Dark Emerald Green
//                               .background(Color.white/*.opacity(0.9)*/)
//                               .cornerRadius(4)
//                               .sheet(isPresented:
//                                       $islegendpresented ) {
//                                      
//                                   SwiftUIRoot()
//                                                   }
//                       }
//                   }
//                   .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)
//
//                   Spacer()
//
//               }
//
//           }
//           Spacer()
//
//       }







//let UsaCenter = CLLocationCoordinate2D(latitude: 39.97395, longitude: -100.65319)
//let CA = CLLocationCoordinate2D(latitude: 36.97458, longitude: -119.53795)
//
//WeatherData(coordinate: .newYork, temperature: Measurement(value: 40, unit: .celsius), iconName: "gear"),
//WeatherData(coordinate: UsaCenter, temperature: Measurement(value: 5, unit: .celsius), iconName: "gear"),
//WeatherData(coordinate: CA, temperature: Measurement(value: 5, unit: .celsius), iconName: "gear"),
