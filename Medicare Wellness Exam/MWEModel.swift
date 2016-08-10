//
//  MWEModel.swift
//  Medicare Wellness Exam
//
//  Created by Fool on 8/2/16.
//  Copyright © 2016 Fulgent Wake. All rights reserved.
//

import Cocoa

func processButtons(buttons:[NSButton], verbiage:[String]) -> String {
	var finalString = String()
	var stringArray = [String]()
	
	for (index, button) in buttons.enumerated() {
		if button.state == NSOnState {
			stringArray.append(verbiage[index])
		}
	}
	
	if !stringArray.isEmpty {
		finalString = stringArray.joined(separator: "\n")
	}
	
	return finalString
}

func processTextFields(fields:[NSTextField], verbiage:[String]) -> String {
	var finalString = String()
	var stringArray = [String]()
	
	for (index, field) in fields.enumerated() {
		if field.stringValue != "" {
			stringArray.append(verbiage[index])
		}
	}
	
	if !stringArray.isEmpty {
		finalString = stringArray.joined(separator: "\n")
	}
	
	return finalString
	
}

func clearControllersOnWWEForm(buttons:[NSButton], fields:[NSTextField]) {
	for button in buttons {
		button.state = NSOffState
	}
	for field in fields {
		field.stringValue = ""
	}
}
