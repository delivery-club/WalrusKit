//
//  GridStack.swift
//  WalrusKitExampleApp
//
//  Created by Aleksei Smirnov on 29.10.2020.
//

import SwiftUI

struct GridStack<Content: View>: View {

    // MARK: - Private Properties

    private let itemsCount: Int
    private let rows: Int
    private let columns: Int
    private let vSpacing: CGFloat?
    private let hSpacing: CGFloat?
    private let content: (Int?) -> Content

    // MARK: - Initializers

    init(
        itemsNumber: Int,
        columns: Int,
        vSpacing: CGFloat? = nil,
        hSpacing: CGFloat? = nil,
        @ViewBuilder _ content: @escaping (Int?) -> Content) {

        func countRows(
            _ count: Int,
            _ columnsCount: Int) -> Int {

            let number = count / columnsCount
            return count.isMultiple(of: columnsCount) ? number : number + 1
        }

        self.itemsCount = itemsNumber
        self.rows = countRows(itemsNumber, columns)
        self.columns = columns
        self.vSpacing = vSpacing
        self.hSpacing = hSpacing
        self.content = content
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: vSpacing) {
            ForEach(0 ..< rows) { row in
                HStack(spacing: hSpacing) {
                    ForEach(0 ..< columns) { column in
                        content(row * columns + column >= itemsCount ? nil : row * columns + column)
                    }
                }
            }
        }
    }
}
