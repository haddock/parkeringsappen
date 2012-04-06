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


@interface ViewController : UIViewController <CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    
    CLLocationManager *locationmanager;
    CLGeocoder *geocoder;
    ServicedayProvider *servicedayProvider;
    NSArray* servicedays;
    
}

@property (weak, nonatomic) IBOutlet UIButton *getStreetButton;
@property (weak, nonatomic) IBOutlet UILabel *streetlabel;
@property (weak, nonatomic) IBOutlet UIPickerView *streetSelector;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;


- (IBAction)getCurrentStreet:(id)sender;

@end
