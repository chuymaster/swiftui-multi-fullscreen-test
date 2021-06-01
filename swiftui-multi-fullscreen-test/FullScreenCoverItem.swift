import Foundation
import SwiftUI

struct FullScreenCoverItem: Identifiable {
    enum CoverType: CaseIterable {
        case screenOne
        case screenTwo
        case screenThree
    }
    
    let id = UUID()
    let coverType: CoverType
    
    init(_ coverType: CoverType) {
        self.coverType = coverType
    }
    
    static func makeRandomInit() -> Self {
        let random = Int.random(in: 0..<CoverType.allCases.count)
        if random == 0 {
            return FullScreenCoverItem.init(.screenThree)
        } else if random == 1 {
            return FullScreenCoverItem.init(.screenTwo)
        } else {
            return FullScreenCoverItem.init(.screenOne)
        }
    }
    
    @ViewBuilder
    func buildView() -> some View {
        switch self.coverType {
        case .screenOne:
            FullScreenCoverView {
                VStack {
                    Text("One \(UUID().uuidString)")
                    Spacer()
                }
            }
        case .screenTwo:
            FullScreenCoverView {
                VStack {
                    Text("Two \(UUID().uuidString)")
                    Spacer()
                }
            }
        case .screenThree:
            FullScreenCoverView {
                VStack {
                    Text("Three \(UUID().uuidString)")
                    Spacer()
                }
            }
        }
    }
}
