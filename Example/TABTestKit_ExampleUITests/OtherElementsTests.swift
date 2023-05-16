//
//  OtherElementsTests.swift
//  TABTestKit_ExampleUITests
//
//  Created by Kane Cheshire on 11/09/2019.
//  Copyright © 2019 Kin + Carta. All rights reserved.
//

import TABTestKit

final class OtherElementsTests: TABTestCase, SystemPreferencesContext {
    
    override func preLaunchSetup(_ launch: @escaping () -> Void) {
        //resetAllPrivacyPrompts()
        App.shared.launchEnvironment["TZ"] = "UTC"
        launch()
        login_and_goes_to_other_elements_view()
    }
    
    private func login_and_goes_to_other_elements_view() {
        Scenario("Navigating to the screen with other elements") {
            Given(I: complete(biometricLoginScreen))
            And(I: see(tabBarScreen))
            When(I: tap(tabBarScreen.otherTabBarButton))
            Then(I: see(otherElementsScreen))
            And(the: label(of: otherElementsScreen.trait, is: "Other elements"))
        }
    }
        
    func test_show_share_sheet() {
        Scenario("Show share sheet") {
            Given(I: see(otherElementsScreen))
            And(I: see(otherElementsScreen.label))
            And(I: see(otherElementsScreen.button))
            When(I: tap(otherElementsScreen.button))
            Then(I: see(otherElementsScreen.shareSheet))
        }
    }
        
    func test_dismiss_share_sheet() {
        Scenario("Dismiss share sheet") {
            test_show_share_sheet()
            Given(I: see(otherElementsScreen.shareSheet))
            When(I: dismiss(otherElementsScreen.shareSheet))
            Then(I: doNotSee(otherElementsScreen.shareSheet))
            And(I: see(otherElementsScreen))
        }
    }
        
    func test_show_alert_message() {
        Scenario("Show alert message") {
            Given(I: see(otherElementsScreen.alertButton))
            And(I: tap(otherElementsScreen.alertButton))
            Then(I: see(otherElementsScreen.alert))
            And(the: message(in: otherElementsScreen.alert, is: "Alert message"))
            When(I: tap(otherElementsScreen.alert.dismissButton))
            Then(I: see(otherElementsScreen))
        }
    }
    
    func test_dismiss_alert() {
        Scenario("Dismiss the alert") {
            test_show_alert_message()
            Given(I: see(otherElementsScreen.alert))
            When(I: tap(otherElementsScreen.alert.dismissButton))
            Then(I: see(otherElementsScreen))
        }
    }
    
    func test_segmented_control() {
        Scenario("Seeing and interacting with the segmented control") {
            Given(I: see(otherElementsScreen.segmentedControl))
            Then(I: tap(otherElementsScreen.segmentedControl.button(withID: "Second")))
            And(the: state(of: otherElementsScreen.segmentedControl.button(withID: "First"), isNot: .selected))
            And(the: state(of: otherElementsScreen.segmentedControl.button(withID: "Second"), is: .selected))
            And(I: tap(otherElementsScreen.segmentedControl.button(withID: "Third")))
            And(the: state(of: otherElementsScreen.segmentedControl.button(withID: "Second"), isNot: .selected))
            And(the: state(of: otherElementsScreen.segmentedControl.button(withID: "Third"), is: .selected))
        }
    }
        
    func test_text_field() {
        Scenario("Seeing and interacting with the text field") {
            Given(I: see(otherElementsScreen.textField))
            And(the: state(of: otherElementsScreen.textField, isNot: .hasKeyboardFocus))
            Then(I: tap(otherElementsScreen.textField))
            And(the: state(of: otherElementsScreen.textField, is: .hasKeyboardFocus))
            And(I: type("Hello world", into: otherElementsScreen.textField))
            And(the: value(of: otherElementsScreen.textField, is: "Hello world"))
            And(the: keyboardType(is: .regular))
        }
    }
        
    func test_number_pad_keyboard() {
        Scenario("Number pad keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.numberPadTextField, is: .hittable))
            When(I: tap(otherElementsScreen.numberPadTextField))
            Then(the: state(of: otherElementsScreen.numberPadTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .numberPad))
        }
    }
     
    func test_decimal_pad_keyboard() {
        Scenario("Decimal pad keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.decimalPadTextField, is: .hittable))
            When(I: tap(otherElementsScreen.decimalPadTextField))
            Then(the: state(of: otherElementsScreen.decimalPadTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .decimalPad))
        }
    }
        
    func test_email_pad_keyboard() {
        Scenario("Email address keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.emailAddressTextField, is: .hittable))
            When(I: tap(otherElementsScreen.emailAddressTextField))
            Then(the: state(of: otherElementsScreen.emailAddressTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .emailAddress))
        }
    }
    
    func test_numbers_and_punctuation_keyboard() {
        Scenario("Numbers and punctuation keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.numbersAndPunctuationTextField, is: .hittable))
            When(I: tap(otherElementsScreen.numbersAndPunctuationTextField))
            Then(the: state(of: otherElementsScreen.numbersAndPunctuationTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .numbersAndPunctuation))
        }
    }
     
