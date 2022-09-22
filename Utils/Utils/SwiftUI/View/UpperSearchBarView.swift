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

    public init(
        title: String,
        subText: String,
        image: String,
        placeholder: String,
        paddingSize: CGFloat,
        text: Binding<String>,
        onAsyncSearch: (() async throws -> Void)?,
        onAsyncSubmit: (() async throws -> Void)?
    ) {
        self.title = title
        self.subText = subText
        self.image = image
        self.placeholder = placeholder
        self.paddingSize = paddingSize
        self.text = text
        self.onAsyncSearch = onAsyncSearch
        self.onAsyncSubmit = onAsyncSubmit
    }

    public var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.lightBrown)
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
                }
                .textFieldStyle(.roundedBorder)
                Spacer()
            }
            .padding(paddingSize)
        }
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
                text: .constant("Search text"),
                onAsyncSearch: nil,
                onAsyncSubmit: nil
            )
        }
    }
}
