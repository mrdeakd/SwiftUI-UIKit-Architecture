import SwiftUI
import Utils

public struct InfoItemView: View {
    public var title: String?
    public var message: String?
    public var cornerRadius: CGFloat
    public var renderMode: Image.TemplateRenderingMode
    public var didFinish: (() -> Void)?
    
    public init(
        title: String? = nil,
        message: String? = nil,
        cornerRadius: CGFloat = 12,
        renderMode: Image.TemplateRenderingMode = .template,
        didFinish: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.cornerRadius = cornerRadius
        self.renderMode = renderMode
        self.didFinish = didFinish
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack(alignment: .leading) {
                if let title = title {
                    Text(title)
                        .font(.system(size: 18, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                }
                if let message = message {
                    Text(message)
                        .font(.system(size: 14, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 2)
            Spacer()
            if let didFinish = didFinish {
                Button(action: didFinish, label: {
                    Image(systemName: ExchangeRateLocalizable.xmark())
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(maxWidth: 16, maxHeight: 16)
                })
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(Color.lightGreen)
        .cornerRadius(cornerRadius)
    }
}
