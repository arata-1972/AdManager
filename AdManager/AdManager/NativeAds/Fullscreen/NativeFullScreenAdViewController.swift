//
//  NativeFullScreenAdViewController.swift
//  Sjov viden
//
//  Created by Jakob Mikkelsen on 10/11/17.
//  Copyright © 2017 AppMent. All rights reserved.
//

import UIKit

class NativeFullScreenAdViewController:UIViewController, AdViewProtocol, SBCardPopupContent {

    // MARK: - AdViewProtocol properties
    weak var delegate: AdViewDelegate?
    var currentNativeAd: NativeAd?

    // MARK: - Properties only for this view
    @IBOutlet weak fileprivate var button: UIButton!
    @IBOutlet weak fileprivate var imageView: UIImageView!
    @IBOutlet weak fileprivate var titleLabel: UILabel!
    @IBOutlet weak fileprivate var descLabel: UILabel!
    weak var popupViewController: SBCardPopupViewController?
    var allowsTapToDismissPopupCard: Bool = true
    var allowsSwipeToDismissPopupCard: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let nativeAd = currentNativeAd else {
            popupViewController?.close()
            return
        }

        self.titleLabel.text = nativeAd.adTitle
        self.descLabel.text = nativeAd.adDescription
        self.imageView.image = nativeAd.adImage
        self.button.setTitle(nativeAd.adInstallButtontext, for: .normal)

        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
        self.imageView.clipsToBounds = true

        self.button.layer.cornerRadius = 25
        self.button.clipsToBounds = true
    }

    // MARK: - Actions
    @IBAction private func install(sender: UIButton) {
        delegate?.didTapInstall(forType: .fullscreen)
        popupViewController?.close()
    }

    @IBAction private func close(sender: UIButton) {
        delegate?.didTapClose(forType: .fullscreen)
        popupViewController?.close()
    }

    static func createWithNativeAd(_ nativeAd:NativeAd) -> NativeFullScreenAdViewController {
        let storyboard = UIStoryboard(name: "NativeFullscreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NativeFullScreenAdViewController") as! NativeFullScreenAdViewController
        viewController.currentNativeAd = nativeAd
        return viewController
    }

    deinit {
        debugPrint("Deinit \(self)")
    }
}
