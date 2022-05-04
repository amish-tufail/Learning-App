//
//  JSONParsing.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import Foundation
import SwiftUI

class JSONParsing{
    static func fetchDetail() -> [Result] {
        let path = Bundle.main.path(forResource: "QuizDetail", ofType: "json")
        
        guard path != nil else {
            return [Result]()
        }
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                let QuizData = try decoder.decode([Result].self, from: data)
                for idValue in QuizData {
                    idValue.id = UUID()
                }
                return QuizData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return [Result]()
    }
}
