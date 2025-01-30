

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

func addValue(array: inout [String:[String]]) -> Void {
    for key in array.keys {
        let value = getString(title: "Enter \(key): ")
        array[key]?.append(value)
    }
}

func ajoutValeur(array: inout [String:[String]]) {
    guard let nombre = Int(getString(title: "Number of propositions: ")) else {
        print("Invalid number entered.")
        return
    }
    print()

    var count = nombre
    while count > 0 
    {
        addValue(array: &array)
        count -= 1
        print()
    }
}

func initArray() -> [String:[String]] 
{
    let array: [String: [String]] = ["Date":[], "Type":[], "Montant":[], "Titre":[]]
    return array
}

func max_length(array: [String]) -> Int {
    return array.map { $0.count }.max() ?? 0
}

func displayArray(mainArray: [String: [String]]) {
    guard !mainArray.isEmpty else {
        print("No data to display.")
        return
    }

    let header = "Livre de compte\n"
    let columnTitles = Array(mainArray.keys)
    var lengthArray = [Int]()
    
    for key in columnTitles {
        let maxValueLength = max_length(array: mainArray[key] ?? [])
        lengthArray.append(max(maxValueLength, key.count) + 2)
    }
    
    var output: [String] = []
    
    var titleRow = "|"
    for (index, key) in columnTitles.enumerated() {
        titleRow += key
        let padding = lengthArray[index] - key.count + 2
        titleRow += String(repeating: " ", count: padding)
        titleRow += "|"
    }
    let head:String = "+\(String(repeating: "-", count: titleRow.count - 2))+" 
    titleRow = head + "\n" + titleRow + "\n" + head
    output.append(titleRow)
    
    let maxRows = mainArray.values.map { $0.count }.max() ?? 0
    
    for rowIndex in 0..<maxRows 
    {
        var line = "+"
        var row = "|"
        for (colIndex, key) in columnTitles.enumerated() {
            let values = mainArray[key] ?? []
            let value = rowIndex < values.count ? values[rowIndex] : ""
            row += value
            let padding = lengthArray[colIndex] - value.count + 2
            row += String(repeating: " ", count: padding)
            row += "|"
            line += String(repeating: "-", count: lengthArray[colIndex] + 2)
            line += "+"
        }
        output.append(row)
        output.append(line)
    }
    
    print(header)
    for line in output {
        print(line)
    }
}


func main() {
    let name = getName()
    giveInfo(name: name)
    
    var mainArray = initArray()
    ajoutValeur(array: &mainArray)
    displayArray(mainArray: mainArray)
}


if CommandLine.arguments.contains("--run") {
    main()
}