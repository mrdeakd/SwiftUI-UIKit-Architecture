@testable import ExchangeRate
import SwiftyMocky
import XCTest
import Utils
import Combine

class MainScreenViewModelTests: XCTestCase {
    var sut: MainScreenViewModel!
    var navigation: MainScreenNavigationProtocolMock!
    var repository: AppRepositoryProtocolMock!
    var overlayManager: OverlayManagerMock!

    private var bag = Set<AnyCancellable>()

    override func setUpWithError() throws {
        try super.setUpWithError()

        navigation = .init()
        repository = .init()
        overlayManager = .init()

        Given(repository, .getExchangeRateForSelectedCurrency(selectedCurrency: .value(.HUF), willReturn: .mock))
        Given(repository, .getHufExchangeRate(willReturn: .mock))

        sut = .init(
            navigation: navigation,
            repository: repository,
            overlayManager: overlayManager
        )
    }

    func test_goToCreatorScreen_callOnGoToCreatorScreen() {
        // Given
        // When
        sut.goToCreatorScreen()
        // Then
        Verify(navigation, .once, .onGoToCreatorScreen)
    }

    func test_getExchangeRateForSelectedCurrency_changeExchangeRateList() async throws {
        // Given
        let expectation = self.expectation(description: "set exchangeRate value")
        sut.selectedCurrency = Currency.HUF.name
        let filterKnownAndSelectedCurrency = sut.filterKnownAndSelectedCurrency(items: ExchangeRateList.mock.rates)
        let inverseLessThanZeroValue = sut.inverseLessThanZeroValue(items: filterKnownAndSelectedCurrency)
        sut.$exchangeRate
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &bag)
        // When
        try await sut.getExchangeRateForSelectedCurrency()
        // Then
        await waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(sut.exchangeRate)
        XCTAssertEqual(sut.exchangeRate, inverseLessThanZeroValue)
    }
    
    func test_getHufExchangeRate_changeHufExchangeRate() async throws {
        // Given
        let expectation = self.expectation(description: "set HufExchangeRate value")
        let filteredItems = HufExchangeRateList.mock.items.filter { Currency.allCases.contains(Currency(from: $0.currency)) }
        sut.$hufExchangeRate
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &bag)
        // When
        try await sut.getHufExchangeRate()
        // Then
        await waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(sut.hufExchangeRate)
        XCTAssertEqual(sut.hufExchangeRate, filteredItems)
    }
    
    func test_inverseLessThanZeroValue() throws {
        // Given
        let initialItems: [String: Double] = [
            "First": 0.1,
            "Second": 1,
            "Third": 1.2
        ]
        // When
        let items = sut.inverseLessThanZeroValue(items: initialItems)
        // Then
        let mappedItems: [String: Double] = [
            "First": 10,
            "Second": 1,
            "Third": 1.2
        ]
        XCTAssertNotEqual(items, initialItems)
        XCTAssertEqual(items, mappedItems)
    }
    
    func test_filterKnownAndSelectedCurrency() throws {
        // Given
        let initialItems: [String: Double] = [
            "HUF": 0.1,
            "EUR": 1,
            "USD": 1.2,
            "RandomUnknownCurrency": 2.2,
        ]
        sut.selectedCurrency = Currency.HUF.name
        // When
        let items = sut.filterKnownAndSelectedCurrency(items: initialItems)
        // Then
        let mappedItems: [String: Double] = [
            "EUR": 1,
            "USD": 1.2
        ]
        XCTAssertNotEqual(items, initialItems)
        XCTAssertEqual(items, mappedItems)
    }
}
