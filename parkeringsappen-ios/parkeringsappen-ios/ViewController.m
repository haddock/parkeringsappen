//
//  ViewController.m
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 3/29/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "ServicedayProvider.h"
#import "Serviceday.h"
#import "ViewController.h"
#import <EventKit/EventKit.h>

@implementation ViewController

@synthesize streetlabel;
@synthesize streetSelector;
@synthesize infoLabel;
@synthesize addToCalendarButton;
@synthesize dayLabel;

- (NSString*)getCurrentStreetName
{
    
    CLLocationManager* locationmanager = [[CLLocationManager alloc] init];
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    
    locationmanager.delegate = self;
    locationmanager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [locationmanager startUpdatingLocation];
        [geocoder reverseGeocodeLocation:locationmanager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
            
        if (placemark.thoroughfare != nil) {
            streetlabel.text = placemark.thoroughfare;
        } 
    }];
    [locationmanager stopUpdatingLocation];
    return streetlabel.text;
    //return @"Kaplansbacken";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ServicedayProvider* servicedayProvider = [[ServicedayProvider alloc] init];
    
    streetlabel.text = @"";
    dayLabel.text = @"";
    infoLabel.text = @"";
    [addToCalendarButton setHidden:YES];
    
    NSString* currentStreet = [self getCurrentStreetName];
    
    servicedays = [servicedayProvider allServicedaysForArea:@"Ku"];
    
    [streetSelector setDelegate:self];
    [streetSelector setDataSource:self];
    [streetSelector setShowsSelectionIndicator:YES];
    
    for (NSInteger i = 0; i < servicedays.count; i++) {
        Serviceday* tmp = [servicedays objectAtIndex:i];
        if ([tmp.street isEqual:currentStreet]) {
            [streetSelector selectRow:i inComponent:0 animated:NO];
            [self selectService:tmp];
            break;
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setStreetlabel:nil];
    [self setInfoLabel:nil];
    [self setStreetSelector:nil];
    [self setDayLabel:nil];
    [self setAddToCalendarButton:nil];
    servicedays = nil;
    selectedServiceDay = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [servicedays count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[servicedays objectAtIndex:row] street];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self selectService:[servicedays objectAtIndex:row]];
}

- (void)selectService:(Serviceday*) service
{
    selectedServiceDay = service;
    streetlabel.text = [service street];
    
    if ([service note] != nil) {
        infoLabel.text = [service note];
    } else {
        infoLabel.text = @"";
    }
    
    dayLabel.text = [service description];
    [addToCalendarButton setHidden:NO];
}

- (IBAction)addToCalendar:(id)sender
{
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB];
    
    myEvent.title = @"Parkera om bilen!";
    myEvent.startDate = [selectedServiceDay nextServiceStartDate];
    myEvent.endDate = [selectedServiceDay nextServiceEndDate];
    myEvent.allDay = NO;
    myEvent.notes = [NSString stringWithFormat:@"Bilen står på %@", [selectedServiceDay street]];
    
    [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]];
    
    NSError *err;
    
    BOOL success = [eventDB saveEvent:myEvent span:EKSpanThisEvent error:&err]; 
    
	if (success) {
        infoLabel.text = @"Tillagt i kalendern.";
        [addToCalendarButton setHidden:YES];
    } else {
        NSLog(@"Fel uppstod: %@", err.description);
    }
}

@end
