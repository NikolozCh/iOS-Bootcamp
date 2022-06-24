import Foundation

// ------------------------- BANK ------------------------------
class Bank {
    var bankName: String
    var clients: [Client]
    var atm: ATM
    var cards: [Card]

    init(bankName: String, clients: [Client], atm: ATM, cards: [Card]) {
        self.clients  = clients
        self.atm      = atm
        self.cards    = cards
        self.bankName = bankName
    }
    
    func registerClient(client: Client) -> Bool {
        // If client is already registered
        // We inform that she/he can't be registered anymore
        if hasClientInSystem(for: client) { print("Client already exists"); return false }
        clients.append(client)
        return true // client successfully registered
    }
    
    func checkBalance(for client: Client) -> Balance? {
        if !hasClientInSystem(for: client) { print("Client is not our member!"); return nil }
        var answerBalance = Balance()
        client.clientCards.forEach { answerBalance += $0.balanceOfCard }
        return answerBalance
    }
    
    func allocateCard(for client: Client, which cardType: CardType) -> Bool {
        // We will be adding card to client our own
        if !hasCardInStorage(cardtype: cardType) { print("Not enough card in the storage"); return false }
        let card = Card(cardType: cardType)
        client.clientCards.append(card)
        return true
    }
    
    func requestCashout(for client: Client, by amount: Balance) -> Bool {
        if !atmHasEnoughCash(amount) { print("Sorry ATM doesn't have enough money"); return false }
        
        guard
            var optimalCardSecuredToCashout = findCardToCashout(client, amount)
        else {
            return false
        }
        optimalCardSecuredToCashout.balanceOfCard -= amount
        atm.balanceOfATM -= amount
        return true
    }
    
    func insertMoney(on client: Client, by amount: Balance) {
        // We will insert money on random card
        if var randomCard = client.clientCards.randomElement() {
            randomCard.balanceOfCard += amount
            atm.balanceOfATM += amount
        }
        else {
            print("Dude, you don't have the card, get it first!!!")
        }
    }
    
    func getPersonalInfo(for client: Client) -> String {
        return "About yourself | Name: \(client.name) | Surname: \(client.surname) | PersonalID: \(client.personalID)"
    }
    
    private func atmHasEnoughCash(_ amount: Balance) -> Bool {
        atm.balanceOfATM >= amount
    }
    
    private func findCardToCashout(_ client: Client, _ amount: Balance) -> Card? {
        var card: Card? = nil
        client.clientCards.forEach { el in
            if el.balanceOfCard >= amount { card = el; return }
        }
        return card
    }
    
    private func hasClientInSystem(for client: Client) -> Bool {
        clients.contains(where: { client.personalID == $0.personalID })
    }
    
    private func hasCardInStorage(cardtype cardType: CardType) -> Bool {
        var hasCard = false
        for i in 0..<cards.count {
            let currentCard = cards[i]
            if currentCard.cardType == cardType {
                // Looks like we have the card the user is requesting
                // Lets notify he/she and remove it from the storage
                hasCard = true
                cards.remove(at: i)
                break
            }
        }
        return hasCard
    }
    
    func addCardsToStorage(cards: [Card]) {
        cards.forEach { self.cards.append($0) }
    }
}


// ------------------------ CLIENT -----------------------------
class Client: Person {
    var name: String
    var surname: String
    var personalID: String
    var clientCards: [Card]
    // Client maybe user of other banks
    var banksRegisteredIn: [Bank]
    
    required init(name: String, surname: String, personalID: String) {
        self.name = name
        self.surname = surname
        self.personalID = personalID
        self.clientCards = [Card]() // when client is created, he/she has no cards :)
        self.banksRegisteredIn = [Bank]() // same applies for banks
    }
    
    func checkBalance(from bank: Bank) -> Balance? {
        return bank.checkBalance(for: self)
    }
    
    func request(cardType: CardType, from bank: Bank) {
        if !bank.allocateCard(for: self, which: cardType) { print("Sorry, bank wasn't able to allocate the card for you"); return }
        print("Your request about card allocation has been processed!")
        print("Please, visit our express center to get it")
    }
    
    func requestCashout(by amount: Balance, from bank: Bank) -> Balance? {
        // Returns balance
        // So client will be able to use money from that Balance (immitating the cash)
        if !bank.requestCashout(for: self, by: amount) { print("Not enough balance, sorry"); return nil }
        return amount // we returning ("cashing out of ATM") the balance to user, we have already subtracted it in the bank side
    }
    
