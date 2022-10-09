import SwiftUI

public struct SideBoxDictionaryView: View {
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
                HStack(spacing: spaceBetweenItems) {
                    ForEach(items.sorted(by: >), id: \.key) { key, value in
                        BoxItemView(title: key, subText: value.twoDecimalPoints, itemSize: itemSize)
                    }
                    .padding(.vertical)
                }
                .padding(.trailing, calculatedPadding)
                .padding(.leading, paddingSize)
            }
        }
        .padding(.horizontal, paddingSize)
        .background(Color.lightGray)
        .cornerRadius(20)
        .offset(x: calculatedPadding)
        .padding(.vertical)
    }
    
    var calculatedPadding: CGFloat {
        UIScreen.main.bounds.size.width
        - ((itemsToShow - 1) * spaceBetweenItems)
        - ((itemsToShow - 1) * itemSize)
        - (itemSize / 2) - paddingSize
    }
}

struct SideBoxDictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            SideBoxDictionaryView(
                items: ["ItemOne": 1, "ItemTwo": 2, "ItemThree": 3],
                paddingSize: 16,
                itemSize: 126,
                spaceBetweenItems: 16,
                itemsToShow: 3
            )
        }
    }
}
