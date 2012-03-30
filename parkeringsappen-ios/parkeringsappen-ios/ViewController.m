//
//  ViewController.m
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 3/29/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *street;
}

@end

@implementation ViewController
@synthesize getStreetButton;
@synthesize streetlabel;
@synthesize infoLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    streetlabel.text = @"getting streetname...";
    
    locationmanager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    locationmanager.delegate = self;
    locationmanager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    [self getCurrentStreetName];
}

- (void)getCurrentStreetName
{
    streetlabel.text = nil;
    street = nil;
    [locationmanager startUpdatingLocation];
        [geocoder reverseGeocodeLocation:locationmanager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        
        if (placemark.thoroughfare != nil) {
            streetlabel.text = placemark.thoroughfare;
            [getStreetButton setHidden:YES];
        } else {
            [getStreetButton setHidden:NO];
        }
    }];
    [locationmanager stopUpdatingLocation];
}

- (void)viewDidUnload
{
    
    [self setStreetlabel:nil];
    locationmanager = nil;
    geocoder = nil;
    street = nil;
    [self setGetStreetButton:nil];
    [self setInfoLabel:nil];
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

@end
