//
//  Constant.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/22.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

//let ITEM_KEY_LOTTO_NUMBER = "number"
//let ITEM_KEY_POSX = "posx"
//let ITEM_KEY_POSY = "posy"
//let ITEM_KEY_FONT_COLOR = "color"
//let ITEM_KEY_FONT_SIZE = "size"
//
//let HEIGHT_ROW: CGFloat = 160
//let GAP_CELL: CGFloat = 5

var DATE_LAST_DAY = 31
let DATE_LAST_YEAR = 2029

enum TYPE_LEVEL {
    case type_low
    case type_middle
    case type_high
}
var type: TYPE_LEVEL = TYPE_LEVEL.type_low
