//
//  barcodeApp.swift
//  barcode
//
//  Created by ohhyeongseok on 2023/06/13.
//

import SwiftUI

@main
struct barcodeApp: App {
    var body: some Scene {
        WindowGroup {
            QRCodeScannerView()
        }
    }
}
