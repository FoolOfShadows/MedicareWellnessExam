//
//  MemoryModel.swift
//  Medicare Wellness Exam
//
//  Created by Fool on 8/19/16.
//  Copyright © 2016 Fulgent Wake. All rights reserved.
//

import Cocoa

enum YesNo:String {
	case Yes
	case No
	case DontKnow
}


enum MemoryQuestions {
	case Remembering
	case BetterWorse
	case ForgettingNames
	case RecentEvents
	case Words
	case Misplacing
	case History
	case Smoker
	case Drinker
	case Coffee
	case Disease
	case Medication
	
	var fullQuestion: String {
		switch self {
			case .Remembering: return "How often do you have trouble remembering things?"
			case .BetterWorse: return "Is your memory worse than it was 10 years ago?"
			case .ForgettingNames: return "Are you forgetting names on a more regular basis?"
			case .RecentEvents: return "Do you have trouble remember recent events?"
			case .Words: return "Are you regularly searching for words when speaking to someone?"
			case .Misplacing: return "Are you misplacing items more often than usual?"
			case .History: return "Is there a family history of severe memory problems?"
			case .Smoker: return "Do you currently smoke, or have you in a lifetime smoked greater than 20 cigarettes per day for 20 years?"
			case .Drinker: return "Do you currently drink greater than 2 alcoholic drinks per day, for a man, or 1 per day for a woman?"
			case .Coffee: return "Do you drink more than 4 cups of coffee a day?"
			case .Disease: return "Do you suffer from some chronic diseases such as diabetes, hypothyroidism, atrophic gastric, stomach or intestinal resections, Crohn's, or colitis?"
			case .Medication: return "Do you take certain drugs, such as antiepileptic drugs, colchicine, metforminmethotrexate, sulphasalazine, L-dopa, fenofibrates, niacin, & NSAIDS, or any PPIs which have been shown to reduce the absorption of folate?"
		}
	}

}

struct TroubleRemembering {
	let never:NSButton
	let rarely:NSButton
	let sometimes:NSButton
	let often:NSButton
	let veryOften:NSButton
	
	var selections:[NSButton] {return [never, rarely, sometimes, often, veryOften]}
	
	func processTroubleRemembering() -> String {
		var results = String()
		
		for selection in selections {
			if selection.state == NSOnState {
				results = "\(MemoryQuestions.Remembering.fullQuestion) - \(selection.title)"
			}
		}
		
		return results
	}
	
	func clearTroubleRemembering() {
		for selection in selections {
			selection.state = NSOffState
		}
	}
}

struct MemoryWorse {
	var muchBetter:NSButton
	var littleBetter:NSButton
	var theSame:NSButton
	var littleWorse:NSButton
	var muchWorse:NSButton
	
	var selections:[NSButton] {return [muchBetter, littleBetter, theSame, littleWorse, muchWorse]}
	
	func processMemoryWorse() -> String {
		var results = String()
		
		for selection in selections {
			if selection.state == NSOnState {
				results = "\(MemoryQuestions.BetterWorse.fullQuestion) - \(selection.title)"
			}
		}
		
		return results
	}
	
	func clearMemoryWorse() {
		for selection in selections {
			selection.state = NSOffState
		}
	}
}

struct YesNoQuestion {
	let question: MemoryQuestions
	let yesButton:NSButton
	let noButton:NSButton
	let dontKnowButton:NSButton?
	
	var selections:[NSButton?] {return [yesButton, noButton, dontKnowButton]}
	
	func processYesNoQuestion() -> String {
		var results = String()
		
		for selection in selections {
			if let selection = selection {
				if selection.state == NSOnState {
					results = "\(question.fullQuestion) - \(selection.title)"
				}
			}
		}
		return results
	}
	
	func clearYesNoQuestion() {
		for selection in selections {
			if let selection = selection {
				selection.state = NSOffState
			}
		}
	}
}

func processYesNoArray(array:[YesNoQuestion]) -> String {
	var resultsArray = [String]()
	var results = String()
	
	for item in array {
		let itemResult = item.processYesNoQuestion()
		if !itemResult.isEmpty {
			resultsArray.append(itemResult)
		}
	}
	
	if !resultsArray.isEmpty {
		results = resultsArray.joined(separator: "\n")
	}
	
	return results
}












