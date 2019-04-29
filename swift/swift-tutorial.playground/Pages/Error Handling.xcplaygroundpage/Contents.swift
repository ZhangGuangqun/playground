//: [Previous](@previous)

// 错误处理

// 可以使用任何类型去采用 Error 协议来定义错误。
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// 用 throw 关键字抛出一个错误，用 throws 来标记一个方法可以抛出一个错误。如果在一个方法中抛出了错误，这个方法就会立刻返回，调用这个方法的地方需要处理这个错误。
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// 有几种方式来处理错误。一种方式是使用 do-catch, 在 do 的块之内，在可能抛出错误的方法前写上 try。除非给错误自定义名字，否则错误会自动命名为 error 。
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error) // noToner
}

// 可以使用多个 catch 块来处理特殊的错误。在 catch 写的模式和在 switch-case 的 case 是一样的。
do {
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.noToner {
    print("PrinterError.noToner") // PrinterError.noToner
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// 另外一个处理错误的方式是用 try? 来将结果转换为可选的。如果一个函数抛了一个错误，这个特定的错误被丢弃了，函数的结果是 nil，否者，结果是这个方法返回的可选值类型的值。
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print(printerSuccess)
print(printerFailure)

// 在 defer 关键字后写一个代码块，该代码块在函数返回之前且在函数中的所有其他代码之后执行。 无论函数是否抛出错误，都会执行代码。
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen) // false

//: [Next](@next)
