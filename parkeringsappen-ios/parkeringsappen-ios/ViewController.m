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

@implementation ViewController
@synthesize getStreetButton;
@synthesize streetlabel;
@synthesize streetSelector;
@synthesize infoLabel;

- (NSString*)getCurrentStreetName
{
    /*
    NSLog(@"getCurrentStreetName start....");
    streetlabel.text = nil;
    street = nil;
    infoLabel.text = nil;
    
    [locationmanager startUpdatingLocation];
        [geocoder reverseGeocodeLocation:locationmanager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
            
        if (placemark.thoroughfare != nil) {
            street = placemark.thoroughfare;
            [getStreetButton setHidden:YES];
            //[self loadServicedayInfo];
        } else {
            [getStreetButton setHidden:NO];
        }
            
        streetlabel.text = placemark.thoroughfare;
    }];
    [locationmanager stopUpdatingLocation];
    
    NSLog(@"getCurrentStreetName stop");
     */
    return @"Baltzar von Platens Gata";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    servicedayProvider = [[ServicedayProvider alloc] init];
    
    streetlabel.text = @"getting streetname...";
    
    /*
    locationmanager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    locationmanager.delegate = self;
    locationmanager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    */
    
    NSString* currentStreet = [self getCurrentStreetName];
    streetlabel.text = currentStreet;
    
    servicedays = [servicedayProvider allServicedaysForArea:@"Ku"];
    
    [streetSelector setDelegate:self];
    [streetSelector setDataSource:self];
    [streetSelector setShowsSelectionIndicator:YES];
    
    for (NSInteger i = 0; i < servicedays.count; i++) {
        Serviceday* tmp = [servicedays objectAtIndex:i];
        if ([tmp.street isEqual:currentStreet]) {
            [streetSelector selectRow:i inComponent:0 animated:NO];
            infoLabel.text = tmp.serviceday;
            break;
        }
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)getCurrentStreet:(id)sender {
    [self getCurrentStreetName];
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


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    streetlabel.text = [[servicedays objectAtIndex:row] street];
    infoLabel.text = [[servicedays objectAtIndex:row] serviceday];
}

@end
