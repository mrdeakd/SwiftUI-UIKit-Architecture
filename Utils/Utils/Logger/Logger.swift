import os.log

// swiftlint:disable function_parameter_count
public protocol Logger {
    init(subsystem: String, appLogsEnabled: Bool)

    func log<T: CustomStringConvertible>(
        level: Logging.Level,
        category: Logging.Category,
        message: T,
        file: String,
        function: String,
        line: Int
    )
}

public extension Logger {
    func debug<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .debug, category: category, message: message, file: file, function: function, line: line)
    }

    func info<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .info, category: category, message: message, file: file, function: function, line: line)
    }

    func error<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .error, category: category, message: message, file: file, function: function, line: line)
    }

    func critical<T: CustomStringConvertible>(
        _ message: T,
        category: Logging.Category,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(level: .critical, category: category, message: message, file: file, function: function, line: line)
    }
}

public final class ExchangeLogger: Logger {
    private let subsystem: String
    private var loggers = [Logging.Category: OSLog]()
    private let appLogsEnabled: Bool

    public init(subsystem: String = Bundle.main.displayName ?? .empty, appLogsEnabled: Bool = true) {
        self.subsystem = subsystem
        self.appLogsEnabled = appLogsEnabled
    }

    public static let shared = ExchangeLogger()

    public func log<T: CustomStringConvertible>(
        level: Logging.Level,
        category: Logging.Category,
        message: T,
        file: String,
        function: String,
        line: Int
    ) {
        guard appLogsEnabled else { return }
        osLog(
            level: level,
            category: category,
            message: message.description,
            file: file,
            function: function,
            line: line
        )
    }

    private func osLog(
        level: Logging.Level,
        category: Logging.Category,
        message: String,
        file: String,
        function: String,
        line: Int
    ) {
        DispatchQueue.main.async {
            if self.loggers[category] == nil {
                self.loggers[category] = OSLog(subsystem: self.subsystem, category: category.rawValue)
            }

            guard let logger = self.loggers[category] else { return }
            logger(level: level, message: message, file: file, function: function, line: line)
        }
    }
}

private extension OSLogType {
    static func from(loggerLevel: Logging.Level) -> Self {
        switch loggerLevel {
        case .debug:
            return .debug
        case .info:
            return .info
        case .error:
            return .error
        case .critical:
            return .fault
        }
    }
}

private extension OSLog {
    func callAsFunction(level: Logging.Level, message: String, file: String, function: String, line: Int) {
        os_log("\n%@ %@\n➯ %@: %@ - line:%d\n➯ %s \n\n", log: self, type: OSLogType.from(loggerLevel: level),
               level.icon,
               level.rawValue.uppercased(),
               (file as NSString).lastPathComponent,
               function,
               line,
               message
        )
    }
}
