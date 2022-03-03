//
//  DateRowView.swift
//  Dates App
//
//  Created by Leone on 3/2/22.
//

import SwiftUI

struct DateRowView: View {
    
    // Pass in a date
    var sideDate: Date
    
    // Return the three-letter date abbreviation, e.g. Monday -> Mon
    var abbreviatedDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        // Returns like "Wed"
        return formatter.string(from: sideDate)
    }
    
    var dayNumber: String {
        let formatter = DateFormatter()
        // Formats the Date as a string e.g. 20
        formatter.dateFormat = "d"
        // Returns like 5
        return formatter.string(from: sideDate)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            // MARK: - Date Elements
            // Holds the left date elements
            HStack {
                // Inner VStack holds the date's three-letter day abbreviation as well as number
                VStack {
                    Text(abbreviatedDay)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(dayNumber)
                        .foregroundColor(.orange)
                }
                
                // Create a small gray divider 50 pixels high
                Divider()
                    .frame(maxHeight: 40)
            }
            .frame(width: 40)
            
            // MARK: - Bottom Divider
            // Create a Divider under each View
            Divider()
        }
        .padding(.leading)
    }
}

struct DateRowView_Previews: PreviewProvider {
    static var previews: some View {
        DateRowView(sideDate: Date())
    }
}
