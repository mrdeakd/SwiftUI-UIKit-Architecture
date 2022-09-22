import SwiftUI

public struct SideBoxListView: View {
    let items: [String: Double]
    let paddingSize: CGFloat
    let itemSize: CGFloat
    let spaceBetweenItems: CGFloat
    let itemsToShow: CGFloat
    
    public init(items: [String : Double], paddingSize: CGFloat = 12, itemSize: CGFloat = 126, spaceBetweenItems: CGFloat = 16, itemsToShow: CGFloat = 3) {
        self.items = items
        self.paddingSize = paddingSize
        self.itemSize = itemSize
        self.spaceBetweenItems = spaceBetweenItems
        self.itemsToShow = itemsToShow
    }
 
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { value in
                HStack(spacing: 24) {
                    ForEach(items.sorted(by: >), id: \.key) { key, value in
                        BoxItemView(title: key, subText: value.twoDecimalPoints, itemSize: itemSize, spaceBetweenItems: spaceBetweenItems)
                    }
                }
                .padding(.trailing, calculatedPadding)
                .padding(.leading, paddingSize)
            }
        }
        .padding(.horizontal, paddingSize)
        .background(Color.lightGray)
        .cornerRadius(20)
        .offset(x: calculatedPadding)
    }
    
    var calculatedPadding: CGFloat {
        UIScreen.main.bounds.size.width
        - ((itemsToShow - 1) * spaceBetweenItems)
        - ((itemsToShow - 1) * itemSize)
        - (itemSize / 2) - paddingSize
    }
}