    func test_phone_pad_keyboard() {
        Scenario("Phone pad keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.phonePadTextField, is: .hittable))
            When(I: tap(otherElementsScreen.phonePadTextField))
            Then(the: state(of: otherElementsScreen.phonePadTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .phonePad))
        }
    }
    
    func test_twitter_keyboard() {
        Scenario("Twitter keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.twitterTextField, is: .hittable))
            When(I: tap(otherElementsScreen.twitterTextField))
            Then(the: state(of: otherElementsScreen.twitterTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .twitter))
        }
    }
     
    func test_url_keyboard() {
        Scenario("URL keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.urlTextField, is: .hittable))
            When(I: tap(otherElementsScreen.urlTextField))
            Then(the: state(of: otherElementsScreen.urlTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .url))
        }
    }
     
    func test_web_search_keyboard() {
        Scenario("Web search keyboard type") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.webSearchTextField, is: .hittable))
            When(I: tap(otherElementsScreen.webSearchTextField))
            Then(the: state(of: otherElementsScreen.webSearchTextField, is: .hasKeyboardFocus))
            And(the: keyboardType(is: .webSearch))
        }
    }
    
    func test_secure_text_field() {
        Scenario("Seeing and interacting with the secure text field") {
            Given(I: see(otherElementsScreen.secureTextField))
            And(the: state(of: otherElementsScreen.secureTextField, isNot: .hasKeyboardFocus))
            Then(I: tap(otherElementsScreen.secureTextField))
            And(the: state(of: otherElementsScreen.secureTextField, is: .hasKeyboardFocus))
            And(I: type("Password!", into: otherElementsScreen.secureTextField))
            And(the: value(of: otherElementsScreen.secureTextField, is: "•••••••••"))
        }
    }
        
    func test_slider() {
        Scenario("Seeing and interacting with the slider") {
            //Given(I: tap(keyboard.key("return", isActuallyButton: true)))
            Given(I: see(otherElementsScreen.slider))
            When(I: adjust(otherElementsScreen.slider, to: 1))
            Then(I: adjust(otherElementsScreen.slider, to: 0))
        }
    }
     
    func test_switch() {
        Scenario("Seeing and interacting with the switch") {
            Given(I: see(otherElementsScreen.toggle))
            And(the: value(of: otherElementsScreen.toggle, is: .on))
            Then(I: adjust(otherElementsScreen.toggle, to: .off))
            And(the: value(of: otherElementsScreen.toggle, is: .off))
        }
    }
     
    func test_stepper() {
        Scenario("Seeing and interacting with the stepper") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.stepper, is: .visible))
            And(the: state(of: otherElementsScreen.stepper.decrementButton, isNot: .enabled))
            And(the: state(of: otherElementsScreen.stepper.incrementButton, is: .enabled))
            Then(I: tap(otherElementsScreen.stepper.incrementButton))
            And(the: state(of: otherElementsScreen.stepper.decrementButton, is: .enabled))
            And(the: state(of: otherElementsScreen.stepper.incrementButton, is: .enabled))
            And(I: tap(otherElementsScreen.stepper.incrementButton))
            And(the: state(of: otherElementsScreen.stepper.decrementButton, is: .enabled))
            And(the: state(of: otherElementsScreen.stepper.incrementButton, isNot: .enabled))
        }
    }
     
    func test_page_indicator() {
        Scenario("Seeing and interacting with the page indicator") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.pageIndicator, is: .visible))
            Then(the: value(of: otherElementsScreen.pageIndicator, is: "page 1 of 3"))
        }
    }
     
    func test_image() {
        Scenario("Seeing the image") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.picker, is: .visible))
            When(I: see(otherElementsScreen.image))
            Then(the: value(of: otherElementsScreen.image, is: "Ottoman"))
        }
    }
     
    func test_picker() {
        Scenario("Seeing and interacting with the picker") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.picker, is: .visible))
            And(the: value(of: otherElementsScreen.picker.wheel(0), is: "Hello"))
            When(I: adjust(otherElementsScreen.picker.wheel(0), to: "World"))
            Then(the: value(of: otherElementsScreen.picker.wheel(0), is: "World"))
        }
    }
     
    func test_time_picker_hours() {
        Scenario("Seeing and interacting with the time picker") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.timePicker, is: .visible))
            And(I: see(otherElementsScreen.timePicker))
            And(the: value(of: otherElementsScreen.timePicker.wheel(0), is: "9 o’clock"))
            When(I: adjust(otherElementsScreen.timePicker.wheel(0), to: "10"))
            Then(the: value(of: otherElementsScreen.timePicker.wheel(0), is: "10 o’clock"))
        }
    }
     
    func test_time_picker_mins() {
        Scenario("Interacting with the time picker for minutes") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.timePicker, is: .visible))
            And(the: value(of: otherElementsScreen.timePicker.wheel(1), is: "41 minutes"))
            When(I: adjust(otherElementsScreen.timePicker.wheel(1), to: "42"))
            Then(the: value(of: otherElementsScreen.timePicker.wheel(1), is: "42 minutes"))
        }
    }
        
     
    func test_time_picker_period() {
        Scenario("Interacting with the time picker for period") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.timePicker, is: .visible))
            And(the: value(of: otherElementsScreen.timePicker.wheel(2), is: "AM"))
            When(I: adjust(otherElementsScreen.timePicker.wheel(2), to: "PM"))
            Then(the: value(of: otherElementsScreen.timePicker.wheel(2), is: "PM"))
        }
    }
     
    func test_date_picker_month() {
        Scenario("Seeing and interacting with the date picker") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.datePicker, is: .visible))
            And(I: see(otherElementsScreen.datePicker))
            And(the: value(of: otherElementsScreen.datePicker.wheel(0), is: "January"))
            When(I: adjust(otherElementsScreen.datePicker.wheel(0), to: "February"))
            Then(the: value(of: otherElementsScreen.datePicker.wheel(0), is: "February"))
        }
    }
     
    func test_date_picker_day() {
        Scenario("Interacting with the date picker for day") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.datePicker, is: .visible))
            And(the: value(of: otherElementsScreen.datePicker.wheel(1), is: "9"))
            When(I: adjust(otherElementsScreen.datePicker.wheel(1), to: "10"))
            Then(the: value(of: otherElementsScreen.datePicker.wheel(1), is: "10"))
        }
    }
    
    func test_date_picker_year() {
        Scenario("Interacting with the date picker for year") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.datePicker, is: .visible))
            And(the: value(of: otherElementsScreen.datePicker.wheel(2), is: "2007"))
            When(I: adjust(otherElementsScreen.datePicker.wheel(2), to: "2020"))
            Then(the: value(of: otherElementsScreen.datePicker.wheel(2), is: "2020"))
        }
    }
    
    func test_date_time_picker_date() {
        Scenario("Seeing and interacting with the date time picker") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.dateTimePicker, is: .visible))
            And(I: see(otherElementsScreen.datePicker))
            And(the: value(of: otherElementsScreen.dateTimePicker.wheel(0), is: "Tue, Jan 9"))
            When(I: adjust(otherElementsScreen.dateTimePicker.wheel(0), to: "Jan 10"))
            Then(the: value(of: otherElementsScreen.dateTimePicker.wheel(0), is: "Wed, Jan 10"))
        }
    }
    
    func test_date_time_picker_hour() {
        Scenario("Interacting with the date time picker for hour") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.dateTimePicker, is: .visible))
            And(the: value(of: otherElementsScreen.dateTimePicker.wheel(1), is: "9 o’clock"))
            When(I: adjust(otherElementsScreen.dateTimePicker.wheel(1), to: "10"))
            Then(the: value(of: otherElementsScreen.dateTimePicker.wheel(1), is: "10 o’clock"))
        }
    }
     
    func test_date_time_picker_minutes() {
        Scenario("Interacting with the date time picker for minute") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.dateTimePicker, is: .visible))
            And(the: value(of: otherElementsScreen.dateTimePicker.wheel(2), is: "41 minutes"))
            When(I: adjust(otherElementsScreen.dateTimePicker.wheel(2), to: "42"))
            Then(the: value(of: otherElementsScreen.dateTimePicker.wheel(2), is: "42 minutes"))
        }
    }
     
    func test_date_time_picker_period() {
        Scenario("Interacting with the date time picker for period") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.dateTimePicker, is: .visible))
            And(the: value(of: otherElementsScreen.dateTimePicker.wheel(3), is: "AM"))
            When(I: adjust(otherElementsScreen.dateTimePicker.wheel(3), to: "PM"))
            Then(the: value(of: otherElementsScreen.dateTimePicker.wheel(3), is: "PM"))
        }
    }

    func test_countdown_picker_hour() {
        Scenario("Seeing and interacting with the count down timer picker") {
            Given(I: scroll(otherElementsScreen, .from(CGVector(dx: 0.95, dy: 0.8), to: CGVector(dx: 0.95, dy: 0.3)), until: otherElementsScreen.countdownTimerPicker, is: .visible)) // We need to scroll down on the edge of the screen, otherwise it will scroll one of the picker.
            And(I: see(otherElementsScreen.countdownTimerPicker))
            And(the: value(of: otherElementsScreen.countdownTimerPicker.wheel(0), is: "0 hours"))
            When(I: adjust(otherElementsScreen.countdownTimerPicker.wheel(0), to: "1"))
            Then(the: value(of: otherElementsScreen.countdownTimerPicker.wheel(0), is: "1 hour"))
        }
    }
    
    func test_countdown_picker_minutes() {
        Scenario("Interacting with the date time picker for hour") {
            Given(I: scroll(otherElementsScreen, .downwards, until: otherElementsScreen.countdownTimerPicker, is: .visible))
            And(the: value(of: otherElementsScreen.countdownTimerPicker.wheel(1), is: "1 min"))
            When(I: adjust(otherElementsScreen.countdownTimerPicker.wheel(1), to: "59"))
            Then(the: value(of: otherElementsScreen.countdownTimerPicker.wheel(1), is: "59 min"))
        }
    }
    
}


