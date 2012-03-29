//
//  ViewController.m
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 3/29/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize streetlabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    streetlabel.text = @"getting streetname...";
    
    locationmanager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    locationmanager.delegate = self;
    [locationmanager startUpdatingLocation];
    
    locationmanager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [geocoder reverseGeocodeLocation:locationmanager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        streetlabel.text = placemark.thoroughfare;
    }];
    
    [locationmanager stopUpdatingLocation];
}

- (void)viewDidUnload
{
    [self setStreetlabel:nil];
    locationmanager = nil;
    geocoder = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
