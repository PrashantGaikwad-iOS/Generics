//
//  ViewController.swift
//  Generics
//
//  Created by Prashant G on 9/5/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit
// Case A:
// Generics Basics
struct Box<T> {
    let value: T
}

// Case B:
struct Customer {
    let orderAmount: Float
}
struct Queue {
    private var customers = [Customer]()
    
    mutating func next() -> Customer {
        return customers.removeFirst()
    }
    
    mutating func lineUp(customer: Customer) {
        customers.append(customer)
    }
}

// Case C:
struct Car {
    let orderAmount: Float
    let carSize: String
}
struct GenericQueue<T> {
    private var elements = [T]()
    
    mutating func next() -> T {
        return elements.removeFirst()
    }
    
    mutating func lineUp(element: T) {
        elements.append(element)
    }
    
    var size: Int {
        get {
            return elements.count
        }
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Case A:
        // -------- Algorithm Exercise --------
        let oneBox = Box(value: 10)
        let twoBox = Box(value: 2)
        let stringBox = Box(value: "Hello, World!")
        
        print("Add boxes: \(oneBox.value + twoBox.value)")
        print("String inside stringBox: \(stringBox.value)")
        
        
        // Case B:
        // Imagine opening a fast food restaurant where you serve walk-in customers in your store. Implement a FIFO (First In First Out) queue that takes care of each customer as they come in:
        var inStoreCustomerQueue = Queue()
        inStoreCustomerQueue.lineUp(customer: Customer(orderAmount: 10.99))
        inStoreCustomerQueue.lineUp(customer: Customer(orderAmount: 25.00))
        
        print(inStoreCustomerQueue.next().orderAmount) // 10.99
        print(inStoreCustomerQueue.next().orderAmount) // 25.00
        
        
        // Case C:
        // Everything looks good and business is flowing! However, you notice that having a separate Drive-Thru line could easily increase sales.  Think about how you can use Generics to implement the same Queue that also supports customers coming in through a vehicle:
        
        // Sample Test Cases
        var carQueue = GenericQueue<Car>()
        carQueue.lineUp(element: Car(orderAmount: 15.00, carSize: "small"))
        carQueue.lineUp(element: Car(orderAmount: 29.00, carSize: "large"))
        
        var customerQueue = GenericQueue<Customer>()
        customerQueue.lineUp(element: Customer(orderAmount: 10.99))
        customerQueue.lineUp(element: Customer(orderAmount: 25.00))
        print(customerQueue.next())
        print(customerQueue.size)
        print(customerQueue.next())
        print(customerQueue.size)
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

