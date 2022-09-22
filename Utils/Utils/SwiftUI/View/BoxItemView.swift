import SwiftUI

public struct BoxItemView: View {
    let title: String
    let subText: String
    let itemSize: CGFloat
    let spaceBetweenItems: CGFloat
    
    public init(title: String, subText: String, itemSize: CGFloat, spaceBetweenItems: CGFloat) {
        self.title = title
        self.subText = subText
        self.itemSize = itemSize
        self.spaceBetweenItems = spaceBetweenItems
    }
    
    public var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            VStack(alignment: .center) {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.lightBrown)
                Text(subText)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundColor(.lightBrown)
            }
            .padding(.vertical)
        }
        .transition(.move(edge: .leading))
        .frame(width: itemSize, height: itemSize)
        .padding(.vertical, spaceBetweenItems)
    }
}

struct BoxItemView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            BoxItemView(
                title: "Title",
                subText: "SubText",
                itemSize: 126,
                spaceBetweenItems: 16
            )
        }
    }
}
