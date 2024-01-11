//
//  Text.swift
//  IBAN-Saver-App
//
//  Created by Mariam Mchedlidze on 11.01.24.
//

import SwiftUI

extension Text {
    // MARK: - PrimaryText
    func primaryTextStyle() -> some View {
        self
            .font(.system(size: 16))
    }

    // MARK: - SecondaryText
    func secondaryTextStyle() -> some View {
        self
            .font(.system(size: 16))
            .opacity(0.6)
    }

    // MARK: - HeaderText
    func headerTextStyle() -> some View {
        self
            .font(.system(size: 30))
            .foregroundColor(Color.ibanHeader)
    }
}
