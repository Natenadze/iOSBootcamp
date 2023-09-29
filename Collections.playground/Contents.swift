import UIKit
// MARK: - If it looks ugly please go to Editor menu -> Show Rendered Markup
//: # Collections
//: ### Questions
/*
1. შექმენით array, შემდეგ პირველ და ბოლო ელემენტს გაუცვალეთ ადგილი, გამზადებული ან უკვე არსებული ფუნქციის გარეშე.  (array-ის ტიპს არაქვს მნიშვნელობა).

2. შექმენით array, მასში წაშალეთ ნახევარი ელემენტები, თუ კენტი რაოდენობის იქნა დატოვეთ ნაკლები და წაშალეთ მეტი.  მაგ.: თუ იყო 11 ელემენტი 5 დატოვეთ და 6 წაშალეთ. და დაბეჭდეთ მიღებული შედეგი. (array-ის ტიპს არაქვს მნიშვნელობა).

3.  შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.

 4. შექმენით Double-ების array, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ array-ში.

 5. შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

 6. შექმენით String ტიპის ცვლადი და შეამოწმეთ არის თუ არა ყველა ჩარაქტერი ამ სტრინგში უნიკალური. გამოიყენეთ Set-ი ამ თასკის შესასრულებლად.

 7. შექმენით ორი Int-ების Set. გამოიყენეთ მათზე Set-ის მეთოდები როგორიცაა: union, intersection და difference. დაბეჭდეთ შედეგები.

 8. შექმენით ორი String-ის Set. შეამოწმეთ არის თუ არა პირველი String-ის Set, მეორეს sub-Set-ი. დაბეჭდეთ შედეგი.

 9. შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

 10. შექმენით Dictionary, სადაც იქნება ფილმის სახელები და მათი რეიტინგები, რეიტინგი (0-10). დაამატეთ მინიმუმ 5 ფილმი, ამის შემდეგ გამოთვალეთ ამ Dictionary-ში არსებული ფილმების საშვალო რეიტინგი. დაბეჭდეთ მიღებული შედეგი.
 */
//: ### Task 1
// solution 1
var numbers1 = [1, 3, 13, 55, 7, 10]

var firstElement = numbers1.remove(at: 0)
var lastElement = numbers1.removeLast()

numbers1.insert(lastElement, at: 0)
numbers1.append(firstElement)
print(numbers1)

// solution 2
var numbers2 = [1, 3, 13, 55, 7, 10]
numbers2.swapAt(0, numbers2.count - 1)

//: ### Task 2
var numbers3 = [1, 3, 13, 55, 7, 10, 12]
var numbers3Count = numbers3.count

if numbers3Count.isMultiple(of: 2) {
    numbers3.removeLast(numbers3Count / 2)
} else {
    numbers3.removeLast( (numbers3Count / 2) + 1 )
}

print(numbers3)

//: ### Task 3
// solution 1
var numbers4 = [Int]()

for i in 0...10 {
    numbers4.append(i)
}

var evenNumbers = [Int]()
var oddNumbers = [Int]()

for num in numbers4 {
    if num.isMultiple(of: 2) {
        evenNumbers.append(num)
    } else {
        oddNumbers.append(num)
    }
}

print(evenNumbers)
print(oddNumbers)

// solution 2
var evenNumbers2 = numbers4.filter { $0.isMultiple(of: 2) }
var oddNumbers2 = numbers4.filter { !$0.isMultiple(of: 2) }

print(evenNumbers2)
print(oddNumbers2)

//: ### Task 4
let doubleArray: [Double] = [11.0, 2.4, 23.5, 34.0, 5.2, 6.0, 7.0, 82.7, 190.0, 11.0]

// solution 1
var maxNumberInArray: Double = 0.0

for i in doubleArray {
    if i > maxNumberInArray {
        maxNumberInArray = i
    }
}
print(maxNumberInArray)

// solution 2
let maxNumber = doubleArray.max()


//: ### Task 5
var array1 = [8, 4, 9, 9, 0, 2]
var array2 = [1, 0, 9, 2, 3, 7, 0, 1]
//var joinedArray = array1 + array2
var joinedArray = [8, 4, 9, 9, 0, 2, 1, 0, 9, 2, 3, 7, 0, 1]

let arrayEnumeration = joinedArray.count - 1 // 13

for i in 0..<arrayEnumeration {
    for j in 0..<arrayEnumeration - i {
        if joinedArray[j] > joinedArray[j+1] {
            let tempNumber = joinedArray[j]
            joinedArray[j] = joinedArray[j+1]
            joinedArray[j+1] = tempNumber
        }
    }
}

print(joinedArray)

//: ### Task 6
var name1 = "No duplicates"
var name2 = "Yes duplicates"

print("name1 is unique: ", name1.count == Set(name1).count)
print("name2 is unique: ", name2.count == Set(name2).count)


//: ### Task 7
var set1: Set<Int> = [1, 0, 9, 2, 3, 7, 11]
var set2: Set<Int> = [10, 6, 9, 2, 3, 74, 0, 1]

var inter = set1.intersection(set2)
print(inter)
var union = set1.union(set2)
print(union)
var diff = set1.symmetricDifference(set2)
print(diff)

//: ### Task 8
var set3: Set<String> = ["a", "b", "c"]
var set4: Set<String> = ["d", "f", "a", "b", "u"]

print(set3.isSubset(of: set4))

//: ### Task 9
var array3 = [8, 4, 9, 9, 0, 2]

var result = "array-ში ყველა ელემენტი განსხვავებულია"

for i in 0..<array3.count - 1 {
    var num = array3[i]
   
    if num == array3[i + 1]  {
        result = "array შეიცავს მსგავს ელემენტებს"
        break
    }
}
print(result)

//: ### Task 10
var movieRatings: [String: Int] = [
    "Movie 1": 2,
    "Movie 2": 8,
    "Movie 3": 5,
    "Movie 4": 9,
    "Movie 5": 4,
    "Movie 6": 5
]

var sum: Double = 0

for (_, rating) in movieRatings {
    sum += Double(rating)
}

print(sum / Double(movieRatings.count) )
