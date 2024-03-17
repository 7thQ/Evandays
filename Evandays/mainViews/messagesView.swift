

import SwiftUI

struct messagesView: View {

    var body: some View {
        NavigationView {
            
           
            ZStack{

                VStack{
                    MessagesDisplayWidget()
                }
                .padding(.top, 90)
                VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(MockData().stories) {
                                StoryView(story: $0)
                            }
                        }
                        
                    }
                    Spacer()
                }
            }
            
  
        }
    }
}
#Preview {
    messagesView()
}




