import UIKit

// MARK: - Gadget & Person & WeakGadget classes for Strong & Weak Example

//class Gadget {
//    let model: String
//    init(model: String) {
//        self.model = model
//        print("\(model) is being initialized")
//    }
//    var owner: Person?
//    deinit {
//        print("\(model) is being deinitialized")
//    }
//}
//
//class WeakGadget {
//    let model: String
//    init(model: String) {
//        self.model = model
//        print("\(model) is being initialized")
//    }
//    weak var owner: Person?
//    deinit {
//        print("\(model) is being deinitialized")
//    }
//}
//
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    var gadget: Gadget?
//    var weakGadget: WeakGadget?
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}

// MARK: - Strong reference
//
//var kelvin: Person?
//var iphone: Gadget?
//
//kelvin = Person(name: "Kelvin")
//iphone = Gadget(model: "iPhone 8 Plus")

/// This creates a strong reference between both objetcs. The objects won't be deallocated.
//kelvin!.gadget = iphone
//iphone!.owner = kelvin
//
//kelvin = nil
//iphone = nil

// MARK: - Weak reference
//
//var kelvin: Person?
//var iphone: WeakGadget?
//
//kelvin = Person(name: "Kelvin")
//iphone = WeakGadget(model: "iPhone 8 Plus")
//
//kelvin!.weakGadget = iphone
//iphone!.owner = kelvin
//
//kelvin = nil
//iphone = nil

// MARK: - Unowned reference
//
class Person {
    let name: String
        
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
        
    var gadget: Gadget?
    deinit {
        print("\(name) is being deinitialized")
    }
}
 
class Gadget {
    let model: String
    unowned var owner: Person
        
    init(model: String, owner: Person) {
        self.model = model
        self.owner = owner
        print("\(model) is being initialized")
    }
    
    deinit {
        print("\(model) is being deinitialized")
    }
}

var kelvin: Person?

kelvin = Person(name: "Kelvin")
kelvin!.gadget = Gadget(model: "iPhone 8 Plus", owner: kelvin!)

kelvin = nil
