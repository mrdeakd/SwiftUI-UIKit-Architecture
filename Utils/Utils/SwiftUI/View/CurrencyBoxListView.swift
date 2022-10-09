import SwiftUI

// swiftlint:disable line_length
public struct CurrencyBoxListView: View {
    let items: [HufExchangeRateItem]
    let paddingSize: CGFloat
    let spaceBetweenItems: CGFloat

    public init(items: [HufExchangeRateItem], paddingSize: CGFloat = 6, spaceBetweenItems: CGFloat = 16) {
        self.items = items
        self.paddingSize = paddingSize
        self.spaceBetweenItems = spaceBetweenItems
    }

    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: spaceBetweenItems) {
                ForEach(items, id: \.self) { item in
                    CurrencyRowItemView(
                        title: item.currency,
                        subText: "\(ExchangeRateLocalizable.buy_rate(preferredLanguages: PreferredAppLanguage.current)) - \(item.buyRate)",
                        subSubText: "\(ExchangeRateLocalizable.sell_rate(preferredLanguages: PreferredAppLanguage.current)) - \(item.sellRate)",
                        iconName: Currency(from: item.currency).imageName
                    )
                }
            }
        }
        .padding(.horizontal, paddingSize)
    }
}

struct CurrencyBoxListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            CurrencyBoxListView(
                items: [HufExchangeRateItem(currency: Currency.HUF.name, sellRate: "15", buyRate: "25")],
                paddingSize: 16,
                spaceBetweenItems: 16
            )
        }
    }
}
