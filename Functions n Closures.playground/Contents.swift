import UIKit
//: # Functions and Closures
//: ### Questions
/*
 1. შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.
 
 2. შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.
 
 3. შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.
 
 4. შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
 
 5. შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]
 
 6. შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.
 
 7. შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.
 
 8. შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.
 
 9. გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
 
 10. function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
 */
//: ### Task 1
func makeFactorial(_ number: Int) -> Int? {
    var result = 1
    
    if number > 0 {
        for i in 1...number {
            result *= i
        }
    } else if number == 0 {
        return 1
    } else {
        print("Factorials are not defined for negative numbers")
        return nil
    }
    
    return result
}

makeFactorial(0)
makeFactorial(5)
makeFactorial(-5)
//: ### Task 2
func fibonacci(for count: Int) -> [Int]? {
    var result = [0, 1]
    
    if count >= 1 {
        for i in 1...count - 2 {
            result.append( result[i] + result[i - 1] )
        }
    } else {
        print("Fibonacci must have at least 2 numbers in it")
        return nil
    }

    return result
}

fibonacci(for: 0)
fibonacci(for: 6)
fibonacci(for: 20)

// Solution 2

func fibonacci2(for number: Int) -> [Int] {
    var sequence = [0, 1]
    var count = 2
    
    while count < number {
        let nextNumber = sequence[count - 1] + sequence[count - 2]
        sequence.append(nextNumber)
        count += 1
    }
    
    return sequence
}

fibonacci2(for: 0)
fibonacci2(for: 6)
fibonacci2(for: 20)
//: ### Task 3
// Solution 1
func isPalindrome(_ text: String) -> Bool {
    let chars = Array(text)
    let length = chars.count
    
    for i in 0..<length / 2 {
        if chars[i] != chars[length - i - 1] {
            return false
        }
    }
    return true
}

isPalindrome("abba")
isPalindrome("radar")
isPalindrome("rush")
isPalindrome("yes")

// Solution 2
func isPalindromeSimple(_ value: String) -> Bool {
    value == String(value.reversed())
}

isPalindromeSimple("abba")
isPalindromeSimple("radar")
isPalindromeSimple("rush")
isPalindromeSimple("yes")
//: ### Task 4
func squareEachElement(numbers: [Int]) -> [Int] {
    numbers.map { $0 * $0 }
}

squareEachElement(numbers: [1, 2, 3, 4, 5, 6])
//: ### Task 5
func wordFrequency(inputString: String) -> [String: Int] {
    let wordsArray = inputString
        .lowercased()
        .components(separatedBy: CharacterSet(charactersIn: " ,.?!"))
        .filter { !$0.isEmpty }
    
    var wordCounts = [String: Int]()
    
    
    for word in wordsArray {
        wordCounts[word, default: 0] += 1
    }
    
    
    return wordCounts
}

let a = wordFrequency(inputString: "TBC x USAID, tbc it academy, we are in TBC academy.")
print(a)
let b = wordFrequency(inputString: "otxi, otxi, otxi!  . sami ori sami, sami, erti, otxi, ori")
print(b)


//: ### Task 6

// Solution 1
let intToBinary: (Int) -> String = { number in
    var binaryString = ""
    var n = number
    
    while n > 0 {
        binaryString = String(n % 2) + binaryString
        n /= 2
    }
    
    return binaryString.isEmpty ? "0" : binaryString
}

intToBinary(231)
intToBinary(10)
intToBinary(37)


// Solution 2
let intToBinary2: (Int) -> String = { number in
    return String(number, radix: 2)
}


intToBinary2(231)
intToBinary2(10)
intToBinary2(37)

//: ### Task 7
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers.filter { !$0.isMultiple(of: 2) }
//: ### Task 8
var numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print( numbers2.map { $0 * 10 } )

//: ### Task 9
var printAfterTimer: () -> Void =  {
   
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print([1,2,3,4,5])
    }
    print("wait 3 sec...")
}

printAfterTimer()

// or just

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    print([6,7,8,9,10])
}

print("wait 3 sec again...")
//: ### Task 10
let chars = ["1","44","-111","0","7","!","13","12","9","mamuka","4"]

func returnOddNumbersArray(input: [String]) -> [Int] {
    
    input
        .compactMap { Int($0) }
        .filter { !$0.isMultiple(of: 2) }
}


returnOddNumbersArray(input: chars)
