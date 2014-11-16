var welcome: String


welcome = "SNAFU"

println("Hey \(welcome)")

let minValUInt32 = UInt32.min
println(minValUInt32)
let maxValUInt32 = UInt32.max
println(maxValUInt32)


//let big: Int8 = Int8.max + 1 //error

let two1000 :UInt16 = 2_000
println(two1000)

let one:UInt8 = 1
let two1001 = two1000 + UInt16(one) // Type casting
println(two1001)

let pi = 3.14159

let int = Int(pi)
let double = Double(int)

typealias AudioSample = UInt8

var maxAmp = AudioSample.max


var boolean :Bool

//let boolean = 12

boolean = true
boolean = false

if boolean {
    println("I have to make it to MIT ")
}else{
    println("I have to make it to MIT  : 2 ")
}

let i = 100

//if i {
    
//}

if i == 100 {
    println("\(i)")
}

let http404 = (404,"Not Found")

let (tuple1 ,tuple2) = http404
println("The tuple 1 is \(tuple1)")
println("The tuple 2 is \(tuple2)")
println("The tuple 1 is \(http404.0)")
println("The tuple 2 is \(http404.1)")



let http200Status = (statusCode:200 , description:"OK")

println("\(http200Status.statusCode)")
println("\(http200Status.description)")

let possiNum = "123"
let convNum = possiNum.toInt()
println("\(convNum)")
println("\(convNum!)") //Unwrapping


if convNum != nil
{
    println("converted Num contains something \(convNum)")
    println("converted Num contains something \(convNum!)")
}

if let conv = convNum
{
println("\(conv)")
}


let wrnNum = "Halleuh"
let wrngNum = wrnNum.toInt()
println("\(wrngNum)")
println("\(wrngNum)") //Unwrapping

println("If you unwrap a nil optional then all hell breaks loose")

if let wrng = wrngNum {
    println("\(wrng)")
}else{
    println("No value printed as nil in wrngNum")
}


var serverResp :Int? = 404
serverResp = nil // Optional Int can be set to nil 


var serverResp2 :Int = 404
//serverResp2 = nil // Non Optional Int cannot be set to nil

var surveyAnswer: String?
println(surveyAnswer)

let assumedstring : String! = "AN ERROR"
let implictString:String = assumedstring


var age = -1

assert(age >= -2 ,"Not above 18")

//assert(age >= 18 ,"Not above 18")



let (x,y) = (1,2)

let dog:Character = "D"
let cow:Character = "C"

let dogcow = dog + cow

println("\(dogcow)")

let h1 = "Hello"
let h2 = "WOrld"
let h3 = h1 + " " + h2

println(h3)

var num = 9 % 4
println(num)
num = -9 % 4
println(num)
var num2 = 9 % 2.5
println(num2)

var l = 0
println(++l)
l += 2
println(l)
l = 0
++l
println(l)
l++
println(l)
l = l + 2
println(l)

let three = 3
let minus3 = -three
let notminus3 = -minus3
println(notminus3)


let name = "world"

if name == "World"
{
    println("A nuked B ")
}else{
    println("B nuked A ")
}

var boo = (name == "world")


println(boo ? "B nuked A " : "A nuked B ")


var a : Int?

println(a)

var b = 5

println(a != nil ? a! : b)
println(a ?? b)

a = 10
println(a != nil ? a! : b)
println(a ?? b)


for index in 1...5 {
    println("\(index) times 5 = \(index*5)")
}
for index in 1..<5 {
    println("\(index) times 5 = \(index*5)")
}



var emptyString = ""
var emptyString2 = String()
if emptyString.isEmpty {
    println("!")
}


var q = "String"
var k = "Go to HELL"

var p = q + " " + k
println(p)

q += (" " + k)
println(q)

for character in "MIT GOAL"{
println(character)
}

let s : Character = "M"
var mit : String = "MIT"
mit.append(s)
println(mit)

let multi = 5
let message = "\(multi) times 2.5 is \(Double(multi) * 2.5)"

println(countElements(message))


let romeoAndJuliet = [
"ACT 1 Scene 1 : Verona ,A public place",
"ACT 1 Scene 2 : Capulet's mansion",
    "ACT 1 Scene 3 : Capulet's mansion",
    "ACT 1 Scene 4 : Capulet's mansion",
    "ACT 1 Scene 5 : Capulet's mansion",
    "ACT 1 Scene 6 : Capulet's mansion",
    "ACT 1 Scene 7 : Capulet's mansion"
    
]

var act1 = 0
for scene in romeoAndJuliet{
    if scene.hasPrefix("ACT 1")
    {
        act1++
    }
}
println(act1)

var mansion = 0
for scene in romeoAndJuliet{
    if scene.hasSuffix("mansion")
    {
        mansion++
    }
}
println(mansion)



