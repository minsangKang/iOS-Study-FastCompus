//
//  ViewController.swift
//  study29_firebase
//
//  Created by Kang Minsang on 2021/03/25.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var numOfCustomers: UILabel!
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
//        saveBasicTypes()
//        saveCustomers()
        fetchCustomers()
    }
    
    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("--> \(snapshot)")
            let value = snapshot.value as? String ?? ""
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        }
    }
}
//upload
extension ViewController {
    func saveBasicTypes() {
        let url = db.child("basicTypes")
        url.child("int").setValue(3)
        url.child("double").setValue(3.5)
        url.child("string").setValue("string value - 여러분 안녕")
        url.child("array").setValue(["a", "b", "c"])
        url.child("dictionary").setValue(["id": "anyID", "age": 10, "city": "seoul"])
    }
    
    func saveCustomers() {
        let books = [Book(title: "Good to Great", author: "Someone"), Book(title: "Hacking Growth", author: "Somebody")]
        let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books)
        Customer.id += 1
        let customer2 = Customer(id: "\(Customer.id)", name: "Dele", books: books)
        Customer.id += 1
        let customer3 = Customer(id: "\(Customer.id)", name: "Kane", books: books)
        Customer.id += 1
        
        let url = db.child("customers")
        url.child(customer1.id).setValue(customer1.toDictionary)
        url.child(customer2.id).setValue(customer2.toDictionary)
        url.child(customer3.id).setValue(customer3.toDictionary)
    }
}
//download
extension ViewController {
    func fetchCustomers() {
        db.child("customers").observeSingleEvent(of: .value) { snapshot in
            print("--> \(snapshot.value)")
            
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                print("--> customers: \(customers.count)")
                
                DispatchQueue.main.async {
                    self.numOfCustomers.text = "# of Customers: \(customers.count)"
                }
            } catch let error {
                print("--> error: \(error)")
            }
            
        }
    }
}

struct Customer: Codable {
    let id: String
    let name: String
    let books: [Book]
    static var id: Int = 0
    
    var toDictionary: [String: Any] {
        let booksArray = books.map { $0.toDictionary }
        let dict: [String: Any] = ["id": id, "name": name, "books": booksArray]
        return dict
    }
    
    var customerPrint: Void {
        print("id: \(id) name: \(name)")
        for i in 0..<books.count {
            print("books\(i): \(books[i].bookPrint)")
        }
    }
}

struct Book: Codable {
    let title: String
    let author: String
    
    var toDictionary: [String: Any] {
        let dict: [String: Any] = ["title": title, "author": author]
        return dict
    }
    
    var bookPrint: String {
        return "title: \(title) author: \(author)"
    }
}
