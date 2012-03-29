//
//  Service.m
//  iosClient
//
//  Created by Fredrik Bergljung on 2/6/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "Service.h"
#import "DateCalculator.h"

@implementation Service

@synthesize street;
@synthesize areacode;
@synthesize city;
@synthesize serviceDay;
@synthesize starthour;
@synthesize endhour;
@synthesize note;

-(NSDate*)nextServiceStart {
    NSDate* date = [DateCalculator nextDateByWeekday:[serviceDay intValue]];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSMinuteCalendarUnit fromDate:date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    [comps setYear:[[dateFormatter stringFromDate:date] intValue]];
    
    [dateFormatter setDateFormat:@"MM"];
    [comps setMonth:[[dateFormatter stringFromDate:date] intValue]];
    
    [dateFormatter setDateFormat:@"dd"];
    [comps setDay:[[dateFormatter stringFromDate:date] intValue]];
    
    [comps setHour:[starthour intValue] + 1];
    [comps setMinute:0];
    
    return [gregorian dateFromComponents:comps];  
}
-(NSDate*)nextServiceEnd {
    NSDate* date = [DateCalculator nextDateByWeekday:[serviceDay intValue]];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSMinuteCalendarUnit fromDate:date];
        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    [comps setYear:[[dateFormatter stringFromDate:date] intValue]];
    
    [dateFormatter setDateFormat:@"MM"];
    [comps setMonth:[[dateFormatter stringFromDate:date] intValue]];
    
    [dateFormatter setDateFormat:@"dd"];
    [comps setDay:[[dateFormatter stringFromDate:date] intValue]];
    
    [comps setHour:[endhour intValue] + 1];
    [comps setMinute:0];
    
    return [gregorian dateFromComponents:comps];
}

@end
