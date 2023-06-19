//
//  ViewController.swift
//  barCode2
//
//  Created by ohhyeongseok on 2023/06/19.
//

import UIKit
import AVFoundation

class BarcodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            fatalError("카메라에 접근할 수 없습니다.")
        }
        guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else {
            fatalError("카메라 입력을 생성할 수 없습니다.")
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            fatalError("입력을 세션에 추가할 수 없습니다.")
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.code39,.ean8, .ean13, .pdf417] // 스캔할 바코드 종류 선택
        } else {
            fatalError("출력을 세션에 추가할 수 없습니다.")
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // 카메라 포커스 모드 설정
        if let videoCaptureDevice = AVCaptureDevice.default(for: .video) {
            do {
                try videoCaptureDevice.lockForConfiguration()
                if videoCaptureDevice.isFocusModeSupported(.continuousAutoFocus) {
                    videoCaptureDevice.focusMode = .continuousAutoFocus
                }
                if videoCaptureDevice.isAutoFocusRangeRestrictionSupported {
                    videoCaptureDevice.autoFocusRangeRestriction = .near
                }
                videoCaptureDevice.unlockForConfiguration()
            } catch {
                print("카메라 포커스 설정에 실패했습니다.")
            }
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else {
                return
            }
            guard let stringValue = readableObject.stringValue else {
                return
            }

            print("스캔 결과: \(stringValue)")

            // 여기서 바코드를 처리하는 로직을 추가할 수 있습니다.

            dismiss(animated: true)
        }
    }
}
