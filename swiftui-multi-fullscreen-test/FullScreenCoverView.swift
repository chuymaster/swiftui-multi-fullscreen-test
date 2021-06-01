import SwiftUI

struct FullScreenCoverView<Content: View>: View {
    
    @EnvironmentObject private var appEnvironment: AppEnvironment
    @Environment(\.presentationMode) var presentationMode
    
    @State private var fullScreenCoverItem: FullScreenCoverItem?
    let content: () -> Content
    
    var body: some View {
        ZStack {
            content()
            VStack(spacing: 32) {
                Button(action: {
                    appEnvironment.fullScreenCoverItem.send(FullScreenCoverItem.makeRandomInit())
                }, label: {
                    Text("Open")
                })
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Close")
                })
                Button(action: {
                    appEnvironment.closeAllTrigger.send(())
                }, label: {
                    Text("Close All")
                })
            }
        }
        .background(
            EmptyView()
                .fullScreenCover(item: $fullScreenCoverItem) { item in
                    item.buildView()
                        .environmentObject(appEnvironment)
                }
        )
        .onReceive(appEnvironment.fullScreenCoverItem, perform: { item in
            guard item != nil && fullScreenCoverItem == nil else {
                return
            }
            fullScreenCoverItem = item
            appEnvironment.fullScreenCoverItem.send(nil)
        })
        .onReceive(appEnvironment.closeAllTrigger) { _ in
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct FullScreenCoverView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverView(content: { EmptyView() })
    }
}