var shoppingList :[String] = ["Eggs","Milk"]
var ShoppingList = ["Eggs","Milk"]

println(shoppingList.count)

shoppingList.append("MIT")

shoppingList.append("WILL")

println(shoppingList.count)

shoppingList += ["Guido","Apple"]

println(shoppingList.count)

shoppingList[0...1] = ["I","HAVE"]

println(shoppingList)

shoppingList[shoppingList.count - 2] = "REACH"
shoppingList[shoppingList.count - 1] = "GOAL"

println(shoppingList)

shoppingList.insert("I WILL" ,atIndex: 0)

println(shoppingList)

let iwill = shoppingList.removeAtIndex(0)
println(iwill)

println(shoppingList)


var EmptyArray : [Int] = []

var emptyArray = [Int]()

var threeDoubles = [Double] (count:10 ,repeatedValue:0.0)

var aiport: [String: String] = ["mit":"MIT","sandeep":"SANDEEP"]

println(aiport["mit"])

println(aiport["mit"]!)


var airport :[String:Int] = ["MIT" : 100 ,"SANDEEP" : 10]

println(airport["MIT"])
println(airport["MIT"]!)

aiport.count

airport.count

airport["POOR"] = 1000000

airport.count

if let oldVal = airport.updateValue(100, forKey: "SANDEEP"){
    println(oldVal)
}

var poor = airport["POOR"]
var poorNot = airport["POORER"]
println(poor)
println(poor!)
println(poorNot)
println(poorNot) // No unwrapping of a null optional var 

airport["APPLE"] = 12321

println(airport["APPLE"])

//airport["APPLE"] = nil

println(airport)

var removedVal = airport.removeValueForKey("APPLE")

println(airport.keys)
println(airport.values)

for key in airport.keys{
    println(key)
    
}

var empDict = [Int:String]()
empDict[12] = "JSJJA"
empDict = [:]

println(10.hashValue)

println(1_333)
println(1333)

let somePoint = (1,1)

switch somePoint{
case(0,0):
    println("origin")
case(_,0):
    println("On x axis")
default:
    println("THE WORLD IS WRONG")
    
    
}

let anotherPoint = (2,3)

switch anotherPoint{
    
case(2,let x):
    println("\(x)")


case let(x,y):
    println("I am mad")
}


var lp :Int = 1

switch lp {
    
case 1:
    println(1)
    fallthrough
case 2:
    println(2)
    fallthrough
default :
    println("default")
    
}


func sayHello(personName :String = "Sandeep" , fsk :String ) -> String{
    
    let greeting = "HEllo, " + personName + fsk + "!"
    return greeting
}

println(sayHello(personName: "Sandeep" ,"MIT"))
println(sayHello(personName: "Sand","ME"))

println(sayHello("ME"))


func printAndCount(stringToPrint: String) ->Int {
    println(stringToPrint)
    return countElements(stringToPrint)
}

var a2 : Int? = printAndCount("SAndeep")

func printWithoutCount(StringNot : String) {
    printAndCount(StringNot)
}

//var a1 : Int? = printWithoutCount("Sandeep")


func minMax(array :[Int])->(max:Int , min:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin
        {
            currentMin = value
        }
        else if (value > currentMax)
        {
            currentMax = value
        }
    }
    return (currentMax,currentMin)
}

println(minMax([1,2,3,4,5]))

var bound = minMax([1,2,3,4,5])

println(bound.max)
println(bound.min)


func multiply( num1 n1:Int , num2 n2:Int)->Int{
    return n1*n2
}


println(multiply(num1: 2, num2: 4) )



func multiply2( #n1:Int , #n2:Int)->Int{
    return n1*n2
}

println(multiply2(n1: 2, n2: 4) )

func containsChac(#string:String ,#characterToFind: Character) -> Bool{
    for character in string {
        if character == characterToFind{
           return true
        }
    }
    return false
}

containsChac(string: "Sandeep", characterToFind: "L")


func addTwoInts(a:Int ,b:Int) -> Int{
    return a + b
}


var functionType : (Int,Int) -> Int = addTwoInts

functionType(1,2)



func functionPassing( Function: (Int,Int) -> Int ,a:Int,b:Int){
    println(Function(a,b))
}

println(functionPassing(addTwoInts , 3 , 4))

func functionPassing2( Function: (Int,Int) -> Int ,a:Int,b:Int)->Int{
    return (Function(a,b))
}

println(functionPassing2(addTwoInts,5,6))





//Returning a function 

func stepBack(input : Int) -> Int{
    return input - 1
}

func stepForward(input : Int) -> Int{
    return input + 1
}

func step(bool :Bool) -> (Int -> Int) {
    return bool ? stepForward : stepBack
}

func passFunc(Func :Int ->Int ,input :Int)->Int{
    return Func(input)
}


