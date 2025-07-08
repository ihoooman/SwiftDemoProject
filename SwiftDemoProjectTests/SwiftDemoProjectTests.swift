import Testing

@Suite("SwiftDemoProject Demo App Tests")
struct SwiftDemoProjectTests {

    @Test("Basic math works")
    func testAddition() async throws {
        let a = 2
        let b = 3
        #expect(a + b == 5, "Simple addition should work")
    }

    @Test("Toggle agreement state")
    func testAgreementToggle() async throws {
        var agreementAccepted = false
        agreementAccepted.toggle()
        #expect(agreementAccepted == true, "Toggling should set value to true")
    }

    @Test("Show next page by triggering state")
    func testShowNextPageState() async throws {
        var showNextPage = false
        showNextPage = true
        #expect(showNextPage, "showNextPage should be true after assignment")
    }
    
}
