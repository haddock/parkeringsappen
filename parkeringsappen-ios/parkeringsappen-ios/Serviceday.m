//
//  Serviceday.m
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 3/30/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "Serviceday.h"

@interface Serviceday() {
    NSDate* nextService;
}

@end

@implementation Serviceday

@synthesize street;
@synthesize serviceday;
@synthesize note;
@synthesize starthour;
@synthesize endhour;

- (NSDate*)nextServiceStartDate
{
    if (nextService == nil) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSDate *today = [NSDate date];
        
        [dateFormatter setDefaultDate:today];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"]];
        [dateFormatter setDateFormat:@"eeee"];
        
        NSDate* nextServiceDate = [dateFormatter dateFromString:serviceday];
        
        
        if (today == [today laterDate:nextServiceDate]) {
            NSTimeInterval aTimeInterval = [nextServiceDate timeIntervalSinceReferenceDate] + 86400 * 7;
            nextServiceDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
        }
        
        nextService = [self setHourOnDate:nextServiceDate hour:[starthour intValue]];
    }
    
    return nextService;
}

- (NSDate*)nextServiceEndDate
{
    return [self setHourOnDate:[self nextServiceStartDate] hour:[endhour intValue]];
}

- (NSDate*)setHourOnDate:(NSDate*)date hour:(int)hour
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSMinuteCalendarUnit fromDate:date];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy"];
    [comps setYear:[[dateFormatter stringFromDate:date] intValue]];
    
    [dateFormatter setDateFormat:@"MM"];
    [comps setMonth:[[dateFormatter stringFromDate:date] intValue]];
    
    [dateFormatter setDateFormat:@"dd"];
    [comps setDay:[[dateFormatter stringFromDate:date] intValue]];
    
    [comps setHour:hour];
    [comps setMinute:0];
    [comps setSecond:0];
    
    return [gregorian dateFromComponents:comps];
}

- (NSString*)description
{
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    NSDate* date = [self nextServiceStartDate];
    
    [dateFormatter setDefaultDate:date];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"eeee yyyy-MM-dd HH:mm"];

    return [dateFormatter stringFromDate:date];
}


@end