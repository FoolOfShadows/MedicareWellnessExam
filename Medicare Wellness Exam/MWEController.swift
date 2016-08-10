//
//  MWEController.swift
//  Medicare Wellness Exam
//
//  Created by Fool on 8/2/16.
//  Copyright © 2016 Fulgent Wake. All rights reserved.
//

import Cocoa

class MWEController: NSView {
	
	@IBOutlet weak var visualAcuityLeftView: NSTextField!
	@IBOutlet weak var visualAcuityRightView: NSTextField!
	@IBOutlet weak var glassesView: NSButtonCell!
	@IBOutlet weak var contactsView: NSButtonCell!
	@IBOutlet weak var hearingDifficultiesYesCheckbox: NSButton!
	@IBOutlet weak var hearingDifficultiesNoCheckbox: NSButton!
	@IBOutlet weak var hearingLeftPassCheckbox: NSButton!
	@IBOutlet weak var hearingLeftFailCheckbox: NSButton!
	@IBOutlet weak var hearingRightPassCheckbox: NSButton!
	@IBOutlet weak var hearingRightFailCheckbox: NSButton!
	@IBOutlet weak var getUpAndGoYesCheckbox: NSButton!
	@IBOutlet weak var getUpAndGoNoCheckbox: NSButton!
	@IBOutlet weak var rugsYesCheckbox: NSButton!
	@IBOutlet weak var rugsNoCheckbox: NSButton!
	@IBOutlet weak var depressedYesCheckbox: NSButton!
	@IBOutlet weak var depressedNoCheckbox: NSButton!
	@IBOutlet weak var littleInterestYesCheckbox: NSButton!
	@IBOutlet weak var littleInterestNoCheckbox: NSButton!
	
	@IBOutlet weak var advanceDirectiveView: NSTextField!
	@IBOutlet weak var caregiverInputView: NSTextField!
	
	var buttonsArray: [NSButton] {return [hearingDifficultiesYesCheckbox, hearingDifficultiesNoCheckbox, getUpAndGoYesCheckbox, getUpAndGoNoCheckbox, rugsYesCheckbox, rugsNoCheckbox, depressedYesCheckbox, depressedNoCheckbox, littleInterestYesCheckbox, littleInterestNoCheckbox]}
	let buttonVerbiageArray: [String] = ["Patient has hearing difficulties", "Patient does not have hearing difficulties", "Get Up & Go test was unsteady or took longer than 30 seconds", "Get Up & Go test was steady and took less than 30 seconds", "The patient's home has rugs in the hallway, lacks grab bars in the bathroom, lacks handrails on the stars or has poor lighting", "The patient's home does not have rugs in the hallway, lack grab bars in the bathroom, lack handrails on the stars or have poor lighting", "During the past month the patient has often been bothered by feeling down, depressed, or hopeless", "During the past month the patient has not often been bothered by feeling down, depressed, or hopeless", "During the past month the patient has often been bothered by little interest or pleasure in doing things", "During the past month the patient has not often been bothered by little interest or pleasure in doing things"]
	var textArray: [NSTextField] {return [visualAcuityLeftView, visualAcuityRightView, advanceDirectiveView, caregiverInputView]}
	var textVerbiage: [String] {return ["Visual acuity left eye is 20/\(visualAcuityLeftView.stringValue)", "right eye is 20/\(visualAcuityRightView.stringValue)", "Advance directive discussion: \(advanceDirectiveView.stringValue)", "Patient family/caregiver input: \(caregiverInputView.stringValue)"]}
	
	
	@IBAction func processWWEForm(_ sender: NSButton) {
		var finalResults = String()
		let buttonResults = processButtons(buttons: buttonsArray, verbiage: buttonVerbiageArray)
		if !buttonResults.isEmpty {
			finalResults = "\(buttonResults)\n"
		}
		let textFieldResults = processTextFields(fields: textArray, verbiage: textVerbiage)
		if !textFieldResults.isEmpty {
			finalResults = finalResults + textFieldResults
		}
		
		let pasteBoard = NSPasteboard.general()
		pasteBoard.clearContents()
		pasteBoard.setString(finalResults, forType: NSPasteboardTypeString)
		Swift.print(finalResults)
	}
	
	@IBAction func clearWWEForm(_ sender: NSButton) {
		clearControllersOnWWEForm(buttons: buttonsArray, fields: textArray)
	}
}
