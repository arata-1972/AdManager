//
//  AdManager.swift
//  Sjov viden
//
//  Created by Jakob Mikkelsen on 10/11/17.
//  Copyright © 2017 AppMent. All rights reserved.
//

/// AdDriverProtocol
protocol AdDriverProtocol: class {

    /// Configure the ad network
    func configureAdNetwork()

    /// Load ads
    func loadNativeFullscreenAd()
    func loadNativeBannerAd()

    // Get ads
    func getNativeFullscreenAd() -> NativeAd?
    func getNativeBannerAd() -> NativeAd?

    // Interaction with ads
    func didClickOnFullscreenAd()
    func didClickOnBannerAd()

}

class AdManager : AdViewDelegate {

    //Setup the ad network you want to use
    private var currentAdNetwork = StartAppDriver()

    /// Shared instance
    static let shared = AdManager()

    init() {}

    func setup() {
        //Configure the current ad network
        self.currentAdNetwork.configureAdNetwork()
    }

    // MARK: Load ads
    func loadFullscreenAd() {
        self.currentAdNetwork.loadNativeFullscreenAd()
    }
    func loadBannerAd() {
        self.currentAdNetwork.loadNativeBannerAd()
    }

    // MARK: Show ads
    func showFullscreenAd(forViewController vc:UIViewController) {
        guard let nativeAd = currentAdNetwork.getNativeFullscreenAd() else {
            debugPrint("❗️ Cannot get ad from ad network.. ❗️")
            return
        }

        let fullscreenAd = NativeFullScreenAdViewController.createWithNativeAd(nativeAd)
        fullscreenAd.delegate = self
        
        let cardPopup = SBCardPopupViewController(contentViewController: fullscreenAd)
        cardPopup.sideMargin = CGFloat(30)
        cardPopup.verticalMargins = CGFloat(100)
        cardPopup.show(onViewController: vc)

    }

    //MARK - AdViewDelegates
    func didTapInstall(forType adType:AdViewType) {
        switch adType {
        case .fullscreen:
            self.currentAdNetwork.didClickOnFullscreenAd()
        case .banner:
            self.currentAdNetwork.didClickOnBannerAd()
        }
    }

    func didTapClose(forType adType:AdViewType)  {
        switch adType {
        case .fullscreen:
            self.currentAdNetwork.loadNativeFullscreenAd()
        case .banner:
            self.currentAdNetwork.loadNativeBannerAd()
        }
    }

}

