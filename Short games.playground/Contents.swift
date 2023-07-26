import UIKit

// Create the Fizz Buzz game, from 0 to 100, fizz for divide 3 and buzz for divide 5

for index in 0...100 {
    switch index {
    case _ where index % 3 == 0 && index % 5 == 0 :
        print("fizz buzz")
        break
    case _ where index % 3 == 0 :
        print("fizz")
        break
    case _ where index % 5 == 0 :
        print("buzz")
        break
    default:
        print(index)
    }
}
