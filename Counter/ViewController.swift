//
//  ViewController.swift
//  Counter
//
//  Created by Pavel on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var counterValue: Int = 0
    
    @IBAction private func buttonDidTap(_ sender: Any) {
        counterValue += 1
        updateCounterValue()
        addNote(buttonType: "plus")
    }
    
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        counterValue += 1
        updateCounterValue()
        addNote(buttonType: "plus")
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if counterValue != 0 {
            counterValue -= 1
            updateCounterValue()
            addNote(buttonType: "minusSuccess")
        }
        else {
            addNote(buttonType: "minusError")
        }
    }
    
    @IBAction private func deleteButton(_ sender: Any) {
        counterValue = 0
        updateCounterValue()
        addNote(buttonType: "delete")
    }
    
    private func updateCounterValue() {
        let counterLabelPattern: String = "Значение счётчика: "
        counterLabel.text = counterLabelPattern + String(counterValue)
    }
    
    private func addNote(buttonType: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: date)
        
        switch buttonType {
        case "plus":
            noteTextView.text += "\n" + "[\(dateString)]: значение изменено на +1"
        case "minusSuccess":
            noteTextView.text += "\n" + "[\(dateString)]: значение изменено на -1"
        case "delete":
            noteTextView.text += "\n" + "[\(dateString)]: значение сброшено"
        case "minusError":
            noteTextView.text += "\n" + "[\(dateString)]: попытка уменьшить значение счётчика ниже 0"
        default:
            return
        }
    }
}
