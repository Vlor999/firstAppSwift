// Making a a simple tabke of contents 

func getString()-> String{
    if let name = readLine(){
        return name
    } 
    else 
    {
        return ""
    }
}


func getString(title: String)->String {
    print(title, terminator: "")
    return getString()
}


func getName()->String {
    return getString(title: "Enter your name: ")
}


func giveInfo(name: String)->Void {
    print("Hello, \(name)!")
}


func createDico()->[String: String] {
    var dico = [String: String]()
    dico["1"] = "Chapter 1: Getting debutting"
    dico["2"] = "Chapter 2: Basic Operations"
    dico["3"] = "Chapter 3: Strings and Characters"
    dico["4"] = "Chapter 4: Collection Types"
    dico["5"] = "Chapter 5: Control Flow"
    return dico
}


func main()->Void {
    let name = getName()
    giveInfo(name: name)
}


main()
