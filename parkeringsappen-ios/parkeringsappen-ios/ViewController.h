//
//  ViewController.h
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 3/29/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationmanager;
    CLGeocoder *geocoder;
}

@property (weak, nonatomic) IBOutlet UILabel *streetlabel;
@end
