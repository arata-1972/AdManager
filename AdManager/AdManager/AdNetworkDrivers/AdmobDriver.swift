//
//  AdmobDriver.swift
//  Sjov viden
//
//  Created by Jakob Mikkelsen on 10/11/17.
//  Copyright © 2017 AppMent. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdmobDriver: AdDriverProtocol {

    //Fullscreen
    private var fullscreenAd:STAStartAppNativeAd?
    private var fullscreenAdDetails: STANativeAdDetails?

    //Banner
    private var bannerAd:STAStartAppNativeAd?
    private var bannerAdDetails: STANativeAdDetails?

    //Ad preferences
    private var adPreferences:STANativeAdPreferences!

    func configureAdNetwork() {

        // Initialize the Google Mobile Ads SDK.
        // Sample AdMob app ID: ca-app-pub-3940256099942544~1458002511
        GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")

    }

    func loadNativeFullscreenAd() {

    }

    func loadNativeBannerAd() {

    }

    func getNativeFullscreenAd() -> NativeAd? {

    }

    func getNativeBannerAd() -> NativeAd? {

    }

    func didClickOnFullscreenAd() {

    }

    func didClickOnBannerAd() {

    }


}
