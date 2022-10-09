import SwiftUI

public struct CurrencyRowItemView: View {
    let title: String
    let subText: String
    let subSubText: String?
    let iconName: String

    public init(title: String, subText: String, subSubText: String? = nil, iconName: String) {
        self.title = title
        self.subText = subText
        self.subSubText = subSubText
        self.iconName = iconName
    }

    public var body: some View {
        ZStack {
            Color.white
                .border(width: 1, edges: [.top, .bottom], color: .lightBrown.opacity(0.3))
            HStack {
                Image(iconName, bundle: Bundle(for: LocalBundle.self))
                    .resizable()
                    .frame(width: 56, height: 56)
                    .padding(.trailing, 16)
                VStack(alignment: .leading) {
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
                .padding(.vertical)
            }
        }
    }
}
