//
//  ViewController.swift
//  PersingJSON
//
//  Created by 松田拓海 on 2021/03/06.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let jsonURL = Bundle(for: type(of: self)).path(forResource: "example", ofType: "json")else{
            return
        }
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: jsonURL), encoding: String.Encoding.utf8)else{
            return
        }
        //jsonString
        var person: Person?
        do {
            person = try JSONDecoder().decode(Person.self, from: Data(jsonString.utf8))
        } catch  {
            print(error.localizedDescription)
        }
        guard let result = person else {
            return
        }
        print(result.first_name)
        print(result.last_name)
        print(result.age)
        print(result.sublings)
        // Do any additional setup after loading the view.
    }
    
        
    }


struct Person: Codable {
    let first_name:String
    let last_name:String
    let age:Int
    let is_male:Bool
    let country:String
    let sublings:[String]
}



