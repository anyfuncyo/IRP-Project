//
//  CollectionViewTests.swift
//  TABTestKit_ExampleUITests
//
//  Created by Kane Cheshire on 11/10/2019.
//  Copyright © 2019 Kin + Carta. All rights reserved.
//

import TABTestKit

final class CollectionViewTests: TABTestCase, SystemPreferencesContext {
    
    override func preLaunchSetup(_ launch: @escaping () -> Void) {
        //resetAllPrivacyPrompts()
        launch()
        login_in_and_go_to_collection_view()
    }
      
    func test_collectionView_refresh() {
        Scenario("Refreshing the collection view screen") {
            Given(I: see(collectionViewScreen))
            When(I: refresh(collectionViewScreen))
            Then(the: state(of: collectionViewScreen.firstCell, is: .visible))
        }
    }
    
    func test_collectionView_scrolling_up() {
        Scenario("Scrolling until the last cell exists") {
            Given(the: state(of: collectionViewScreen.firstCell, is: .visible))
            When(I: scroll(collectionViewScreen, .from(.middle, to: .top), until: collectionViewScreen.lastCell, is: .exists, .visibleIn(collectionViewScreen.trait)))
            Then(the: state(of: collectionViewScreen.lastCell, is: .exists))
        }
    }
    
    func test_collectionView_scrolling_down() {
        Scenario("Scrolling to hide and unhide first cell") {
            Given(the: state(of: collectionViewScreen.firstCell, is: .visible))
            When(I: scroll(collectionViewScreen, .from(.middle, to: .top), until: collectionViewScreen.firstCell, isNot: .exists))
            And(I: scroll(collectionViewScreen, .from(.middle, to: .bottom), until: collectionViewScreen.firstCell, is: .exists))
            Then(the: state(of: collectionViewScreen.firstCell, is: .exists))
        }
    }
    
    private func login_in_and_go_to_collection_view() {
        Scenario("Completing biometric login and tapping the collection tab bar button") {
            Given(I: complete(biometricLoginScreen))
            When(I: tap(tabBarScreen.collectionTabBarButton))
            Then(I: see(collectionViewScreen))
            And(the: label(of: collectionViewScreen.header, is: "Collection"))
        }
    }
    
}
