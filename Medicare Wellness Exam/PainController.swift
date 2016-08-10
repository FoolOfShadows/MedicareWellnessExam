//
//  PainController.swift
//  Medicare Wellness Exam
//
//  Created by Fool on 8/3/16.
//  Copyright © 2016 Fulgent Wake. All rights reserved.
//

import Cocoa

class PainController: NSViewController, NSTextFieldDelegate, NSTextDelegate {

	@IBOutlet weak var averageWeeklyPain: NSTextField!
	@IBOutlet weak var enjoyment: NSTextField!
	@IBOutlet weak var activity: NSTextField!
	@IBOutlet weak var pegScore: NSTextField!

	override func awakeFromNib() {
		averageWeeklyPain.delegate = self
		enjoyment.delegate = self
		activity.delegate = self
		Swift.print("The view has loaded")
	}
	
	private var displayedTotal:Double {
		get {
			return Double(pegScore.stringValue)!
		}
		set {
			pegScore.stringValue = String(newValue)
		}
	}
	
	override func controlTextDidChange(_ obj: Notification) {
		calculatePEGScore()
	}
	
	@IBAction func takeAverageWeeklySlider(_ sender: NSSlider) {
		averageWeeklyPain.doubleValue = sender.doubleValue
		calculatePEGScore()
	}

	@IBAction func takeEnjoymentSlider(_ sender: NSSlider) {
		enjoyment.doubleValue = sender.doubleValue
		calculatePEGScore()
	}
	
	@IBAction func takeActivitySlider(_ sender: NSSlider) {
		activity.doubleValue = sender.doubleValue
		calculatePEGScore()
	}
	
	func calculatePEGScore() {
		if let weeklyValue = Double(averageWeeklyPain.stringValue), enjoymentValue = Double(enjoyment.stringValue), activityValue = Double(activity.stringValue) {
			let totalSum:Double = weeklyValue + enjoymentValue + activityValue
			pegScore.stringValue = String(format: "%.1f", totalSum/3) + "/10"
		}
	}
	
	@IBAction func takeProcess(_ sender: NSButton) {
		let finalResult = "Patient's PEG score is \(pegScore.stringValue)"
		let pasteBoard = NSPasteboard.general()
		pasteBoard.clearContents()
		pasteBoard.setString(finalResult, forType: NSPasteboardTypeString)
		Swift.print(finalResult)
	}
	
	@IBAction func takeClear(_ sender: NSButton) {
	}
	
}
