import SwiftUI

public struct UpperSearchBarView: View {
    let title: String
    let subText: String
    let image: String
    let placeholder: String

    let paddingSize: CGFloat
    let text: Binding<String>
    let onAsyncSearch: (() async throws -> Void)?
    let onAsyncSubmit: (() async throws -> Void)?
    let onIconTap: (() -> Void)?

    public init(
        title: String,
        subText: String,
        image: String,
        placeholder: String,
        paddingSize: CGFloat,
        text: Binding<String>,
        onAsyncSearch: (() async throws -> Void)? = nil,
        onAsyncSubmit: (() async throws -> Void)? = nil,
        onIconTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subText = subText
        self.image = image
        self.placeholder = placeholder
        self.paddingSize = paddingSize
        self.text = text
        self.onAsyncSearch = onAsyncSearch
        self.onAsyncSubmit = onAsyncSubmit
        self.onIconTap = onIconTap
    }

    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.lightBrown)
                Spacer()
                Image(systemName: ExchangeRateLocalizable.infoCircle())
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.lightBrown)
                    .frame(width: 24, height: 24)
                    .onTapGesture { onIconTap?() }
            }
            Text(subText).font(.title2)
                .font(.subheadline)
                .foregroundColor(.lightBrown)
                .fontWeight(.thin)
            HStack {
                Image(systemName: image)
                    .onTapGesture { Task { try await onAsyncSearch?() } }
                TextField(placeholder, text: text)
                    .textInputAutocapitalization(.characters)
                    .onSubmit { Task { try await onAsyncSubmit?() } }
                Image(systemName: ExchangeRateLocalizable.clearText())
                    .foregroundColor(.lightBrown)
                    .opacity(text.wrappedValue == .empty ? 0 : 1)
                    .onTapGesture { text.wrappedValue = .empty }
            }
            .padding(paddingSize)
            .background(.gray.opacity(0.1))
            .cornerRadius(12)
        }
        .padding(paddingSize)
        .background(.white)
        .padding(.bottom, paddingSize)
    }
}

struct UpperSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            UpperSearchBarView(
                title: "Title",
                subText: "SubText",
                image: "magnifyingglass",
                placeholder: "Placeholder",
                paddingSize: 16,
                text: .constant("Search text")
            )
        }
    }
}
