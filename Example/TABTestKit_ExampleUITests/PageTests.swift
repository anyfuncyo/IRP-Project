//
//  PageTests.swift
//  TABTestKit_ExampleUITests
//
//  Created by Ben Gilroy on 10/07/2020.
//  Copyright © 2020 Kin + Carta. All rights reserved.
//

import TABTestKit

final class PageTests: TABTestCase {
    
    func test() {
        Scenario("Scroll page view") {
            login_and_goes_to_page_view()
            Given(I: see(pageScreen))
            When(I: scroll(pageScreen.scrollView, .right, until: pageScreen.pageIndicator, valueIs: "page 6 of 6"))
            Then(the: value(of: pageScreen.pageIndicator, is: "page 6 of 6"))
        }
    }
    
    private func login_and_goes_to_page_view() {
            Given(I: complete(biometricLoginScreen))
            And(I: see(tabBarScreen))
            When(I: tap(tabBarScreen.pageTabBarButton))
            Then(I: see(pageScreen))
    }
    
}
