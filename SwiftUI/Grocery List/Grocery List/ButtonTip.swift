//
//  Tip.swift
//  Grocery List
//
//  Created by Private on 08/05/2025.
//

import Foundation
import TipKit

struct ButtonTip: Tip{
    var title: Text = Text("Essential Foods")
    var message: Text? = Text("Add some everday items to the shopping list.")
    var image: Image? = Image(systemName: "info.circle")
    
}
