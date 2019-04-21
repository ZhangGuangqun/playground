//: [Previous](@previous)

// 对象和类

// 在 class 关键字后面跟随一个类的名字来创建一个类。给类声明一个属性和普通的声明一个常量和变量的写法是一样的，只不过在类中声明的属性属于类的上下文。同样的，声明一个方法和函数是同样的写法。

class Person {
    var name = "zhangguangqun"
    let greetWord = "hello"

//    类中声明的属性的需要初始化，否则编译出错
//    var age: Int  // stored property 'age' without initial value prevents synthesized initializers
    func selfIntroduction() -> String {
        return "\(greetWord), my name is \(name)."
    }
    func greet(name: String) -> String {
        return "\(greetWord), \(name)"
    }
}

// 创建类的实例，及使用实例来访问实例的属性和方法。
var p = Person()
print(p.selfIntroduction()) // hello, my name is zhangguangqun.
print(p.greet(name: "jack")) // hello, jack

// 类的初始化，使用 init 初始化 (注意 init 方法前没有 func 关键字，也不会有返回值)，init 方法可以重载。
class Fruits {
    var color: String
    var weight: Float = 0

    init(color: String) {
        self.color = color
    }
    
    init(color: String, weight: Float) {
//        使用 self 表示该实例，来区分实例属性和方法传进来的参数。
        self.color = color
        self.weight = weight
    }
    
    func description() {
        print("the color of this fruit is \(color), it weight \(weight)g")
    }
}

var apple = Fruits(color: "红色")
var banana = Fruits(color: "黄色", weight: 80)
apple.description() // the color of this fruit is 红色, it weight 0.0g
banana.description() // the color of this fruit is 黄色, it weight 80.0g

// 类的继承，子类覆盖父类的方法必须要在方法前写上 override 关键字。
// 对于子类没有自己的 init 初始化方法时，需要使用父类的 init 方法来初始化。对于子类有自己的 init 初始化方法时，它必须调用 super.init 。

class Apple: Fruits {
    var price: Double

//    init(color: String, price: Double) {
//        self.color = color
//        self.price = price
//    }

// 上面 init 这样的写法会产生如下错误：
//    1. error: 'super.init' isn't called on all paths before returning from initializer
//    2. error: 'self' used in property access 'color' before 'super.init' call self.color = color
//  从这两个错误信息可以看出，在子类的构造器中，父类的成员变量必须通过父类的designated initializer进行初始化。也就是说，我们必须调用super.init（第一个error），而且在调用super.init之前不能使用和访问任何父类的成员变量（第二个error）。
    
    init(color: String, price: Double) {
        self.price = price
        super.init(color: color)
    }
    
    override func description() {
        print("这是苹果")
    }
}

var appleFruit = Apple(color: "红色", price: 80)
appleFruit.description()

// 子类有自己的 init 方法，那么它只能调用自己 init 方法来初始化实例，不能调用父类的 init 方法。
// var appleFruit1 = Apple(color: "红色", weight: 80) // error: incorrect argument label in call (have 'color:weight:', expected 'color:price:')

// 除了存储简单的属性之外，属性还可以有 getter 和 setter.

class Banana: Fruits {
    var price: Double = 10
    
    var weightKg: Double {
        get {
            return Double(weight / 1000);
        }
        set {
            weight = Float(newValue * 1000)
        }
    }
}

var banana2 = Banana(color: "黄色", weight: 1000)
print(banana2.weightKg) // 1.0
banana2.weightKg = 0.5
print(banana2.weight) // 500.0

// 如果你不需要计算属性，但是任然需要在设置新的值后做些操作，使用 willSet 和 didSet 。
class FruitBasket {
    var apple: Apple {
        willSet {
            // 确保当 apple 属性被赋予新值时，banana 的 price 比 apple 的 price 低 2
            banana.price = newValue.price - 2
        }
    }
    
    var banana: Banana {
        willSet {
            // 确保当 banana 属性被赋予新值时，apple 的 price 比 banana 的 price 高 2
            apple.price = newValue.price + 2
        }
    }
    init(price: Double) {
        apple = Apple(color: "红色", price: price)
        banana = Banana(color: "黄色")
        banana.price = apple.price - 2
    }
}

var fruitBasket = FruitBasket(price: 10)
print(fruitBasket.apple.price) // 10.0
print(fruitBasket.banana.price) // 8.0
fruitBasket.apple = Apple(color: "红色", price: 12)
print(fruitBasket.apple.price) // 12.0
print(fruitBasket.banana.price) // 10.0

// 对于一个可选值的类的实例，可以在方法、属性、下标前写上 (?) 来访问。如果这个实例是 nil，那么在 ? 之后的会被忽略，这个表达式的值是 nil。如果可选值不为 nil，那么可选值会被展开。对于这两种情况，整个表达式的值都是一个可选值。
var a: Apple? = Apple(color: "红色", price: 10)
var price = a?.price

//: [Next](@next)
