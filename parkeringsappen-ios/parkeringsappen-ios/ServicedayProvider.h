//
//  ServicedayProvider.h
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 4/2/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface ServicedayProvider : NSObject <RKObjectLoaderDelegate>

-(NSArray*)allServicedaysForArea:(NSString*)areacode;

@end
