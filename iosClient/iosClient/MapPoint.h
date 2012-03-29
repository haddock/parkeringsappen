//
//  MapPoint.h
//  iosClient
//
//  Created by Fredrik Bergljung on 3/7/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>
{
    NSString *street;
    NSString *timestamp;
    CLLocationCoordinate2D coordinate;
}

@end
