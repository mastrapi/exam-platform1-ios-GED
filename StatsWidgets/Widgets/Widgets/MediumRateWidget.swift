//
//  SmallRateWidget.swift
//  StatsWidgetsExtension
//
//  Created by Andrey Chernyshev on 12.07.2021.
//

import WidgetKit
import SwiftUI

struct MediumRateWidget: Widget {
    let placeholder = StatsContent(date: Date(),
                                   passRate: 75,
                                   testTaken: 0,
                                   testsTakenNum: 10,
                                   correctAnswers: 0,
                                   correctAnswersNum: 374,
                                   questionsTaken: 0,
                                   answeredQuestions: 400)
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "MediumRateWidget", provider: Provider(placeholder: placeholder)) { entry in
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    PassRateView(title: "Widgets.PassRate".localized,
                                 progressFontSize: 19.scale,
                                 progress: entry.passRate / 100,
                                 titleColor: Color.make(239, green: 121, blue: 55),
                                 progressColor: Color.make(42, green: 77, blue: 93))
                    Spacer()
                    HStack() {
                        MediumVerticalRateView(count: entry.testsTakenNum,
                                               title: "Widgets.TestsTaken".localized,
                                               color: Color.make(239, green: 121, blue: 55))
                        Spacer()
                        MediumVerticalRateView(count: entry.correctAnswersNum,
                                               title: "Widgets.CorrectAnswers".localized,
                                               color: Color.make(42, green: 77, blue: 93))
                        Spacer()
                        MediumVerticalRateView(count: entry.answeredQuestions,
                                               title: "Widgets.QuestionsTaken".localized,
                                               color: Color.make(245, green: 179, blue: 102))
                    }
                }
                .padding(16)
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Widgets.Medium.Name".localized)
        .description("Widgets.Medium.Description".localized)
    }
}
