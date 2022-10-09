// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.2.0
// Required Sourcery: 1.8.0


import SwiftyMocky
import XCTest
import DataLayer
import Foundation
import Utils
@testable import ExchangeRate


// MARK: - AppRepositoryProtocol

open class AppRepositoryProtocolMock: AppRepositoryProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getExchangeRateForSelectedCurrency(selectedCurrency: Currency) throws -> ExchangeRateList {
        addInvocation(.m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(Parameter<Currency>.value(`selectedCurrency`)))
		let perform = methodPerformValue(.m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(Parameter<Currency>.value(`selectedCurrency`))) as? (Currency) -> Void
		perform?(`selectedCurrency`)
		var __value: ExchangeRateList
		do {
		    __value = try methodReturnValue(.m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(Parameter<Currency>.value(`selectedCurrency`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getExchangeRateForSelectedCurrency(selectedCurrency: Currency). Use given")
			Failure("Stub return value not specified for getExchangeRateForSelectedCurrency(selectedCurrency: Currency). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getHufExchangeRate() throws -> HufExchangeRateList {
        addInvocation(.m_getHufExchangeRate)
		let perform = methodPerformValue(.m_getHufExchangeRate) as? () -> Void
		perform?()
		var __value: HufExchangeRateList
		do {
		    __value = try methodReturnValue(.m_getHufExchangeRate).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getHufExchangeRate(). Use given")
			Failure("Stub return value not specified for getHufExchangeRate(). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(Parameter<Currency>)
        case m_getHufExchangeRate

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(let lhsSelectedcurrency), .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(let rhsSelectedcurrency)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSelectedcurrency, rhs: rhsSelectedcurrency, with: matcher), lhsSelectedcurrency, rhsSelectedcurrency, "selectedCurrency"))
				return Matcher.ComparisonResult(results)

            case (.m_getHufExchangeRate, .m_getHufExchangeRate): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(p0): return p0.intValue
            case .m_getHufExchangeRate: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency: return ".getExchangeRateForSelectedCurrency(selectedCurrency:)"
            case .m_getHufExchangeRate: return ".getHufExchangeRate()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getExchangeRateForSelectedCurrency(selectedCurrency: Parameter<Currency>, willReturn: ExchangeRateList...) -> MethodStub {
            return Given(method: .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(`selectedCurrency`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getHufExchangeRate(willReturn: HufExchangeRateList...) -> MethodStub {
            return Given(method: .m_getHufExchangeRate, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getExchangeRateForSelectedCurrency(selectedCurrency: Parameter<Currency>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(`selectedCurrency`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getExchangeRateForSelectedCurrency(selectedCurrency: Parameter<Currency>, willProduce: (StubberThrows<ExchangeRateList>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(`selectedCurrency`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (ExchangeRateList).self)
			willProduce(stubber)
			return given
        }
        public static func getHufExchangeRate(willThrow: Error...) -> MethodStub {
            return Given(method: .m_getHufExchangeRate, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getHufExchangeRate(willProduce: (StubberThrows<HufExchangeRateList>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getHufExchangeRate, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (HufExchangeRateList).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getExchangeRateForSelectedCurrency(selectedCurrency: Parameter<Currency>) -> Verify { return Verify(method: .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(`selectedCurrency`))}
        public static func getHufExchangeRate() -> Verify { return Verify(method: .m_getHufExchangeRate)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getExchangeRateForSelectedCurrency(selectedCurrency: Parameter<Currency>, perform: @escaping (Currency) -> Void) -> Perform {
            return Perform(method: .m_getExchangeRateForSelectedCurrency__selectedCurrency_selectedCurrency(`selectedCurrency`), performs: perform)
        }
        public static func getHufExchangeRate(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getHufExchangeRate, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MainScreenNavigationProtocol

open class MainScreenNavigationProtocolMock: MainScreenNavigationProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var onFinish: (() -> Void)? {
		get {	invocations.append(.p_onFinish_get); return __p_onFinish ?? optionalGivenGetterValue(.p_onFinish_get, "MainScreenNavigationProtocolMock - stub value for onFinish was not defined") }
		set {	invocations.append(.p_onFinish_set(.value(newValue))); __p_onFinish = newValue }
	}
	private var __p_onFinish: (() -> Void)?

    public var onGoToCreatorScreen: (() -> Void)? {
		get {	invocations.append(.p_onGoToCreatorScreen_get); return __p_onGoToCreatorScreen ?? optionalGivenGetterValue(.p_onGoToCreatorScreen_get, "MainScreenNavigationProtocolMock - stub value for onGoToCreatorScreen was not defined") }
		set {	invocations.append(.p_onGoToCreatorScreen_set(.value(newValue))); __p_onGoToCreatorScreen = newValue }
	}
	private var __p_onGoToCreatorScreen: (() -> Void)?






    fileprivate enum MethodType {
        case p_onFinish_get
		case p_onFinish_set(Parameter<(() -> Void)?>)
        case p_onGoToCreatorScreen_get
		case p_onGoToCreatorScreen_set(Parameter<(() -> Void)?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {            case (.p_onFinish_get,.p_onFinish_get): return Matcher.ComparisonResult.match
			case (.p_onFinish_set(let left),.p_onFinish_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<(() -> Void)?>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            case (.p_onGoToCreatorScreen_get,.p_onGoToCreatorScreen_get): return Matcher.ComparisonResult.match
			case (.p_onGoToCreatorScreen_set(let left),.p_onGoToCreatorScreen_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<(() -> Void)?>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_onFinish_get: return 0
			case .p_onFinish_set(let newValue): return newValue.intValue
            case .p_onGoToCreatorScreen_get: return 0
			case .p_onGoToCreatorScreen_set(let newValue): return newValue.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .p_onFinish_get: return "[get] .onFinish"
			case .p_onFinish_set: return "[set] .onFinish"
            case .p_onGoToCreatorScreen_get: return "[get] .onGoToCreatorScreen"
			case .p_onGoToCreatorScreen_set: return "[set] .onGoToCreatorScreen"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func onFinish(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onFinish_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func onGoToCreatorScreen(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onGoToCreatorScreen_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var onFinish: Verify { return Verify(method: .p_onFinish_get) }
		public static func onFinish(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onFinish_set(newValue)) }
        public static var onGoToCreatorScreen: Verify { return Verify(method: .p_onGoToCreatorScreen_get) }
		public static func onGoToCreatorScreen(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onGoToCreatorScreen_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

