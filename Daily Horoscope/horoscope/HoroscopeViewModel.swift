//
//  HoroscopeViewModel.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 19/6/2023.
//

import Foundation
import SwiftUI
import Observation

@Observable
class HoroscopeViewModel {

    var isLoading = false
    var currentHoroscopeText: String = "this is me example text of a daily horoscope this is some example text of a daily horoscope this is some example text of a daily some example text of a daily horoscope this is some example text of a daily horoscope this is some example text of a daily horoscope this is some example text of a daily horoscope this is some example text of a daily horoscope"

    func getHoroscope(for sign: Starsign, tone: GPTTone) async {
        isLoading = true

        let starsign = UserDefaults.standard.string(forKey: "starsign")!

        let prompt = "If I am a \(starsign), pretend you are a fortune teller, please generate my horoscope for today with a \(tone.rawValue) tone. Please try to limit it 250 words"
        let chatGPTURL = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: chatGPTURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(Keys.gpt4)", forHTTPHeaderField: "Authorization")

        let message = GPTMessage(role: "user", content: prompt)
        let gptBody = GPTBody(model: "gpt-4-0613", messages: [message], max_tokens: 500, stop: ["&&"])

        do {
            request.httpBody = try JSONEncoder().encode(gptBody)
            let (data, response) = try await URLSession.shared.data(for: request)
            print((response as! HTTPURLResponse).statusCode)
            let horoscope = try JSONDecoder().decode(GPTResponse.self, from: data)
            currentHoroscopeText = horoscope.choices.first?.message.content ?? "something broke"
        } catch {
            print("error: ", error)
        }

        isLoading = false
    }

}

struct GPTResponse: Decodable {
    let choices: [GPTChoice]
}

struct GPTChoice: Decodable {
    let index: Int
    let message: GPTMessage
}

struct GPTBody: Encodable {
    let model: String
    let messages: [GPTMessage]
    let max_tokens: Int
    let stop: [String]
}

struct GPTMessage: Codable {
    let role: String
    let content: String
}
