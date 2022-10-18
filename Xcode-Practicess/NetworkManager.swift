//
//  NetworkManager.swift
//  Xcode-Practicess
//
//  Created by user227716 on 10/18/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func getAPIData(amiibo: @escaping([AmiiboModel]) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: "https://amiiboapi.com/api/amiibo/")!) {
            data, _, error in
            
            if data != nil && data?.count != 0 {
                //let data = String(data: data!, encoding: .utf8)
                do {
                    let result = try JSONDecoder().decode(AmiiboList.self, from: data!)
                    amiibo(result.amiibo)
                    print(data!)
                } catch {
                    print(error)
                }
                
            } else {
                print(error as Any)
            }
        }.resume()
    }
    
}
