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
    
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:today];
    int currentWeekday = [comps weekday] - 1;
    
    [comps setWeekday:targetWeekday - 2];
    
    if (currentWeekday >= targetWeekday) {
        [comps setWeek:1];
    }
    
    NSDate *result = [gregorian dateByAddingComponents:comps toDate:today options:0];
    return result;
}



@end
