@main struct SwiftPlayground {static func main() {

let DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let APPS = ["Youtube", "Discord"]
let SCOLDS = ["Your parents will hear about this one", "When will you learn?", "You should know better"]
let HOURS_PER_DAY = 24.0
let DECIMAL_PLACES = 10.0

let hourLimit : Double
let overLimit : Bool
let averageHours : Double

var totalHours = 0.0

func floor(num : Double, decimalPlaces : Double = 10.0) -> Double {
    return Double(Int(num * decimalPlaces)) / decimalPlaces
}

print("This is a cool screen time tracker", terminator: "\n\n")

print("What is the hour limit for each day? (from 0.0 to \(HOURS_PER_DAY)) ", terminator: "")
hourLimit = Double(readLine() ?? "") ?? Double.nan

print("", terminator: "\n")

if hourLimit < 0.0 || hourLimit > HOURS_PER_DAY || hourLimit.isNaN {
    print("Invalid hour limit")
    return
}

for day in DAYS {
    var hoursSpent = 0.0

    print("On \(day) how many hours did you spend on:")

    for app in APPS {
        print("\(app): ", terminator: "")
        let spentInput = Double(readLine() ?? "") ?? Double.nan
        if spentInput < 0.0 || spentInput > HOURS_PER_DAY || spentInput.isNaN {
            print("\nInvalid app timer")
            return
        }
        hoursSpent += spentInput
    }

    if hoursSpent <= HOURS_PER_DAY {
        print("You spent \(hoursSpent) hours on your screens on \(day)", terminator: "\n\n")
        totalHours += hoursSpent
    } else {
        print("Your screen time per day must be less than or equal to \(HOURS_PER_DAY)", terminator: "\n\n")
        return
    }
}

averageHours = floor(num: totalHours / Double(DAYS.count), decimalPlaces: DECIMAL_PLACES)

overLimit = averageHours > hourLimit

print("You spend \(averageHours) hours a day on average looking at screens")

if overLimit {
    print("You are over the limit by \(floor(num: averageHours - hourLimit, decimalPlaces: DECIMAL_PLACES))")
    print(SCOLDS.randomElement()!)
} else if averageHours == hourLimit {
    print("Congratulations, you are equal to the limit")
} else {
    print("Congratulations, you are under the limit by \(floor(num: hourLimit - averageHours, decimalPlaces: DECIMAL_PLACES))")
}

}}
