//
//  ServicedayProvider.m
//  parkeringsappen-ios
//
//  Created by Fredrik Bergljung on 4/2/12.
//  Copyright (c) 2012 Valtech. All rights reserved.
//

#import "ServicedayProvider.h"
#import "Serviceday.h"
#import <RestKit/RestKit.h>

@interface ServicedayProvider() {
    NSArray* servicedays;
}

@end

@implementation ServicedayProvider

- (void)loadServicedayInfo:(NSString *)resourcepath
{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Serviceday class]];
    [objectMapping mapKeyPath:@"street" toAttribute:@"street"];
    [objectMapping mapKeyPath:@"day" toAttribute:@"serviceday"];
    [objectMapping mapKeyPath:@"starthour" toAttribute:@"starthour"];
    [objectMapping mapKeyPath:@"endhour" toAttribute:@"endhour"];
    [objectMapping mapKeyPath:@"note" toAttribute:@"note"];
    
    RKObjectManager* manager = [RKObjectManager objectManagerWithBaseURL:@"http://stark-night-7978.herokuapp.com"];
    RKObjectLoader* loader = [manager objectLoaderWithResourcePath:resourcepath delegate:self]; 
    loader.objectMapping = objectMapping;
    loader.method = RKRequestMethodGET; 
    [loader sendSynchronously];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    servicedays = [NSArray arrayWithArray:objects];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}

- (NSArray*)allServicedaysForArea:(NSString *)areacode
{
    NSString *resourcepath = [@"area/" stringByAppendingString:areacode];
    [self loadServicedayInfo:resourcepath];
    return servicedays;
}
@end
