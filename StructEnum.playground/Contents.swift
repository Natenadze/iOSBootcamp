import UIKit
//: # Structs n Enums
//: ### Questions
/*
 1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.
 
 2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
 
 3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.
 
 4. შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.
 
 5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.
 */
//: ### Task 1
enum DayOfWeek {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

func printDay(day: DayOfWeek) {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("It is a weekday")
    case .saturday, .sunday:
        print("It is a weekend")
    }
}

let today: DayOfWeek = .friday
let tomorrow: DayOfWeek = .saturday

printDay(day: today)
printDay(day: tomorrow)


//: ### Task 2
enum Weather {
    case sunny(Double)
    case cloudy(Double)
    case rainy(Double)
    case snowy(Double)
}


func recommendClothing(weather: Weather) -> String {
    
    switch weather {
    case .sunny(let celsius):
        return "Wear sunscreen and light clothing, it's \(celsius)°C."
    case .cloudy(let celsius):
        return "It's a good day for cycling, wear comfortable clothes, it's \(celsius)°C."
    case .rainy(let celsius):
        return "Take an umbrella and wear a waterproof jacket, it's \(celsius)°C and raining."
    case .snowy(let celsius):
        return "Dress warmly and wear snow boots, it's \(celsius)°C and snowy."
    }
}


let currentWeather = Weather.sunny(28)
let recommendation = recommendClothing(weather: currentWeather)
print("recomendation: \(recommendation)")

//: ### Task 3
struct Book {
    let title: String
    let author: String
    let publicationYear: Int
}

let book1 = Book(title: "The Great Gatsby",
                 author: "F. Scott Fitzgerald",
                 publicationYear: 1925)

let book2 = Book(title: "To Kill a Mockingbird",
                 author: "Harper Lee",
                 publicationYear: 1960)

let book3 = Book(title: "1984",
                 author: "George Orwell",
                 publicationYear: 1949)

let book4 = Book(title: "The Adventures of Tom Sawyer",
                 author: "Mark Twain",
                 publicationYear: 1876)

let book5 = Book(title: "The Catcher in the Rye",
                 author: "J.D. Salinger",
                 publicationYear: 1951)

let book6 = Book(title: "The Lord of the Rings",
                 author: "J.R.R. Tolkien",
                 publicationYear: 1954)

let booksArray = [book1, book2, book3, book4, book5, book6]


func filterBooksArrayByYear(books: [Book], year: Int) -> [Book] {
    books.filter { $0.publicationYear > year }
}


let filteredBooks = filterBooksArrayByYear(books: booksArray, year: 1950)

let titles = filteredBooks.map (\.title)
print(titles)
//: ### Task 4
struct BankAccount {
    
    let holderName: String
    let accountNumber: String
    var balance: Double
    
    
    // MARK: - Methods
    mutating func deposit(amount: Double) {
        guard amount > 0 else {
            print("Deposit amount must be more than 0.")
            return
        }
        balance += amount
        print("Deposited $\(amount). New balance: $\(balance)")
    }
    
    mutating func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Invalid withdrawal amount.")
            return
        }
        
        if amount <= balance {
            balance -= amount
            print("Withdrawn $\(amount).")
        } else {
            print("Insufficient balance.")
        }
    }
    
    mutating func transfer(amount: Double, toAccount: inout BankAccount) {
        guard amount > 0 else {
            print("Invalid transfer amount. Please enter a positive amount.")
            return
        }
        
        if amount <= balance {
            balance -= amount
            toAccount.balance += amount
            print("Transferred $\(amount) to \(toAccount.holderName).")
        } else {
            print("Insufficient balance. Your current balance is $\(balance).")
        }
    }
}

var account1 = BankAccount(holderName: "bondo", accountNumber: "GE123456", balance: 1000.0)
var account2 = BankAccount(holderName: "Jondo", accountNumber: "GE742311", balance: 1500.0)

account1.deposit(amount: 500.0)
account1.withdraw(amount: 200.0)
account1.transfer(amount: 300.0, toAccount: &account2)
//: ### Task 5
enum Genre {
    case rock, jazz, blues, classical
}

struct Song {
    let title: String
    let artist: String
    let duration: Double
    let genre: Genre
    var description: String {
        "\(title) by \(artist), Duration: \(duration) seconds"
    }
    lazy var publisher: String? = nil
}


let song1 = Song(title: "Bohemian Rhapsody",
                 artist: "Queen",
                 duration: 354.0,
                 genre: .rock,
                 publisher: "EMI Records")

var song2 = Song(title: "Kind of Blue",
                 artist: "Miles Davis",
                 duration: 285.0,
                 genre: .jazz)
song2.publisher = "Columbia Records"

let song3 = Song(title: "Crossroads",
                 artist: "Cream",
                 duration: 246.0, 
                 genre: .rock,
                 publisher: "Polydor Records")

let song4 = Song(title: "Stairway to Heaven",
                 artist: "Led Zeppelin",
                 duration: 482.0,
                 genre: .rock,
                 publisher: "Atlantic Records")

let song5 = Song(title: "So What",
                 artist: "Miles Davis",
                 duration: 507.0,
                 genre: .jazz)

let song6 = Song(title: "The Thrill Is Gone",
                 artist: "B.B. King",
                 duration: 306.0,
                 genre: .blues)

let song7 = Song(title: "Moonlight Sonata",
                 artist: "Ludwig van Beethoven", duration: 690.0,
                 genre: .classical)

let song8 = Song(title: "Comfortably Numb",
                 artist: "Pink Floyd",
                 duration: 384.0,
                 genre: .rock)

let song9 = Song(title: "My Favorite Things",
                 artist: "John Coltrane",
                 duration: 424.0,
                 genre: .jazz)

let song10 = Song(title: "Sweet Home Chicago",
                  artist: "Robert Johnson",
                  duration: 194.0,
                  genre: .blues)


let allSongs = [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10]


func filterSongsByGenre(songs: [Song], genre: Genre) -> [Song] {
    songs.filter {$0.genre == genre}
}

let rockSongs: [Song] = filterSongsByGenre(songs: allSongs, genre: .rock)

let artist = rockSongs.map (\.artist)
print(artist)
