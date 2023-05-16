//
//  BiometricLogin_AuthenticationFailureTests.swift
//  TABTestKit_ExampleUITests
//
//  Created by Kane Cheshire on 10/09/2019.
//  Copyright © 2019 Kin + Carta. All rights reserved.
//

import TABTestKit

// TODO: need to reset simulator
final class BiometricLogin_AuthenticationFailureTests: TABTestCase, SystemPreferencesContext {
    
    override func preLaunchSetup(_ launch: @escaping () -> Void) {
        //resetAllPrivacyPrompts()
        launch()
    }

    func test_see_faec_id_prompt() {
        Scenario("Seeing the Face ID permissions prompt") {
            Given(I: see(biometricLoginScreen))
            And(deviceBiometricsAreEnabled)
            When(I: tap(biometricLoginScreen.logInButton))
            Then(I: see(biometricLoginScreen.faceIDPermissionAlert))
        }
    }
    
    func test_authentication_fail() {
        Scenario("Allowing permission but failing authentication") {
            Given(I: see(biometricLoginScreen.faceIDPermissionAlert))
            And(I: tap("OK", in: biometricLoginScreen.faceIDPermissionAlert))
            When(I: failToAuthenticateBiometrics)
            Then(I: see(biometricLoginScreen.faceNotRecognizedAlert))
        }
    }
    
    func test_cancel_face_id() {
        Scenario("Cancelling Face ID") {
            Given(I: see(biometricLoginScreen.faceNotRecognizedAlert))
            When(I: dismiss(biometricLoginScreen.faceNotRecognizedAlert))
            And(I: doNotSee(biometricLoginScreen.faceNotRecognizedAlert))
            Then(I: see(biometricLoginScreen.biometricsFailedAlert))
        }
    }
    
    func test_dismiss_fail_biometrics_alert() {
        Scenario("Dismissing failure alert") {
            Given(I: see(biometricLoginScreen.biometricsFailedAlert))
            When(I: dismiss(biometricLoginScreen.biometricsFailedAlert))
            Then(I: see(biometricLoginScreen))
            And(I: doNotSee(tableScreen))
        }
    }
    
}
