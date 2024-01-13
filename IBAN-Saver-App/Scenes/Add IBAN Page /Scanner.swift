//
//  Scanner.swift
//  IBAN-Saver-App
//
//  Created by Salome Lapiashvili on 13.01.24.
//

import SwiftUI
import VisionKit

struct DataScannerRepresentable: UIViewControllerRepresentable {
    
    @Binding var shouldStartScanning: Bool
    @Binding var scannedText: String
    var ibanTextBinding: Binding<String>
    var dataToScanFor: Set<DataScannerViewController.RecognizedDataType>

    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScannerRepresentable

        init(_ parent: DataScannerRepresentable) {
            self.parent = parent
        }

        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .text(let text):
                parent.scannedText = text.transcript
                parent.ibanTextBinding.wrappedValue = text.transcript
                parent.shouldStartScanning = false
            case .barcode(let barcode):
                if let payload = barcode.payloadStringValue {
                    parent.scannedText = payload
                    parent.ibanTextBinding.wrappedValue = payload
                    parent.shouldStartScanning = false
                } else {
                    parent.scannedText = "Unable to decode the scanned code"
                }
            default:
                print("unexpected item")
            }
        }
    }

    func makeUIViewController(context: Context) -> DataScannerViewController {
        let dataScannerVC = DataScannerViewController(
            recognizedDataTypes: dataToScanFor,
            qualityLevel: .accurate,
            recognizesMultipleItems: true,
            isHighFrameRateTrackingEnabled: true,
            isPinchToZoomEnabled: true,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )

        dataScannerVC.delegate = context.coordinator

        return dataScannerVC
    }

    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if shouldStartScanning {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
