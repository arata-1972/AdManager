//
//  NativeAd.swift
//  Sjov viden
//
//  Created by Jakob Mikkelsen on 10/11/17.
//  Copyright © 2017 AppMent. All rights reserved.
//

class NativeAd {

    //Title of the ad
    var adTitle:String!

    //Description of the ad
    var adDescription:String!

    //Image for the ad
    var adImage: UIImage!

    //Text for install button
    var adInstallButtontext: String = "Åben i AppStore" //Should be localized

    //Init NativeAd with information
    init(withTitle title:String?, description:String, image:UIImage, installButtonText:String) {
        self.adTitle = title
        self.adDescription = description
        self.adImage = image
        self.adInstallButtontext = installButtonText
    }

}
