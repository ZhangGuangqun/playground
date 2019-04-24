//: [Previous](@previous)

// 枚举和结构体

// 使用 enum 来创建一个枚举，像创建类和其他命名的类型一样，枚举可以有方法。
// 枚举的 rawValue 从 0 开始记数，依次加 1，如果某个 case 赋了特殊的值，那么从这个之后的再在一个的基础上进行加 1 记数。

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    case test = 20
    case test2

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print(aceRawValue) // 1
print(Rank.jack.rawValue) // 11
print(Rank.test.rawValue)  // 20
print(Rank.test2.rawValue)  // 21

// 枚举的类型可以是 String 和浮点型

enum Sports: String {
    case football, basketball
    case running = "run"
}

print(Sports.football.rawValue) // football
print(Sports.running.rawValue) // run

enum Eyesight: Float {
    case a
    case b
    case c = 5.2
}

print(Eyesight.a.rawValue) // 0.0
print(Eyesight.c.rawValue) // 5.2

// 可以使用 rawValue 来初始化一个枚举
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

// 枚举的 case 值就是实际的值，而不仅仅写它们的 rawValue 一种方式，如果没有很有意义的值，可以不必写。
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }

    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "diamonds"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(Suit.spades.color())  // black

// 上面枚举例子在它定义时就已经确定了，并且相同的 case 的原始值都相同。还有一种情况是，枚举关联的原始值可以在它实例化时才确定，并且原始值可以不同

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
    case let.result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).") // Sunrise is at 6:00 am and sunset is at 8:09 pm.
    case let .failure(message):
        print("Failure...  \(message)")
}

// 使用 struct 关键字来创建一个结构体，结构体支持很多与类相同的行为，包括方法和初始化方法。其中最重要的不同是结构体是一直被拷贝在传值的时候，而类是被当作引用来传递的。

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//: [Next](@next)
