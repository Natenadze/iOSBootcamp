import UIKit



/*
 1. შექმენით ორი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ჯამი.
 */

let num1 = 5
let num2 = 10

print(num1 + num2)

/*
 2. შექმენით Int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა, და შეამოწმეთ არის თუ არა ეს რიცხვი 10-ზე მეტი და 20-ზე ნაკლები ან ტოლი, 20-ზე მეტი და 50-ზე ნაკლები ან ტოლი, 50-ზე მეტი და 100-ზე ნაკლები ან ტოლი, 100-ზე მეტი და შედეგი დაბეჭდეთ.
 */

let num3: Int

num3 = 25

if num3 > 10 && num3 <= 20 {
    print("num3 is more than 10 and less than or equal to 20")
} else if num3 > 20 && num3 <= 50  {
    print("num3 is more than 20 and less than or equal to 50")
} else if num3 > 50 && num3 <= 100 {
    print("num3 is more than 50 and less than or equal to 100")
} else {
    print("num3 is more than 100")
}

/*
 3. for-in ციკლის გამოყენებით, დაბეჭდეთ რიცხვები 1-იდან 20-ამდე. რიცხვები ეწეროს ერთ ხაზზე, გამოყოფილი იყოს სფეისებით. შედეგი: 1 2 3 4...
 */

for num in 1...19 {
    print(num, terminator: " ")
}

// რატომღაც შემდეგი დავალების პასუხსაც მესამე დავალების ხაზზე წერს და ამიტომ დავწერე ქვემოთ ცარიელი პრინტი
print("")

/*
 4. while ციკლის გამოყენებით, 1-იდან 100-ამდე დაბეჭდეთ ყველა კენტი რიცხვის ჯამი.
 */

var oddNumbersSum = 0
var count = 1

while count < 100 {
    if count % 2 != 0 {
        oddNumbersSum += count
    }
    count += 1
}

print(oddNumbersSum)

/*
5. შექმენით String ტიპის ცვლადი, და ციკლის გამოყენებით დაარევერსეთ ეს ცვლადი, მაგ: თუ გვაქვს TBC Academy უნდა მივიღოთ ymedacA CBT.
*/

var nameToReverse = "TBC Academy"
var reversedName = ""

for char in nameToReverse {
    print(char)
    reversedName = String(char) + reversedName
}

print(reversedName)


/*
 6. დაბეჭდეთ ყველა ორნიშნა რიცხვი რომელიც ერთნაირი ციფრებით არის შედგენილი.
 */

for num in 10...99 {
    switch num {
    case 11, 22, 33, 44, 55, 66, 77, 88, 99:
        print(num)
    default:
        continue
    }
}

/*
 7. გაქვს 9 ნიშნა რიცხვი და დაბეჭდე შებრუნებული რიცხვი.
 */

let nineDigitNumber = 123456789
var stringNineDigit = ""

for char in String(nineDigitNumber) {
    stringNineDigit = String(char) + stringNineDigit
}
print(stringNineDigit)


/*
 8. შექმენით bool-ეან ცვლადი, მაგალითად: isNumberFound და while loop-ის გამოყენებით იპოვეთ პირველი რიცხვი რომელიც იყოფა 5-ზეც და 9-ზეც ერთდროულად. 0-იდან დაიწყეთ ათვლა.
 */

var five = 5
var nine = 9
var maxNumber = five * nine
var isNumberFound = false

while !isNumberFound  {
    for num in 0...maxNumber {
        if num > 0,
           num % 5 == 0,
           num % 9 == 0 {
            print(num)
            isNumberFound = true
            break
        }
    }
}


/*
 9. შექმენი String ცვლადი მაგალითად month, რომელსაც მიანიჭებ თვის მნიშვნელობას, მაგალითად: "march" და switch statement-ის გამოყენებით დაბეჭდეთ წელიწადის რა დროა.
 */

var month = "march"

switch month {
    
case "march", "april", "may":
    print("It's a spring")
case "june", "july", "august":
    print("It's a summer")
case "september", "october", "november":
    print("It's a fall")
default:
    print("It's a winter!")
}


/*
 10. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
 */

var color = "🔴"

while true {
    switch color {
    case "🔴":
        print(color)
        color = "🌕"
    case "🌕":
        print(color)
        color = "🟢"
        
    default:
        print(color)
        color = "🔴"
    }
}


//: - Note: time spent - 90min
