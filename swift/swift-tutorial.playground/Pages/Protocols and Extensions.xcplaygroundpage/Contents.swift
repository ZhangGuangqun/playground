//: [Previous](@previous)

// 协议和扩展

// 使用 protocal 来声明一个协议
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类，枚举，结构体都能采用协议 protocol

// 采用协议后，需要有和协议一样的属性和方法。
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
print(a.simpleDescription) // A very simple class.  Now 100% adjusted.

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
print(b.simpleDescription) // A simple structure (adjusted)

// 使用 extension 来向一个已经存在的类型添加功能，例如一个新的方法，一个计算属性。您可以使用扩展来将协议一致性添加到在其他地方声明的类型，甚至添加到从库或框架导入的类型。
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription) // The number 7

// 您可以像使用任何其他命名类型一样使用协议名称 - 例如，创建具有不同类型但都符合单个协议的对象集合。 使用类型为协议类型的值时，协议定义之外的方法不可用。
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Value of type 'ExampleProtocol' has no member 'anotherProperty'

//: [Next](@next)
