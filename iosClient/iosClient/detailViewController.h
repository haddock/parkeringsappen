//
//  detailViewController.h
//  iosClient
//
//  Created by Fredrik Bergljung on 2/4/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface detailViewController : UIViewController <CLLocationManagerDelegate> {
    CLGeocoder* geocoder;
    CLLocationManager* locationmanager;
}

@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *areacodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCalendarButton;

- (IBAction)addToCalendar:(id)sender;

@end
