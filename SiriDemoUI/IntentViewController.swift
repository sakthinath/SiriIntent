//
//  IntentViewController.swift
//  SiriDemoUI
//
//  Created by Admin on 28/08/22.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        let intent = interaction.intent as! SiriDemoIntent
                if let content = intent.mesaage {
                  if intent.deviceType != .unknown {
        // get the values and Do the work What you need for the project
//                      api calls etc
                      print("content \(content)  deviceType \(intent.deviceType.rawValue)")
                      completion(true, parameters, self.desiredSize)
                      
                  }else {
                      completion(true, parameters, CGSize(width: UIScreen.main.bounds.width, height: 100))
                  }
                }
        
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