    func addMoney(by amount: Balance, to bank: Bank) {
        // Lol, bank will always take your money :P
        // No need to check anything
        bank.insertMoney(on: self, by: amount)
    }
    
    func requestPersonalInfo(from bank: Bank) -> String {
        return bank.getPersonalInfo(for: self)
    }
}
// ------------------------ CARD ------------------------------
enum CardType {
    case credit
    case debit
}

struct Card {
    let cardType: CardType
    var balanceOfCard: Balance
    init(cardType: CardType) {
        // When initializing card
        // Balance is always zero :P
        self.cardType = cardType
        // Okay okay, for credit cards it can be 100GEL
        if cardType == .credit {
            self.balanceOfCard = Balance(amountGEL: 100)
        }
        else {
            self.balanceOfCard = Balance()
        }
    }
}
// ------------------------ A T M ------------------------------
class ATM {
    // ATM Holds the information about money currently in the ATM
    var balanceOfATM: Balance
    
    init(balance: Balance) {
        self.balanceOfATM = balance
    }
    convenience init() {
        self.init(balance: Balance())
    }
}
// ------------------------ Balance ------------------------------
// Making Balance a class instead of struct
// Since Bank is changing the client's balance
// We need it to be the reference type
class Balance {
    // Card contains value of how much money we have
    // Int, because we will consider 1GEL as 100 Tetri
    // Or, 1USD as 100 Cents
    // No need to deal with doubles here
    private(set) var amountGEL: Int // Making balance only getter, since we don't want anyone to interfere in it
    private(set) var amountUSD: Int
    private(set) var amountEUR: Int
    
    let eurToGELRate = 308 // 308 Tetri -> 3.08 Lari
    let usdToGELRate = 293
    
    init(amountGEL: Int) {
        self.amountGEL = amountGEL
        self.amountUSD = 0
        self.amountEUR = 0
    }
    init(amountUSD: Int) {
        self.amountGEL = 0
        self.amountUSD = amountUSD
        self.amountEUR = 0
    }
    init(amountEUR: Int) {
        self.amountGEL = 0
        self.amountUSD = 0
        self.amountEUR = amountEUR
    }
    convenience init() {
        self.init(amountGEL: 0)
    }
    
    static func +=(lhs: inout Balance, rhs: Balance) {
        lhs.amountGEL += rhs.amountGEL
        lhs.amountUSD += rhs.amountUSD
        lhs.amountEUR += rhs.amountEUR
    }
    static func -=(lhs: inout Balance, rhs: Balance) {
        lhs.amountGEL -= rhs.amountGEL
        lhs.amountUSD -= rhs.amountUSD
        lhs.amountEUR -= rhs.amountEUR
    }
    static func >=(lhs: Balance, rhs: Balance) -> Bool {
        let okGEL = lhs.amountGEL >= rhs.amountGEL
        let okUSD = lhs.amountUSD >= rhs.amountUSD
        let okEUR = lhs.amountEUR >= rhs.amountEUR
        return okGEL && okUSD && okEUR
    }
    private func totalInGEL() -> Int {
        // We are very patriotic bank, if user has enough money in gel, no worries
        // we will still give he/she the money
        // Just kidding, this is just for fun here
        self.amountGEL + self.amountEUR * eurToGELRate + self.amountUSD * usdToGELRate
    }
}
let atm = ATM(balance: Balance(amountUSD: 10000))

let bigBank = Bank(bankName: "GURJISTAN", clients: [], atm: atm, cards: [])

let c1 = Card(cardType: .debit)
let c2 = Card(cardType: .debit)
let c3 = Card(cardType: .debit)

let c4 = Card(cardType: .debit)
let c5 = Card(cardType: .credit)
let c6 = Card(cardType: .debit)

bigBank.addCardsToStorage(cards: [c1,c2,c3,c4,c5,c6])

let cl1 = Client(name: "Lela", surname: "Baghdoshvili", personalID: "0987")
let cl2 = Client(name: "Fridrix", surname: "Gogebashvili", personalID: "89122")

bigBank.registerClient(client: cl1)
bigBank.registerClient(client: cl2)

cl1.request(cardType: .credit, from: bigBank)
cl2.request(cardType: .debit, from: bigBank)

print(cl1.clientCards)
if let amount = cl1.checkBalance(from: bigBank) {
    print("You balance is: \(amount)")
}
else {
    print("Oopsie, you have no account in the bank")
}
