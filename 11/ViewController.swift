//
//  ViewController.swift
//  11
//
//  Created by Sergey Shaposhnik on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
  var isNewValue = true
  
  var currentAction: Actions?
  var previousAction: Actions?

  var firstValue = 0
  var secondValue = 0
  
  @IBOutlet weak var miltuplyButton: UIButton!
  @IBOutlet weak var minusButton: UIButton!
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var divideButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }

  @IBAction func handeEqual(_ sender: UIButton) {
    calculate()
    
    changeOpacity(sender: sender)
  }

  @IBAction func handleComma(_ sender: Any) {
  }

  @IBAction func handlePlus(_ sender: UIButton) {
    currentAction = .plus
    previousAction = nil
    isNewValue = true
    firstValue = getIntegerFromLabel()
    
    activateAction(plusButton, sender: sender)
  }

  @IBAction func handleMinus(_ sender: UIButton) {
    currentAction = .minus
    previousAction = nil
    isNewValue = true
    firstValue = getIntegerFromLabel()
    
    activateAction(minusButton, sender: sender)
  }
  
  @IBAction func handleMultiply(_ sender: UIButton) {
    currentAction = .multiply
    previousAction = nil
    isNewValue = true
    firstValue = getIntegerFromLabel()
    
    activateAction(miltuplyButton, sender: sender)
  }
  
  @IBAction func handleDivide(_ sender: UIButton) {
    currentAction = .divide
    previousAction = nil
    isNewValue = true
    firstValue = getIntegerFromLabel()
    
    activateAction(divideButton, sender: sender)
  }
  
  @IBAction func handleChangePolarity(_ sender: UIButton) {
    guard var safeText = resultLabel.text else { return }

    if safeText.contains("-") {
      safeText = safeText.replacingOccurrences(of: "-", with: "")
      resultLabel.text = safeText

      return
    }
    
    safeText = "-\(safeText)"

    resultLabel.text = safeText
    
    changeOpacity(sender: sender)
  }
  
  @IBAction func handlePersent(_ sender: Any) {
  }
  
  @IBAction func handleReset(_ sender: UIButton) {
    currentAction = nil
    previousAction = nil
    isNewValue = true
    firstValue = 0
    secondValue = 0
    resultLabel.text = "0"
    
    resetActions()
    changeOpacity(sender: sender)
  }
  
  
  @IBAction func handleZero(_ sender: UIButton) {
    updateLabel(with: "0", sender: sender)
  }

  @IBAction func handleOne(_ sender: UIButton) {
    updateLabel(with: "1", sender: sender)
  }
  
  @IBAction func handleTwo(_ sender: UIButton) {
    updateLabel(with: "2", sender: sender)
  }
  
  @IBAction func handleThree(_ sender: UIButton) {
    updateLabel(with: "3", sender: sender)
  }
  
  @IBAction func handleFour(_ sender: UIButton) {
    updateLabel(with: "4", sender: sender)
  }
  
  @IBAction func handleFive(_ sender: UIButton) {
    updateLabel(with: "5", sender: sender)
  }
  
  @IBAction func handleSix(_ sender: UIButton) {
    updateLabel(with: "6", sender: sender)
  }
  
  @IBAction func handleSeven(_ sender: UIButton) {
    updateLabel(with: "7", sender: sender)
  }
  
  @IBAction func handleEight(_ sender: UIButton) {
    updateLabel(with: "8", sender: sender)
  }
  
  @IBAction func handleNine(_ sender: UIButton) {
    updateLabel(with: "9", sender: sender)
  }

  func getIntegerFromLabel() -> Int {
    return Int(resultLabel.text ?? "0") ?? 0
  }

  func calculate() {
    guard let safeAction = currentAction else { return }

    if currentAction != previousAction {
      secondValue = getIntegerFromLabel()
    }

    firstValue = safeAction.makeAction(one: firstValue, two: secondValue )

    previousAction = currentAction
    resultLabel.text = "\(firstValue)"
    isNewValue = true
  }
  
  func updateLabel(with newValue: String, sender: UIButton) {
    if isNewValue {
      resultLabel.text = ""
      isNewValue = false
    }

    var digits = resultLabel.text ?? ""
    digits.append(newValue)

    if digits.count > 8 {
      return
    }

    resultLabel.text = digits
    
    changeOpacity(sender: sender)
  }
  
  func activateAction(_ button: UIButton, sender: UIButton) {
    resetActions()
    button.backgroundColor = .white
    button.tintColor = .systemOrange
    
    changeOpacity(sender: sender)
  }
  
  func resetActions() {
    minusButton.backgroundColor = .systemOrange
    plusButton.backgroundColor = .systemOrange
    divideButton.backgroundColor = .systemOrange
    miltuplyButton.backgroundColor = .systemOrange

    minusButton.tintColor = .white
    plusButton.tintColor = .white
    divideButton.tintColor = .white
    miltuplyButton.tintColor = .white
  }
  
  func changeOpacity(sender: UIButton) {
    sender.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      sender.alpha = 1.0
    }
  }
}

