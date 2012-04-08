//
//  Serviceday.h
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 3/30/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Serviceday : NSObject

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *serviceday;
@property (nonatomic, strong) NSString *starthour;
@property (nonatomic, strong) NSString *endhour;
@property (nonatomic, strong) NSString *note;

- (NSDate*)nextServiceStartDate;
- (NSDate*)nextServiceEndDate;

@end
