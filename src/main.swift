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
    return []
}

func displayArray(mainArray: [[String]]) {
    for arr in mainArray 
    {
        for item in arr 
        {
            print(item, terminator: "; ")
        }
        print()
    }
}

func main() {
    let name = getName()
    giveInfo(name: name)
    
    var mainArray = initArray()
    ajoutValeur(array: &mainArray)
    displayArray(mainArray: mainArray)
}

main()
