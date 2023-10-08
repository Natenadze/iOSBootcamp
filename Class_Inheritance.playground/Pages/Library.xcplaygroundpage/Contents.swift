import UIKit

/*
 1-ი თასქი ბიბლიოთეკის სიმულაცია. (თავისი ქვეთასქებით).

 1. შევქმნათ Class Book.

 Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.

 Designated Init.

 Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.

 Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.



 2. შევქმნათ Class Owner

 Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.

 Designated Init.

 Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.

 Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.



 3. შევქმნათ Class Library

 Properties: Books Array, Owners Array.

 Designated Init.

 Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.

 Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.

 Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.

 Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.

 Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.

 Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.

 Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.



 4. გავაკეთოთ ბიბლიოთეკის სიმულაცია.

 შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.

 დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში

 წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.

 დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
 */

class Book {
    
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool = false
    
    // MARK: - Init
    init(bookID: Int, title: String, author: String) {
        self.bookID = bookID
        self.title = title
        self.author = author
    }
    
    // MARK: - Methods
    
    func markAsBorrowed() {
        isBorrowed = true
    }
    
    func markAsReturned() {
        isBorrowed = false
    }
    
}

class Owner {
    
    let ownerID: Int
    let name: String
    var borrowedBooks: [Book] = []
    
    // MARK: - Init
    init(ownerID: Int, name: String) {
        self.ownerID = ownerID
        self.name = name
    }
    
    // MARK: - Methods
    func takeBookFromLibrary(_ book: Book) {
        borrowedBooks.append(book)
        book.markAsBorrowed()
    }
    
    func returnBook(_ book: Book) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            borrowedBooks.remove(at: index)
            book.markAsReturned()
        }
    }
    
}


class Library {
    
    var booksList: [Book]
    var ownersList: [Owner]
    
    // MARK: - Init
    init(booksList: [Book] = [], ownersList: [Owner] = []) {
        self.booksList = booksList
        self.ownersList = ownersList
    }
    
    // MARK: - Methods
    func addBook(_ book: Book) {
        if !booksList.contains(where: { $0.bookID == book.bookID }) {
            booksList.append(book)
        } else {
            print("Book with ID \(book.bookID) already exists in the library.")
        }
    }
    
    
    func addOwner(_ owner: Owner) {
        if !ownersList.contains(where: { $0.ownerID == owner.ownerID }) {
            ownersList.append(owner)
        } else {
            print("Owner with ID \(owner.ownerID) already exists in the library.")
        }
    }
    
    
    func getAvailableBooks() -> [Book] {
        booksList.filter {$0.isBorrowed == false}
    }
    
    func getTakenBooks() -> [Book]  {
        booksList.filter {$0.isBorrowed == true}
    }
    
    func findOwnerWithID(id: Int) {
        if let owner = ownersList.first(where: { $0.ownerID == id }) {
            print("Owner found: ID: \(owner.ownerID), Name: \(owner.name)")
        } else {
            print("Owner with ID \(id) not found in the library.")
        }
    }

    
    func findBorrowedBooksByOwner(_ owner: Owner) -> [Book] {
        owner.borrowedBooks
    }
    
    // TODO: - fix this
    func lendBook(_ book: Book, to owner: Owner) {
        if let index = booksList.firstIndex(where: { $0.bookID == book.bookID }) {
            if booksList[index].isBorrowed == false {
                owner.takeBookFromLibrary(booksList[index])
                print("\(book.title) has been lent to \(owner.name).")
            } else {
                print("Book is already taken")
            }
            
        }
    }
    
}



// MARK: - Create Books and owners

let library = Library()

let book1 = Book(bookID: 1, title: "Book 1", author: "Author 1")
let book2 = Book(bookID: 2, title: "Book 2", author: "Author 2")
let book3 = Book(bookID: 3, title: "Book 3", author: "Author 3")
let book4 = Book(bookID: 4, title: "Book 4", author: "Author 4")
let book5 = Book(bookID: 5, title: "Book 5", author: "Author 5")

library.addBook(book1)
library.addBook(book2)
library.addBook(book3)
library.addBook(book4)
library.addBook(book5)

let owner1 = Owner(ownerID: 1, name: "Owner 1")
let owner2 = Owner(ownerID: 2, name: "Owner 2")
let owner3 = Owner(ownerID: 3, name: "Owner 3")


library.addOwner(owner1)
library.addOwner(owner2)
library.addOwner(owner3)


print(book1.isBorrowed)

owner1.borrowedBooks.count
owner3.borrowedBooks.count

// lend books
library.lendBook(book1, to: owner1)
library.lendBook(book2, to: owner1)
library.lendBook(book3, to: owner2)
library.lendBook(book4, to: owner3)

owner1.borrowedBooks.count
owner3.borrowedBooks.count

// MARK: -

// Print every taken book title from the library
let takenBooks = library.getTakenBooks()
print("Taken Books:")
for book in takenBooks {
    print(book.title)
}

// Print every available book title in the library
let availableBooks = library.getAvailableBooks()
print("\nAvailable Books:")
for book in availableBooks {
    print(book.title)
}

// Print all the books taken by owner1
print("\nBooks taken by Owner 1:")
for book in library.findBorrowedBooksByOwner(owner1) {
    print(book.title)
}



//: [Next](@next)



