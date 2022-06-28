import Foundation

@propertyWrapper struct RatingWrapper {
    var wrappedValue: Double {
        willSet {
            if newValue > 5.0 { self.wrappedValue = 5.0 }
            else if newValue < 0.0 { self.wrappedValue = 0.0 }
            else { self.wrappedValue = newValue }
        }
    }
    init(wrappedValue: Double) {
        if wrappedValue > 5.0 { self.wrappedValue = 5.0 }
        else if wrappedValue < 0.0 { self.wrappedValue = 0.0 }
        else { self.wrappedValue = wrappedValue }
    }
}

protocol DataFetcher {
    associatedtype APIData
    static func getData() -> [APIData]
}

protocol Model {
    var id: String { get set }
    var rating: Double { get set }
    var price: Int { get set } // 1GEL -> 100 Tetri
}

typealias FetcherObject = DataFetcher & Model

// MARK: - Car
class Car: Model {
    var id: String
    @RatingWrapper var rating: Double
    var price: Int
    var make: String // It's make :P
    
    init(id: String, rating: Double, price: Int, make: String) {
        self.id = id
        self.rating = rating
        self.price = price
        self.make = make
    }
    
    private static func randomCar() -> Car {
        Car(id: randomId(), rating: randomRating(), price: randomPrice(), make: randomMake())
    }
}

// MARK: - Video Game
class VideoGame: Model {
    var id: String
    @RatingWrapper var rating: Double
    var price: Int
    var name: String
    
    init(id: String, rating: Double, price: Int, name: String) {
        self.id = id
        self.rating = rating
        self.price = price
        self.name = name
    }
    
    private static func randomVideoGame() -> VideoGame {
        VideoGame(id: randomId(), rating: randomRating(), price: randomPrice(), name: randomName())
    }
}

// MARK: - Book
class Book: Model {
    var id: String
    @RatingWrapper var rating: Double
    var price: Int
    var title: String
    
    init(id: String, rating: Double, price: Int, title: String) {
        self.id = id
        self.rating = rating
        self.price = price
        self.title = title
    }
    
    private static func randomBook() -> Book {
        Book(id: randomId(), rating: randomRating(), price: randomPrice(), title: randomTitle())
    }
}


// MARK: - FETCHERS
// MARK: - Car Fetcher
class CarFetcher: DataFetcher {
    static func getData() -> [Car] {
        (1...10).map { _ -> Car in
            Car(id: randomId(), rating: randomRating(), price: randomPrice(), make: randomMake())
        }
    }
}
// MARK: - Book Fetcher
class BookFetcher: DataFetcher {
    static func getData() -> [Book] {
        (1...10).map { _ -> Book in
            Book(id: randomId(), rating: randomRating(), price: randomPrice(), title: randomTitle())
        }
    }
}
// MARK: - Video Game Fetcher
class VideoGameFetcher: DataFetcher {
    static func getData() -> [VideoGame] {
        (1...10).map { _ -> VideoGame in
            VideoGame(id: randomId(), rating: randomRating(), price: randomPrice(), name: randomName())
        }
    }
}



// MARK: - DataProcessor
class DataProcessor<T: Model> {
    let data: [T]
    
    init(data: [T]) {
        self.data = data
    }
    
    func calculateTotalPriceOfAllElements() -> Int? {
        // First things first, Safety
        if(isEmpty()) { return nil }
        return data.reduce(0, { $0 + $1.price })
    }
    
    func calculateAveragePrice() -> Double? {
        if let totalPrice = calculateTotalPriceOfAllElements() { // calculateTotalPriceOfAllElements will check on its own if data is empty or not
            return Double(totalPrice) / Double(data.count) // Make sure we don't divide 0 here
        }
        return nil
    }
    
    func getItem(by id: String) -> [T] { // No need to worry for nil safety here
        // filter HoF won't run if there are no elements inside itself
        data.filter { $0.id == id }
    }
    
    func highestRating() -> [T] {
        let sorted = data.sorted { $0.rating > $1.rating }
        return sorted.filter { $0.rating == (sorted.first)?.rating }
    }
    
    func lowestRating() -> [T] {
        let sorted = data.sorted { $0.rating > $1.rating }
        return sorted.filter { $0.rating == (sorted.last)?.rating }
    }
    
    // MARK: Private sector
    private func isEmpty() -> Bool {
        data.count == 0
    }
}

// MARK: - [CLASS] Car Processor
class CarProcessor<T: FetcherObject>: DataProcessor<T> {
    let carData: [T]
    
    override init(data: [T]) {
        self.carData = data
        super.init(data: self.carData)
    }
}

// MARK: - [CLASS] Book Processor
class BookProccessor<T: FetcherObject>: DataProcessor<T> {
    let bookData: [T]
    
    override init(data: [T]) {
        self.bookData = data
        super.init(data: self.bookData)
    }
}

// MARK: - [CLASS] Video Game Processor
class VideoGameProccessor<T: FetcherObject>: DataProcessor<T> {
    let videoGameData: [T]
    
    override init(data: [T]) {
        self.videoGameData = data
        super.init(data: self.videoGameData)
    }
}

// Testing
let carsData = CarFetcher.getData()
//let carProcessor = CarProcessor<Car>(data: Cars)
//print(carProcessor.highestRating())

// MARK: - [CLASS] Controller
class Controller<T: Model> {
    let dataProcessor: DataProcessor<T>
    
    init(dataProcessor: DataProcessor<T>) {
        self.dataProcessor = dataProcessor
    }
    
    func printInfo() {
        dataProcessor.data.forEach { printTypeData(dataItem: $0) }
    }
    
    // MARK: Private section
    private func printTypeData(dataItem: T) {
        let typeOf = type(of: dataItem)
        switch typeOf {
        case is Car.Type:
            print("It's a \((dataItem as! Car).make) Car")
        case is Book.Type:
            print("It's a book, title: \((dataItem as! Book).title)")
        case is VideoGame.Type:
            print("It's a video game with the name of \((dataItem as! VideoGame).name)")
        default:
            print("No idea!")
        }
    }
}

let books = BookFetcher.getData()
let dataProcessor = DataProcessor(data: carsData)
let controller = Controller(dataProcessor: dataProcessor)

controller.printInfo()
