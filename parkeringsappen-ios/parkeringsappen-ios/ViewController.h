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
    NSArray* servicedays;
    Serviceday* selectedServiceDay;
}

@property (weak, nonatomic) IBOutlet UILabel *streetlabel;
@property (weak, nonatomic) IBOutlet UIPickerView *streetSelector;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCalendarButton;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

- (IBAction)addToCalendar:(id)sender;

@end
