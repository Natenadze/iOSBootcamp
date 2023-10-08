//: [Previous](@previous)

import UIKit

/*
 2 თასქი ავაწყოთ პატარა E-commerce სისტემა. (თავისი ქვეთასქებით).

 1. შევქმნათ Class Product,

 შევქმნათ შემდეგი properties productID (უნიკალური იდენტიფიკატორი Int), String name, Double price.

 შევქმნათ Designated Init.



 2. შევქმნათ Class Cart

 Properties: cartID(უნიკალური იდენტიფიკატორი Int), Product-ების Array სახელად items.

 შევქმნათ Designated Init.

 Method იმისათვის რომ ჩვენს კალათაში დავამატოთ პროდუქტი.

 Method იმისათვის რომ ჩვენი კალათიდან წავშალოთ პროდუქტი მისი აიდით.

 Method რომელიც დაგვითვლის ფასს ყველა იმ არსებული პროდუქტის რომელიც ჩვენს კალათაშია.



 3. შევქმნათ Class User

 Properties: userID(უნიკალური იდენტიფიკატორი Int), String username, Cart cart.

 Designated Init.

 Method რომელიც კალათაში ამატებს პროდუქტს.

 Method რომელიც კალათიდან უშლის პროდუქტს.

 Method რომელიც checkout (გადახდის)  იმიტაციას გააკეთებს დაგვითვლის თანხას და გაასუფთავებს ჩვენს shopping cart-ს.



 4. გავაკეთოთ იმიტაცია და ვამუშაოთ ჩვენი ობიექტები ერთად.

 შევქმნათ რამოდენიმე პროდუქტი.

 შევქმნათ 2 user-ი, თავისი კალათებით,

 დავუმატოთ ამ იუზერებს კალათებში სხვადასხვა პროდუქტები,

 დავბეჭდოთ price ყველა item-ის ამ იუზერების კალათიდან.

 და ბოლოს გავაკეთოთ სიმულაცია ჩექაუთის, დავაბეჭდინოთ იუზერების გადასხდელი თანხა და გავუსუფთაოთ კალათები.


 */

class Product {
    
    let productID: Int
    let name: String
    let price: Double
    
    // MARK: - Init
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}

// MARK: -

class Cart {
    
    var cartID: Int
    var items: [Product] = []
    
    // MARK: - Init
    init(cartID: Int) {
        self.cartID = cartID
    }
    
    // MARK: - Methods
    func addProduct(product: Product) {
        items.append(product)
    }
    
    func removeProduct(productID: Int) {
        items.removeAll { $0.productID == productID }
    }
    
    func calculateTotalPrice() -> Double {
        items.reduce(0) { $0 + $1.price }
    }
}


// MARK: -

class User {
    
    var userID: Int
    var username: String
    var cart: Cart
    
    // MARK: - Init
    init(userID: Int, username: String) {
        self.userID = userID
        self.username = username
        self.cart = Cart(cartID: userID)
    }
    
    // MARK: - Methods
    func addToCart(product: Product) {
        cart.addProduct(product: product)
    }
    
    func removeFromCart(productID: Int) {
        cart.removeProduct(productID: productID)
    }
    
    func checkout()  {
        let totalPrice = cart.calculateTotalPrice()
        // Perform the payment process here
        cart.items.removeAll()
        print("Total price paid: $\(totalPrice)")
    }
}

// MARK: -

let product1 = Product(productID: 1, name: "Product 1", price: 10.0)
let product2 = Product(productID: 2, name: "Product 2", price: 15.0)
let product3 = Product(productID: 3, name: "Product 3", price: 50.0)

//
let user1 = User(userID: 123, username: "User1")
let user2 = User(userID: 124, username: "User2")

//
user1.addToCart(product: product1)
user1.addToCart(product: product2)
user1.addToCart(product: product3)
user1.addToCart(product: product3) // რახან count არ გვაქვს რო გავზარდოთ, აქ მგონი ზედმეტი შემოწმებები აღარ უნდა იგივე პროდუქტის დამატებაზე
user2.addToCart(product: product2)

//
print("User1's cart total price: $\(user1.cart.calculateTotalPrice())")
print("User2's cart total price: $\(user2.cart.calculateTotalPrice())")

//
user1.checkout()
user2.checkout()





