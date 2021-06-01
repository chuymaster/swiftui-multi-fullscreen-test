import Combine
import SwiftUI

final class AppEnvironment: ObservableObject {
    var fullScreenCoverItem = PassthroughSubject<FullScreenCoverItem?, Never>()
    var closeAllTrigger = PassthroughSubject<Void, Never>()
    
}
