//
//  StartAppDriver.swift
//  Sjov viden
//
//  Created by Jakob Mikkelsen on 10/11/17.
//  Copyright © 2017 AppMent. All rights reserved.
//

import UIKit

class StartAppDriver: NSObject, AdDriverProtocol {

    //Fullscreen
    private var fullscreenAd:STAStartAppNativeAd?
    private var fullscreenAdDetails: STANativeAdDetails?

    //Banner
    private var bannerAd:STAStartAppNativeAd?
    private var bannerAdDetails: STANativeAdDetails?

    //Ad preferences
    private var adPreferences:STANativeAdPreferences!

    /// Configure the ad network
    func configureAdNetwork() {

        let sdk: STAStartAppSDK = STAStartAppSDK.sharedInstance()
        sdk.appID = "209551647"
        sdk.devID = "112651643"

        sdk.preferences = STASDKPreferences.prefrences(withAge: 18, andGender: STAGender_Undefined)

        adPreferences = STANativeAdPreferences()
        adPreferences.adsNumber = 10 // Request only one ad
        adPreferences.autoBitmapDownload = true // Download image
        adPreferences.bitmapSize = SIZE_340X340

        fullscreenAd = STAStartAppNativeAd()
        bannerAd = STAStartAppNativeAd()

    }

    /// MARK: Load ads
    func loadNativeFullscreenAd() {
        fullscreenAd?.loadAd(with: adPreferences)
    }
    func loadNativeBannerAd() {
        bannerAd?.loadAd(with: adPreferences)
    }

    /// MARK: Get ads
    func getNativeFullscreenAd() -> NativeAd? {

        //Guard that the fullscreen ad is ready
        guard fullscreenAd?.isReady() == true else { return nil }

        // Take the first ad, which in default can be only one.
        guard let adDetails: STANativeAdDetails = fullscreenAd?.adsDetails.object(at: 0) as? STANativeAdDetails else { return nil }

        fullscreenAdDetails = adDetails

        // Send the impression
        fullscreenAdDetails!.sendImpression()

        // Create the nativeAd
        let ad = NativeAd(withTitle: adDetails.title, description: adDetails.description, image: adDetails.imageBitmap, installButtonText: adDetails.clickToInstall)

        // Return the ad
        return ad
    }

    func getNativeBannerAd() -> NativeAd? {

        //Guard that the fullscreen ad is ready
        guard bannerAd?.isReady() == true else { return nil }

        // Take the first ad, which in default can be only one.
        guard let adDetails: STANativeAdDetails = fullscreenAd?.adsDetails.object(at: 0) as? STANativeAdDetails else { return nil }

        bannerAdDetails = adDetails

        // Send the impression
        fullscreenAdDetails!.sendImpression()

        // Create the nativeAd
        let ad = NativeAd(withTitle: adDetails.title, description: adDetails.description, image: adDetails.imageBitmap, installButtonText: adDetails.clickToInstall)

        // Return the ad
        return ad

    }

    /// MARK: Did click on fullscreen ad
    func didClickOnFullscreenAd() {
        fullscreenAdDetails?.sendClick()
    }

    /// MARK: Did click on banner ad
    func didClickOnBannerAd() {
        bannerAdDetails?.sendClick()
    }
}

