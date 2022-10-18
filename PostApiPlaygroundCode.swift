import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct EndPoint {
    static let registerUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
    static let getUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
}

struct PostAPIManager {
    func registerUser() {
        var request = URLRequest(url: URL(string: EndPoint.registerUser)!)
        
        request.httpMethod = "POST"
        
        let dataDictionary = ["name": "Maadhav", "email": "maadhav@gmail.com", "password": "4566"]
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
            
            request.httpBody = requestBody
            
            //Without adding below line post request would not happen. Below line is very important. Even if miss this line then we wont get any compier error also.
            request.addValue("application/json", forHTTPHeaderField: "content-type")
        } catch let error {
            debugPrint(error)
        }
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if let data = data  {
                let resultData = String(data: data, encoding: .utf8)
                debugPrint(resultData!)
            } else {
                print("Error Ocurred")
            }
        }.resume()
    }
    
    func getRegisteredUserData() {
        
        URLSession.shared.dataTask(with: URL(string: EndPoint.getUser )!) {
            data, _, error in
            
            if data != nil && data?.count != 0 {
                let data = String(data: data!, encoding: .utf8)
                print(data!)
            } else {
                print(error as Any)
            }
        }.resume()
    }
}

let obj = PostAPIManager()
obj.registerUser()
print("\n")
obj.getRegisteredUserData()

