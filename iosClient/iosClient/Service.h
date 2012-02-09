//
//  Service.h
//  iosClient
//
//  Created by Fredrik Bergljung on 2/6/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Service : NSObject

@property (nonatomic, copy) NSString* street;
@property (nonatomic, copy) NSString* areacode;
@property (nonatomic, copy) NSString* city;
@property (nonatomic, copy) NSString* serviceDay;
@property (nonatomic, copy) NSString* starthour;
@property (nonatomic, copy) NSString* endhour;
@property (nonatomic, copy) NSString* note;

-(NSDate*)nextServiceStart;
-(NSDate*)nextServiceEnd;

@end
