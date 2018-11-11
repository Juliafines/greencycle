//
//  SurveyTask.swift
//  Greencycle
//
//  Created by Julia Iiuaavi on 11/10/18.
//  Copyright © 2018 Julia Iiuaavi. All rights reserved.
//

import Foundation
import ResearchKit
public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Questionnaire"
    instructionStep.text = "These questions will help us understand your lifestyle better and guide you on your way to better sustainability."
    steps += [instructionStep]
    
    
    //    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 30)
    //    nameAnswerFormat.multipleLines = false
    //    let nameQuestionStepTitle = "How much do you pay for electricity per month in $?"
    //    let nameQuestionStep = ORKQuestionStep(identifier: "EQuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    //    steps += [nameQuestionStep]
    
    //1. COUNTRY
    let countryQuestionStepTitle = "Where do you live?"
    let countryChoices = [
        ORKTextChoice(text: "United States", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Canada", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Ireland", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let countryAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: countryChoices)
    let countryQuestionStep = ORKQuestionStep(identifier: "CountryTextChoiceQuestionStep", title: countryQuestionStepTitle, answer: countryAnswerFormat)
    steps += [countryQuestionStep]
    
    
    
    //2. HOUSEHOLD SIZE
    let questQuestionStepTitle = "What is your household size?"
    let textChoices = [
        ORKTextChoice(text: "1-2 people", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "3-4 people", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "5 or more people", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "HHTextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]
    
    
    //3. HOUSEHOLD TYPE
    let hhsizeQuestionStepTitle = "What kind of home are you living in?"
    let hhsizeTuples = [
        (UIImage(named: "house")!, "House"),
        (UIImage(named: "apartment")!, "Apartment"),
        ]
    let hhsizeChoices : [ORKImageChoice] = hhsizeTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    let hhsizeAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: hhsizeChoices)
    let hhsizeQuestionStep = ORKQuestionStep(identifier: "HHSizeChoiceQuestionStep", title: hhsizeQuestionStepTitle, answer: hhsizeAnswerFormat)
    steps += [hhsizeQuestionStep]
    
    
    //4. ELECTRICITY
    let electricityAnswerFormat = ORKTextAnswerFormat(maximumLength: 30)
    electricityAnswerFormat.multipleLines = false
    let electricityQuestionStepTitle = "How much do you pay for electricity per month in $?"
    let electricityQuestionStep = ORKQuestionStep(identifier: "EQuestionStep", title: electricityQuestionStepTitle, answer: electricityAnswerFormat)
    steps += [electricityQuestionStep]
    
    //5. WATER
    let waterAnswerFormat = ORKTextAnswerFormat(maximumLength: 30)
    waterAnswerFormat.multipleLines = false
    let waterQuestionStepTitle = "How much do you pay for water per month in $?"
    let waterQuestionStep = ORKQuestionStep(identifier: "WQuestionStep", title: waterQuestionStepTitle, answer: waterAnswerFormat)
    steps += [waterQuestionStep]
    
    
    //6. COMMUTING
    let transportQuestionStepTitle = "Tell us about your commuting habits!"
    let transportChoices = [
        ORKTextChoice(text: "By car", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "By bus/metro", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Walking/cycling", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let transportAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: transportChoices)
    let transportQuestionStep = ORKQuestionStep(identifier: "TransportTextChoiceQuestionStep", title: transportQuestionStepTitle, answer: transportAnswerFormat)
    steps += [transportQuestionStep]
    
    
    //    //image question
    //    let colorQuestionStepTitle = "What is your favorite color?"
    //    let colorTuples = [
    //        (UIImage(named: "red")!, "Red"),
    //        (UIImage(named: "orange")!, "Orange"),
    //        (UIImage(named: "yellow")!, "Yellow"),
    //        (UIImage(named: "green")!, "Green"),
    //        (UIImage(named: "blue")!, "Blue"),
    //        (UIImage(named: "purple")!, "Purple")
    //    ]
    //    let imageChoices : [ORKImageChoice] = colorTuples.map {
    //        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    //    }
    //    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: imageChoices)
    //    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
    //    steps += [colorQuestionStep]
    
    //summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thanks!"
    summaryStep.text = "That was easy"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}

