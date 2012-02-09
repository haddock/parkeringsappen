//
//  DateCalculator.h
//  iosClient
//
//  Created by Fredrik Bergljung on 2/7/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateCalculator : NSObject

+(NSDate*)nextDateByWeekday:(int)targetWeekday;

@end
