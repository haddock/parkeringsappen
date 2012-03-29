//
//  DateCalculator.m
//  iosClient
//
//  Created by Fredrik Bergljung on 2/7/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "DateCalculator.h"

@implementation DateCalculator

+(NSDate*)nextDateByWeekday:(int)targetWeekday {
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:today];
    int currentWeekday = [comps weekday];
    
    int daysToAdd = targetWeekday - currentWeekday;
    
    if (daysToAdd < 0)
        daysToAdd = daysToAdd + 7;
    
    [comps setDay: daysToAdd - 2];
    
    NSDate *result = [gregorian dateByAddingComponents:comps toDate:today options:0];
    return result;
}



@end
