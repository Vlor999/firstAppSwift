func getString() -> String {
    if let name = readLine() {
        return name
    } else {
        return ""
    }
}

func getString(title: String) -> String {
    print(title, terminator: "")
    return getString()
}

func getName() -> String {
    return getString(title: "Enter your name: ")
}

func giveInfo(name: String) {
    print("Hello, \(name)!")
}

func addValue() -> [String] {
    var currentArray = [String]()
    let date = getString(title: "Enter the date: ")
    let type = getString(title: "Enter the type: ")
    let montant = getString(title: "Enter the amount: ")
    let titre = getString(title: "Enter the title: ")

    currentArray.append(contentsOf: [date, type, montant, titre])
    return currentArray
}

func ajoutValeur(array: inout [[String]]) {
    guard let nombre = Int(getString(title: "Number of propositions: ")) else {
        print("Invalid number entered.")
        return
    }
    print()

    var count = nombre
    while count > 0 {
        array.append(addValue())
        count -= 1
        print()
    }
}

func initArray() -> [[String]] {
    let array = [["Date", "Type", "Montant", "Titre"]]
    return array
}

func displayArray(mainArray: [[String]]) {
    guard !mainArray.isEmpty else {
        print("No data to display.")
        return
    }

    var output: String = ""
    let header:String = "Livre de compte\n"
    let columnCount:Int = mainArray[0].count
    var lengthArray = Array(repeating: 0, count: columnCount)

    for row in mainArray {
        for (index, item) in row.enumerated() {
            lengthArray[index] = max(item.count, lengthArray[index])
        }
    }

    for row in mainArray {
        for (index, item) in row.enumerated() {
            let padding:Int = lengthArray[index] - item.count + 2
            output += item + String(repeating: " ", count: padding)
        }
        output += "\n"
    }
    output = header + output

    print(output)
}


func main() {
    let name = getName()
    giveInfo(name: name)
    
    var mainArray = initArray()
    ajoutValeur(array: &mainArray)
    displayArray(mainArray: mainArray)
}

main()
