//
//  NativeAdViewProtocol.swift
//  Sjov viden
//
//  Created by Jakob Mikkelsen on 10/11/17.
//  Copyright © 2017 AppMent. All rights reserved.
//

/// AdViewType
enum AdViewType {
    case fullscreen
    case banner
}

/// AdViewProtocol
protocol AdViewProtocol: class {

    // Delegate back to AdManager
    weak var delegate:AdViewDelegate? { get set }

    // The current native ad to be showed
    var currentNativeAd:NativeAd? { get }

}

/// AdViewDelegate
protocol AdViewDelegate: class {

    /// Ad did tap install
    func didTapInstall(forType adType:AdViewType)

    /// Ad did tap close
    func didTapClose(forType adType:AdViewType)

}
