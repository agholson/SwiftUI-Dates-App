//
//  ContentView.swift
//  Dates App
//
//  Created by Leone on 3/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentDate = Date()
    
    let calendar = Calendar.current
    private var startDateOfMonth: String {
        let components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        let startOfMonth = Calendar.current.date(from: components)!
        return format(date: startOfMonth)
    }
    
    private var endDateOfMonth: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 1
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return format(date: endOfMonth)
    }
    
    // Get the list of dates for the current month
    private var listOfDates: [Date] {
        let month = Date()
        
        //get the current Calendar for our calculations
        let cal = Calendar.current
        //get the days in the month as a range, e.g. 1..<32 for March
        let monthRange = cal.range(of: .day, in: .month, for: month)!
        //get first day of the month
        let comps = cal.dateComponents([.year, .month], from: month)
        //start with the first day
        //building a date from just a year and a month gets us day 1
        var date = cal.date(from: comps)!

        //somewhere to store our output
        var dates: [Date] = []
        //loop thru the days of the month
        for _ in monthRange {
            //add to our output array...
            dates.append(date)
            //and increment the day
            date = cal.date(byAdding: .day, value: 1, to: date)!
        }
        return dates
    }
    
    var body: some View {
        NavigationView {
            VStack {
                DateView(date: $currentDate)
                    .padding()
                Divider()
                Spacer()
               
                // MARK: - Date Cells
                // Create a nice scroll view for the user
                ScrollView {
                    // Use a LazyVStack in order to not unnecessarilly create elements for things off of screen
                    // This uses less memory
                    LazyVStack {
                        // Loop through each of the dates in the month
                        ForEach(listOfDates, id: \.self) { date in
                            
                            NavigationLink {
                                // Navigate to a new page here
                                Text("Navigated to \(date)")
                            } label: {
                                // Create a DateRow for each date
                                DateRowView(sideDate: date)
                            }
                        }
                    }
                }
                
                Text(format(date: currentDate))
                Divider()
                Text(startDateOfMonth)
                Text(endDateOfMonth)
                Divider()
                
            }
            .navigationBarTitle("DAYS")
        }
        
    }
    
    private func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
