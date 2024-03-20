//
//  ViewController.swift
//  Example
//
//  Created by 김지태 on 3/19/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        guard let image = self.view.convertToImage() else { return }
        
        
        
        let message: String = """
                                화물잇고 쓰세요
                                
                                추천인 코드: XXXXXXX
                                
                                플레이스토어
                                https://play.google.com/store/apps/details?id=com.lguplus.itgo&hl=ko&gl=US
                                
                                
                                앱스토어
                                https://apps.apple.com/kr/app/%ED%99%94%EB%AC%BC%EC%9E%87%EA%B3%A0-%EC%B0%A8%EC%A3%BC%EC%95%B1/id6449324023
                                """
        let shareItems: Array<Any> = [image, message]

        
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.airDrop]
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)

        
    }
}

extension UIView {
    func convertToImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        return nil
    }
}
