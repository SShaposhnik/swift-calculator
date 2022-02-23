//
//  Constants.swift
//  11
//
//  Created by Sergey Shaposhnik on 23.02.2022.
//

import Foundation

enum ConstantsStrings {
    
}

enum Actions {
  case plus
  case minus
  case multiply
  case divide
  
  func makeAction(one: Int, two: Int) -> Int {
    if (two == 0) {
      return 0
    }

    switch self {
      case .plus:
        return one + two
      case .minus:
        return one - two
      case .multiply:
        return one * two
      case .divide:
        return one / two
    }
  }
}
