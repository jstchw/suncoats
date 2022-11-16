//
//  weatherAPI.swift
//  suncoats
//
//  Created by Artem Bobrov on 15/11/2022.
//
import Foundation
import Alamofire
import SwiftyJSON

struct weatherResponse: Codable {
    let current_weather: currentWeather
}

struct currentWeather: Codable {
    let time: String
    let temperature: Double
}

class weatherAPI {
    typealias CompletionHandler = (weatherResponse? , Error?) -> ()
    
    func getWeather(completion: @escaping CompletionHandler) {
        
        let url: String = "https://api.open-meteo.com/v1/forecast?latitude=51.52&longitude=-0.11&hourly=temperature_2m&current_weather=true"
        
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of: weatherResponse.self) { response in
            switch response.result {
            case .success(let jsonData):
                DispatchQueue.main.async {
                    completion(jsonData, nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
                
}
