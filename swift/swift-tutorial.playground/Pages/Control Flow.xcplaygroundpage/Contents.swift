//: [Previous](@previous)

// 流程控制
// 用 if 和 switch 来做条件控制，用 for-in, while, 和 repeat-while 来做循环。

let individualScores = [75, 86, 62, 50]
var teamScores = 0
for score in individualScores {
//    if score {     // if 后的条件需要是 Bool 的值或者表达式
    if score >= 80 {
        teamScores += 2
    } else if score >= 60 && score < 80 {
        teamScores += 1
    } else {
        teamScores -= 1
    }
}
print(teamScores)

// 可以将 if 和 let 组合使用，来处理变量值可能缺失的情况(值为 nil)。在变量的类型后加上 (?) 来表示该变量值是可选的
var optionalString: String?
print(optionalString)

var optionalName: String? = "zhang"
if let name = optionalName {
    print("hello \(name)") // hello zhang
}

// 另一种处理可选值的变量的情况是使用 (??) 操作符，如果可选值缺失了，那么就会使用默认值。
let nickName: String? = nil
let defaultName =  "Zhang San"
let name = nickName ?? defaultName
print(name)

// Switches 支持任何类型的数据和多样的比较的类型。每个 case 后面不需要加 break, 执行一个分支后继续往后执行。
let fruits = "香蕉"
switch fruits {
case "苹果":
    print("是苹果")
case "橘子", "香蕉":
    print("橘子和香蕉中的一种")
case let x where x.hasSuffix("子"):
    print("水果名是以子结尾")
default:
    print("猜不出来是什么")
}


// swift 中的 while 和其他语言一样。repeat-while 和其他语言的 do-while 一样。
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// 使用 ..< 来遍历一个范围的索引，..< 不包括上界值。使用 ... 可以包含两边的值

var total = 0
for i in 1..<4 {
    total += i
}
print(total)

//: [Next](@next)
