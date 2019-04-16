// swift 的 hello world:
print("hello world")

// 1. 简单值
// 1.1 用 var 来定义变量，用 let 来定义常量，常量值不能变
var a = 10
a = 20
let b = 20

// 1.2 声明变量时可以不显示地写出变量值的类型，让编译器根据变量值推断变量的类型。如果变量值没有足够的信息来推断出变量的类型，可以显示声明变量的类型
let valueInterger = 10
let valueDouble = 10.0
let explicitDouble: Double = 10

// 1.3 值的类型不会隐示的转换，只能显示的进行转换
let label = "This width is "
let width = 1
let widthLabel = label + String(width)

// 1.4 一种简单的方式将值嵌入到字符串里
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// 1.5 多行的字符串用 """
let quotation = """
Even though there's whitespace to the left,
the actual lines aren't indented.
Except for this line.
Double quotes (") can appear without being escaped.
\"
I still have \(apples + oranges) pieces of fruit.
"""

// 1.6 数组和字典
// 数组的类型需要一致，字典的值也需要一致
var arr = [1, 2, 3]
arr.append(4)
arr[0] = 2
var dict = ["k1": "v1", "k2": "v2"]
dict["k3"] = "k3"
print(dict)

// 1.7 定义空的数组和空的字典
var emptyArray = [String]()
var emptyDictionary = [String: String]()

// 如果数组和字典的值能够被推断，那么可以用 [] 和 [:] 来表示。比如给一个变量赋新值或者给一个方法传参。
arr = []
dict = [:]

//: [Next](@next)
