import Cocoa


// A:  Create an array of Int called nums with values 0 through 20. Iterate over the Array and print the even numbers.

var nums = Array(0...20)

for num in nums {
    if num % 2 == 0 {
        print(num)
    }
}
print("**********************************************")



// B:  In your Playground, define the following String:
// let sentence = “The qUIck bRown fOx jumpEd over the lAzy doG”
// Iterate over sentence counting the vowels (a, e, i, o, u), ignoring the case.

let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"

let vowels = "aeiou"

var countVowels = 0

//ignoring the case
let lowercasedSentence = sentence.lowercased()

for singleCharacter in lowercasedSentence {
    if vowels.contains(singleCharacter) {
        countVowels += 1
    }
}
print("Total vowels count: \(countVowels) ")
print("**********************************************")


/* C) Create two arrays of Int with the values of 0 through 4. Use a nested for loop to print a mini multiplication table. The output, which should be multiple lines, should be in the following format:
 0 * 0 = 0

 The format follows the number from the first array, space, followed by the character *, space,  followed by the number from the second array, space,  followed by =, space, followed by the result of the number from the first array multiplied by the number from the second array (just like the example above). There are a couple of ways to achieve this, but String Interpolation is the easiest.
 */

var arrayOne = Array(0...4)
var arrayTwo = Array(0...4)

for numOne in arrayOne {
    
    for numTwo in arrayTwo {
        
        let multipliedResult = numOne * numTwo
        print("\(numOne) * \(numTwo) = \(multipliedResult)")
    }
            
}
print("**********************************************")


/*
 D) Write a function called average that takes an optional array of Int. If the array is not nil, calculate the average of the array's values and print:
 “The average of the values in the array is <average>.”

 Where <average> is the calculated average. If the array is nil, print:
 “The array is nil. Calculating the average is impossible.”

 Note: the average is calculated by summing the values in the array and dividing by the number of elements.

 Call this function two times. First, pass in the nums array from part A and second by passing an optional array of Int.
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
    

average(intArray: nums)

let optionalIntTestArray: [Int]? = nil
average(intArray: optionalIntTestArray)
print("**********************************************")


/* E) Create a struct called Person with the properties firstName, lastName, and age. Choose appropriate data types for the properties. Include a method on Person called details that prints the values stored in the properties in the following format:
  Name: <firstName> <lastName>, Age: <age>

 Create an instance of Person called person. Pass your first name, last name, and age for the properties. Finally, call the method details.
 */

struct Person {
    var firstName: String
    var lastName: String
    var age: Int
    
    func details() {
        print("Name: \(firstName) \(lastName), Age: \(age)")
    }
}
    

var person = Person(firstName: "Bijay", lastName: "Rai", age: 100)
person.details()

print("**********************************************")

/* F) Create a class called Student with two properties: person of type Person and grades, an array of Int. The class must have a method called calculateAverageGrade that takes no parameters and returns a Double. Include a method called details that prints the values of the properties stored in Student along with the average grade in the following format:
  Name: <firstName> <lastName>, Age: <age>, GPA: <average grade>.

 Create an instance of Student called student passing in your first name, last name, age, and an array of five numbers: 94, 99, 81, 100, 79. Next call the details method to output the details of the student.

 */

class Student {
    var person: Person
    var grades: [Int]
    
    init(person: Person, grades: [Int]) {
        self.person = person
        self.grades = grades
    }
   
    func calculateAverageGrade() -> Double {
        var totalGrade = 0
        var countGrades = grades.count
        
        for grade in grades {
            totalGrade += grade
        }
        let averageGrade = Double(totalGrade) / Double(countGrades)
        return averageGrade
        
    }
    
    func details() {
        let averageGrade = calculateAverageGrade()
        print("Name: \(person.firstName) \(person.lastName), Age: \(person.age), GPA: \(averageGrade)")
    }
}

let student = Student(person: Person(firstName: "Bijay", lastName: "Rai", age: 18), grades: [94, 99, 81, 100, 79])
student.details()

