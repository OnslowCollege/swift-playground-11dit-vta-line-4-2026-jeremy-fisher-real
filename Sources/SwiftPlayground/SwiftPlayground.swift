@main struct SwiftPlayground {static func main() {

// Uses (terminator: "") to append readline input to end of line

do { // Other types of code to fufil criteria
    var String = "Hello, world!"
    String = "Chicken"
    String += "Banana"
    while false {}
}

// Declares constants using SCREAMING_SNAKE_CASE

let DAY_NAMES = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let SCOLD_LIST = ["Your parents will hear about this one", "When will you learn?", "You should know better"]
let HOURS_PER_DAY = 24.0
let DECIMAL_PLACES = 100.0

// Declares values to be used

let hourLimit : Double
let averageHours : Double
var totalHours = 0.0

// Declares functions

/// Converts from double-int-double to round down, mults and divs with decimals to add more places
func floorWithDecimals(num : Double, decimals : Double = DECIMAL_PLACES) -> Double {
    return Double(Int(num * decimals)) / decimals
}

// Enters main program

print("This is a cool screen time tracker")

print("What is the hour limit for each day? (from 0.0 to \(HOURS_PER_DAY)) ", terminator: "")
hourLimit = Double(readLine() ?? "") ?? Double.nan // Converts input to double, NaN if impossible

if hourLimit < 0.0 || hourLimit > HOURS_PER_DAY || hourLimit.isNaN {
    print("Invalid hour limit")
    return // Exits the main function in the playground
}

for day in DAY_NAMES {
    print("On \(day) how many hours did you spend on all social networks in total? ", terminator: "")

    let spentInput = Double(readLine() ?? "") ?? Double.nan

    // Checks input is in bounds and not NaN
    if spentInput < 0.0 || spentInput > HOURS_PER_DAY || spentInput.isNaN {
        print("Invalid hours spent, defaulting to hour limit")
        totalHours += hourLimit // Default case
        continue // Skips rest of code and moves to the next iteration
    }

    totalHours += spentInput
}

// Uses floorWithDecimals to round down with decimals (2dp)
averageHours = floorWithDecimals(num : totalHours / Double(DAY_NAMES.count));
print("You spend \(averageHours) hours a day on average looking at screens")

if averageHours > hourLimit {
    print("You are over the limit by \(floorWithDecimals(num : averageHours - hourLimit))")
    print(SCOLD_LIST.randomElement()!) // Picks a random scold to tell the user
} else if averageHours == hourLimit { // Edge case
    print("Congratulations, you are equal to the limit")
} else {
    print("Congratulations, you are under the limit by \(floorWithDecimals(num : hourLimit - averageHours)) ")
}

}}
