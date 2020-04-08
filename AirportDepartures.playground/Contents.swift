import UIKit


//: ## 1. Create custom types to represent an Airport Departures display
//: ![Airport Departures](matthew-smith-5934-unsplash.jpg)
//: Look at data from [Departures at JFK Airport in NYC](https://www.airport-jfk.com/departures.php) for reference.
//:
//: a. Use an `enum` type for the FlightStatus (En Route, Scheduled, Canceled, Delayed, etc.)
//:
//: b. Use a struct to represent an `Airport` (Destination or Arrival)
//:
//: c. Use a struct to represent a `Flight`.
//:
//: d. Use a `Date?` for the departure time since it may be canceled.
//:
//: e. Use a `String?` for the Terminal, since it may not be set yet (i.e.: waiting to arrive on time)
//:
//: f. Use a class to represent a `DepartureBoard` with a list of departure flights, and the current airport
let userCalendar = Calendar.current

enum FlightStatus: String {
    case enRoute = "enRoute"
    case scheduled = "Scheduled"
    case delayed = "Delayed"
    case cancelled = "Cancelled"
    case boarding = "Boarding"
}

struct Airport {
    var destination: String
}

struct Flight {
    var departureTime: Date?
    var terminal: String?
    var status: FlightStatus
}

class DepartureBoard{
    var departureFlights: [Flight]
    let currentAirport: String
    
    init(departureFlights: [Flight], currentAirport: String) {
        self.departureFlights = departureFlights
        self.currentAirport = currentAirport
    }
}
//: ## 2. Create 3 flights and add them to a departure board
//: a. For the departure time, use `Date()` for the current time
//:
//: b. Use the Array `append()` method to add `Flight`'s
//:
//: c. Make one of the flights `.canceled` with a `nil` departure time
//:
//: d. Make one of the flights have a `nil` terminal because it has not been decided yet.
//:
//: e. Stretch: Look at the API for [`DateComponents`](https://developer.apple.com/documentation/foundation/datecomponents?language=objc) for creating a specific time


let flight1 = Flight(departureTime: Date(), terminal: "5", status: .enRoute)
let flight2 = Flight(departureTime: Date(), terminal: nil, status: .enRoute)
let flight3 = Flight(departureTime: nil, terminal: "11", status: .cancelled)

var allFlights: [Flight] = []
allFlights.append(flight1)
allFlights.append(flight2)
allFlights.append(flight3)


var myDepartureBoard = DepartureBoard(departureFlights: allFlights, currentAirport: "My Airport")

//: ## 3. Create a free-standing function that can print the flight information from the `DepartureBoard`
//: a. Use the function signature: `printDepartures(departureBoard:)`
//:
//: b. Use a `for in` loop to iterate over each departure
//:
//: c. Make your `FlightStatus` enum conform to `String` so you can print the `rawValue` String values from the `enum`. See the [enum documentation](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html).
//:
//: d. Print out the current DepartureBoard you created using the function
func printDepartures(departureBoard: DepartureBoard) {
    
    var depBoard: [Flight] = []
    
    for flights in [myDepartureBoard.departureFlights] {
        depBoard.append(contentsOf: flights)
        print(depBoard)
    }
}
printDepartures(departureBoard: myDepartureBoard)
    
//: ## 4. Make a second function to print print an empty string if the `departureTime` is nil
//: a. Createa new `printDepartures2(departureBoard:)` or modify the previous function
//:
//: b. Use optional binding to unwrap any optional values, use string interpolation to turn a non-optional date into a String
//:
//: c. Call the new or udpated function. It should not print `Optional(2019-05-30 17:09:20 +0000)` for departureTime or for the Terminal.
//:
//: d. Stretch: Format the time string so it displays only the time using a [`DateFormatter`](https://developer.apple.com/documentation/foundation/dateformatter) look at the `dateStyle` (none), `timeStyle` (short) and the `string(from:)` method
//:
//: e. Your output should look like:
//:
//:     Destination: Los Angeles Airline: Delta Air Lines Flight: KL 6966 Departure Time:  Terminal: 4 Status: Canceled
//:     Destination: Rochester Airline: Jet Blue Airways Flight: B6 586 Departure Time: 1:26 PM Terminal:  Status: Scheduled
//:     Destination: Boston Airline: KLM Flight: KL 6966 Departure Time: 1:26 PM Terminal: 4 Status: Scheduled
func printDepartures2(departureBoard: DepartureBoard) {
    
    for flights in myDepartureBoard.departureFlights {
        if let unwrappedDepartureTime = flights.departureTime {
            return unwrappedDepartureTime
            
            if let unwrappedTerminal = flights.terminal {
                return unwrappedTerminal
            } print("Destination: \(unwrappedDepartureTime)")
        }
    }
    
    
    
    
    
    
    
//    for flights in [myDepartureBoard.departureFlights] {
//        depBoard.append(contentsOf: allFlights)
//        print(depBoard)
    }

    


//: ## 5. Add an instance method to your `DepatureBoard` class (above) that can send an alert message to all passengers about their upcoming flight. Loop through the flights and use a `switch` on the flight status variable.
//: a. If the flight is canceled print out: "We're sorry your flight to \(city) was canceled, here is a $500 voucher"
//:
//: b. If the flight is scheduled print out: "Your flight to \(city) is scheduled to depart at \(time) from terminal: \(terminal)"
//:
//: c. If their flight is boarding print out: "Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon."
//:
//: d. If the `departureTime` or `terminal` are optional, use "TBD" instead of a blank String
//:
//: e. If you have any other cases to handle please print out appropriate messages
//:
//: d. Call the `alertPassengers()` function on your `DepartureBoard` object below
//:
//: f. Stretch: Display a custom message if the `terminal` is `nil`, tell the traveler to see the nearest information desk for more details.
func alertStatus(of status: FlightStatus) {
    
    switch status {
        
    case .enRoute:
        print("We're sorry your flight to Cleveland is cancelled. We're going to give you 500 dollars for some reason")
    case .scheduled:
        print("Your flight to (city) is scheduled to depart at 5:30 from terminal: 5")
    case .delayed:
        print("Sorry your flight is delayed")
    case .cancelled:
        print("your flight is cancelled")
    case .boarding:
        print("Your Flight is boarding")
    }
}

alertStatus(of: FlightStatus.delayed)
//: ## 6. Create a free-standing function to calculate your total airfair for checked bags and destination
//: Use the method signature, and return the airfare as a `Double`
//:
//:     func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
//:     }
//:
//: a. Each bag costs $25
//:
//: b. Each mile costs $0.10
//:
//: c. Multiply the ticket cost by the number of travelers
//:
//: d. Call the function with a variety of inputs (2 bags, 2000 miles, 3 travelers = $750)
//:
//: e. Make sure to cast the numbers to the appropriate types so you calculate the correct airfare
//:
//: f. Stretch: Use a [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) with the `currencyStyle` to format the amount in US dollars.

func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
    
    let doubleDistance = Double(distance)
    let doubleTravelers = Double(travelers)
    let doubleBags = Double(checkedBags)
    
    let distanceinMiles = doubleDistance * 0.10
    let pricePerTraveler = doubleTravelers + doubleBags
    
    let totalAirFare =  pricePerTraveler * (doubleBags + distanceinMiles + doubleTravelers)
    return totalAirFare
    
}

print(calculateAirfare(checkedBags: 2, distance: 2000, travelers: 3))

