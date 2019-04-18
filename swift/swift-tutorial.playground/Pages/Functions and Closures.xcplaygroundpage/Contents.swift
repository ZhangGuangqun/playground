//: [Previous](@previous)

// 函数和闭包

// 1. 使用 func 来声明函数。调用函数时，传参和函数声明时的参数列表变量的名字保持一致。使用 -> 在返回参数前且在函数参数列表后。

func sayHello(name: String, day: String) -> String {
    return "hello, \(name), today is \(day)"
}
print(sayHello(name: "zhangsan", day: "星期三")) // hello, zhangsan, today is 星期三

// 2. 函数使用参数的名字作为标签，调用该函数时根据这个标签来传参数。另外，可以在参数的名字前写一个自定义的标签，或者写下划线 _ 来表示不使用标签。
func greet(userName name: String, _ day: String) -> String {
    return "hello, \(name), today is \(day)"
}
print(greet(userName: "zhangsan", "星期四")) // hello, zhangsan, today is 星期四

// 3. 使用一个元祖来构成一个混合的值。例如，一个函数返回多个值，一个元祖的元素能够通过名字或者编号来引用。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum) // 120
print(statistics.2) // 120

// 4. 函数能够嵌套，嵌套函数有外层函数声明的变量的访问权限。你能使用嵌套函数来组织在函数里很长或者很复杂的代码。
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 5. 函数是 first-class 类型的，这意味着一个函数能够返回另外一个函数作为它的返回值。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7) // 8

// 6. 一个函数可以用另外一个函数作为他的参数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)  // true

// 7. 闭包，看官网的例子细细体会😄
var result = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
// 数组的每个值乘以3
print(result) // [60, 57, 21, 36]

// 简写版
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// 更多例子
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

//: [Next](@next)