passFunc(step(true), 8)
// This works , it takes in as its input a function which return s a function , and to that returned fucntion , it applies the value that is given ..... AMzaing


var array :[String] = ["A","B","S","D","L"]


var reversed = sorted(array,{(s1:String,s2:String) -> Bool in return s1 > s2})

println(reversed)


func functionPass( Function: (Int,Int) -> Int , a:Int ,b:Int )->Int{
    var value = (Function(a,b))
    println(value)
    return value
}


var intL = functionPass({ (a:Int , b:Int )-> Int in return a*b },5,6)

var intK = functionPass({ a , b in return a * b }, 5 , 6 )

var intQ  = functionPass({ a , b in a * b }, 5 , 6 )

var intP  = functionPass({  $0 * $1 }, 5 , 6 )

var intR  = functionPass( * , 5 , 6 )

println(intR)

println(intP)

println(intQ)

println(intL)

println(intK)

var lion = [String]()
println(lion)





struct Point
{
    
    var x = 0.0
    var y = 0.0
}


//////
var pune = Point()
pune.x = 12
pune.y = 12
///////
struct Size
{
    var width = 0.0
    var height = 0.0
}

struct Rect
{
    var origin = Point()
    var size = Size()
    var center : Point //Computed property
    {
        get
        {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX , y :centerY)
        }
        set(newCenter)
        {
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}


struct unitRect
{
    var origin = Point()
    var size :Size //Computer Property
    {
        get
        {
            let Sizex = origin.x / 10.0
            let Sizey = origin.y / 10.0
            return Size(width: Sizex, height: Sizey)
        }
        set(newSize)
        {
            println("SETY")
            size.width = newSize.width
            size.height = newSize.height
        }
    }
    var center :Point // Computed property
    {
        get
        {
           
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter)
        {
           origin.x = newCenter.x - (size.width/2)  // For size simply changing the size is enough , but for the center changing the center won't change the origin and hence wrong....
           origin.y = newCenter.y - (size.height/2)
        }
    }
    
}


var square = Rect(origin: Point(x: 100, y: 100), size: Size(width: 50, height: 50))
let initial = square.center

square.center = Point(x: 130, y: 130)
let origin = square.origin

var square2 = unitRect(origin: Point(x: 100, y: 100))
let size = square2.size
let center = square2.center
//square2.center = Point(x: 130, y: 130)
//square2.size = Size(width: 50, height: 50)
//let origin2 = square2.origin









class StepCounter
{
    var totalStep : Int = 0
    {
        willSet
        {
         println("Will set : \(newValue)")
        }
        didSet
        {
            if totalStep > oldValue
            {
                println("Added \(totalStep - oldValue) steps")
            }
            println("Did set : \(oldValue)")
        }
    }
}

let stepcounter = StepCounter()
stepcounter.totalStep = 100
stepcounter.totalStep = 1000




class Counter
{
    var count = 0
    func incerment() ->()
    {
        count++
    }
    func incrementBy(num:Int) ->()
    {
        count += num
    }
    
    func reset()
    {
        count = 0
    }
}


let counter = Counter()
counter.count
let nCount = Counter()
nCount.count

counter.incerment()
counter.count
nCount.count



class PowerCounter
{
    var count = 0
    func incrementBy(#amount :Int , _ noOfTimes :Int)
    {
        count += amount * noOfTimes
    }
}


var counter2 = PowerCounter()
counter2.incrementBy(amount: 12, 3)


struct POINT {
    var x = 0.0
    var y = 0.0
    func istotheRightOfX(x:Double) -> Bool
    {
        return self.x > x // Here self refers to the porperty of the instance , not the function parameter
    }
}


var puny = POINT(x: 12, y: 12)

struct Poi
{
    var x = 0.0 , y = 0.0
    mutating func moveBy(#deltaX : Double , deltaY : Double)
    {
        x += deltaX
        y += deltaY
    }
}

var somePoi = Poi(x: 12, y: 10)
somePoi.moveBy(deltaX: 11, deltaY: 19)
println(somePoi.x)
println(somePoi.y)

struct Poi2
{
    var x = 0.0 , y = 0.0
    mutating func moveBy(#deltaX : Double , deltaY : Double)
    {
        self = Poi2(x: self.x + deltaX, y: self.y + deltaY)
    }
}


var somePoi2 = Poi2(x: 12, y: 10)
somePoi2.moveBy(deltaX: 11, deltaY: 19)
println(somePoi2.x)
println(somePoi2.y)

enum TriStateSwitch:Int
{
    case off = 1,low,high
    mutating func next()
    {
        switch self
        {
        case off:
            self = low
        case low:
            self = high
        case .high:
            self = off
        }
    }
}

var light = TriStateSwitch.off
light.next()
println(light)
var io = TriStateSwitch.high.toRaw()




















































