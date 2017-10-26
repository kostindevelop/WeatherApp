//
//  WeatherObject.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/21/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "WeatherObject.h"

@implementation WeatherObject

- (instancetype) initWithData:(NSDictionary *)data {
    if (self = [super init]) {
        [self updateWithData:data];
    }
    return self;
}

- (void)updateWithData:(NSDictionary *)data {
    NSString *date = [data valueForKey:@"dt_txt"];
    NSNumber *tempMin = [[data valueForKey:@"main"] valueForKey:@"temp_min"];
    NSNumber *tempMax = [[data valueForKey:@"main"] valueForKey:@"temp_max"];
    NSString *imageUrl = [[[data valueForKey:@"weather"] objectAtIndex:0] valueForKey:@"icon"];
    self.currentDate = date;
    self.tempMin = tempMin;
    self.tempMax = tempMax;
    self.weatherIcon = imageUrl;
}

@end
