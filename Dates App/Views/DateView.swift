//
//  DateView.swift
//  Dates App
//
//  Created by Leone on 3/2/22.
//

import SwiftUI

/**
Creates a View with two chevron icons on either end with the given month followed by year.
*/
struct DateView: View {
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
        return formatter
    }()

    @Binding var date: Date

    var body: some View {

        HStack {

            Image(systemName: "chevron.left")
                .padding()
                .onTapGesture {
                    print("Month -1")
                    self.changeDateBy(-1)
            }

            Spacer()

            Text("\(date, formatter: Self.dateFormat)")

            Spacer()

            Image(systemName: "chevron.right")
                .padding()
                .onTapGesture {
                    print("Month +1")
                    self.changeDateBy(1)
            }

        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(Color.white)
    }

    /**
     Changes the current date forward or backwards a month.
     */
    func changeDateBy(_ months: Int) {
        if let date = Calendar.current.date(byAdding: .month, value: months, to: date) {
            self.date = date
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: .constant(Date()))
    }
}
