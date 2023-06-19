
import SwiftUI
import CodeScanner

struct QRCodeScannerView: View {
    
    var body: some View {
        CodeScannerView(
            codeTypes: [.qr,.code39, .code128, .upce],
            simulatedData: "Some simulated data",
            completion: handleScan
        )
    }
    
    private func handleScan(result: Result<ScanResult, ScanError>) {
      switch result {
      case .success(let data):
          guard let url = URL(string: data.string) else { return }
          print(url)
      case .failure(let error):
        print("Failed Scan QR Code because of \(error)")
      }
    }
}

