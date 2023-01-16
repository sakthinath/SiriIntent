//
//  IntentHandler.swift
//  SiriDemo
//
//  Created by Admin on 28/08/22.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        guard intent is SiriDemoIntent else {
            fatalError("unhandled Intent error: \(intent)")
        }
        return SiriIntentHandler()
    }
    
}
class SiriIntentHandler:NSObject, SiriDemoIntentHandling {
    func handle(intent: SiriDemoIntent, completion: @escaping (SiriDemoIntentResponse) -> Void) {
        if intent.mesaage != nil{
            if intent.deviceType != .unknown {
                    completion(SiriDemoIntentResponse.init(code: .success, userActivity: nil))
                
            }
        }
    }
    func resolveMesaage(for intent: SiriDemoIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let message = intent.mesaage {
            completion(INStringResolutionResult.success(with: message))
        }
        completion(INStringResolutionResult.needsValue())
    }
    func resolveDeviceType(for intent: SiriDemoIntent, with completion: @escaping (DeviceTypeResolutionResult) -> Void) {
        if intent.deviceType == .unknown {
            completion(DeviceTypeResolutionResult.needsValue())
        }else{
            completion(DeviceTypeResolutionResult.success(with: intent.deviceType))
        }
    }
}
