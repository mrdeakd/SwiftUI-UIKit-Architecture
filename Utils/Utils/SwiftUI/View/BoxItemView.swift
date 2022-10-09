import SwiftUI

public struct BoxItemView: View {
    let title: String
    let subText: String
    let subSubText: String?
    let itemSize: CGFloat
    
    public init(title: String, subText: String, subSubText: String? = nil, itemSize: CGFloat) {
        self.title = title
        self.subText = subText
        self.subSubText = subSubText
        self.itemSize = itemSize
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
                if let subSubText = subSubText {
                    Text(subSubText)
                        .font(.system(size: 18, weight: .bold, design: .serif))
                        .foregroundColor(.lightBrown)
                }
            }
        }
        .frame(width: itemSize, height: itemSize)
    }
}

struct BoxItemView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            BoxItemView(
                title: "Title",
                subText: "SubText",
                itemSize: 126
            )
        }
    }
}
