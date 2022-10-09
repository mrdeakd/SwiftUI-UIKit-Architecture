extension Encodable {
    public var json: [String: String?]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
            .flatMap { $0 as? [String: String?] }
    }

    public var nonNilJson: [String: String?] {
        json ?? [:]
    }
}
