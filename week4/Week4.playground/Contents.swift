import Cocoa



//week3


//A
 /*
  In the assignment for Week 3, part D asked you to write a function that would compute the average of an array of Int. Using that function and the array created in part A, create two overloaded functions of the function average.
  */

 func average(intArray: [Int]?) {
     
     if let averageArray = intArray {
         var total = 0
         var arrayCount = averageArray.count
     
         for num in averageArray {
             total += num
         }
         var result = Double(total) / Double(arrayCount)
         
         print("The average of Int Arrays: \(result)")
         
     } else {
         print("The array is nil. Calculating the average is impossible.")
     }
     
     }
    
func average(intArray: [Int]) {
    let total = intArray.reduce(0, +)
    let result = Double(total) / Double(intArray.count)
    print("The average of non-optional Int Arrays: \(result)")
}

func average(doubleArray: [Double]) {
    let total = doubleArray.reduce(0, +)
    let result = total / Double(doubleArray.count)
    print("The average of Double Arrays: \(result)")
}

/*
 B) Create an enum called Animal that has at least five animals. Next, make a function called theSoundMadeBy that has a parameter of type Animal. This function should output the sound that the animal makes. For example, if the Animal passed is a cow, the function should output, “A cow goes moooo.”
 Hint: Do not use if statements to complete this section.
 Call the function twice, sending a different Animal each time.
 */

enum Animal {
    case cow
    case dog
    case cat
    case sheep
    case duck
}

func theSoundMadeBy(animal: Animal) -> String {
    switch animal {
    case .cow:
        return "Moooooo oooooo"
    case .dog:
        return "Woffffff"
    case .cat:
        return "Meowwwwwwww"
    case .sheep:
        return "Baaaaa"
    case .duck:
        return "Quackkkkk"
    }
}
print(theSoundMadeBy(animal: .cow))
print(theSoundMadeBy(animal: .duck))


//C
/*
 Create an array of Int called nums with the values of 0 to 100.
 Create an array of Int? called numsWithNil with the following values:
 79, nil, 80, nil, 90, nil, 100, 72

 Create an array of Int called numsBy2 with values starting at 2 through 100, by 2.
 Create an array of Int called numsBy4 with values starting at 2 through 100, by 4.
 */
var nums = Array(0...100)
var numsWithNil: [Int?] = [79, nil, 80, 90, nil, 100, 72]
var numsBy2 = Array(stride(from: 2, to: 100, by: 2))
var numbsBy4 = Array(stride(from: 2, through: 100, by: 4))

/*
 Create a function called evenNumbersArray that takes a parameter of [Int] (array of Int) and returns [Int]. The array of Int returned should contain all the even numbers in the array passed. Call the function passing the nums array and print the output.
 */

func evenNumbersArray(numsArray: [Int]) -> [Int] {
    return numsArray.filter { $0 % 2 == 0}
}

var testEvenNumsArray = evenNumbersArray(numsArray: [3, 5, 2, 4, 89, 90, 51, 34, 40, 44, 57, 68, 98, 76])
print("EvenNumsArray: \(testEvenNumsArray)")


/*
 Create a function called sumOfArray that takes a parameter of [Int?] and returns an Int. The function should return the sum of the array values passed that are not nil. Call the function passing the numsWithNil array, and print out the results.
 */
func sumOfArray(array: [Int?]) -> Int {
    return array.reduce(0) { total, currentValue in
        total + (currentValue ?? 0)
    }
  
}

var testSumOfArray = sumOfArray(array: [3, 5, 6, 1, 5, nil, 5])
print("ArraySum: \(testSumOfArray)")

/*
  Create a function called commonElementsSet that takes two parameters of [Int] and returns a Set<Int> (set of Int). The function will return a Set<Int> of the values in both arrays.
 Call the function commonElementsSet passing the arrays numsBy2, numsBy4, and print out the results.
 */

func commonElementsSet(_ arrayOne: [Int], _ arrayTwo: [Int]) -> Set<Int> {
    let setOne = Set(arrayOne)
    let setTwo = Set(arrayTwo)
    return setOne.intersection(setTwo)
}
let testCommonNums = commonElementsSet(numsBy2, numbsBy4)
print("CommonNumbers: \(testCommonNums)")


//D
//Create a struct called Square that has a stored property called sideLength and a computed property called area. Create an instance of Square and print the area.

struct Square {
    var sideLength: Double
    var area: Double {
        sideLength * sideLength
    }
}
var testSqure = Square(sideLength: 3)
print("SquareArea: \(testSqure.area)")


// Part3

protocol Shape {
    func calculateArea() -> Double
}

struct Circle: Shape {
    var radius: Double
    
    func calculateArea() -> Double {
        .pi * radius * radius
    }
}

struct Rectangle: Shape {
    var length: Double
    var width: Double
    
    func calculateArea() -> Double {
        length * width
    }
}

let circle = Circle(radius: 4)
print("CircleArea: \(circle.calculateArea().rounded())")

let rectangle = Rectangle(length: 5, width: 2)
print("RectangleArea: \(rectangle.calculateArea())")



extension Shape {
    func calculateVolume() -> Double {
        return 0
    }
}


struct Sphere: Shape {
    var radius: Double
    
    func calculateArea() -> Double {
        4 * .pi * radius * radius
    }
    
    func calculateVolume() ->Double {
        (4.0/3.0) * .pi * radius * radius * radius
    }
}


let testSphere = Sphere(radius: 4)
print("SphereArea: \(testSphere.calculateArea().rounded())")

let sphereVolume =  Sphere(radius: 3)
print("SphereVolume: \(sphereVolume.calculateVolume().rounded())")
