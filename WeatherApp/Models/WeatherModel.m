//
//  WeatherModel.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/19/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

//переопределение конструктора(на кастомный)
- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        [self updateWithData:data];
    }
    return self;
}

- (void)updateWithData:(id)data {
    NSDictionary *weatherResponse = (NSDictionary *)data;// приведение типов
    NSDictionary *cityResponse = [weatherResponse valueForKey:@"city"];
    NSString *cityNameResponse = [cityResponse valueForKey:@"name"];
    NSString *countryNameResponse = [cityResponse valueForKey:@"country"];
    NSArray *dateArrayResponse = [weatherResponse valueForKey:@"list"];
    NSString *firstDateData = [[dateArrayResponse valueForKeyPath:@"dt_txt"] firstObject];
    NSString *firstTimeData = [[firstDateData componentsSeparatedByString:@" "] lastObject];
    
    self.cityName = cityNameResponse;
    self.countryName = countryNameResponse;
    
    NSMutableArray *dateArray = [NSMutableArray new];
    for (NSDictionary *object in dateArrayResponse) {
        NSString *firstDateString = [object valueForKey:@"dt_txt"];
        if ([firstDateString containsString:firstTimeData]) {
            WeatherObject *weatherObject = [[WeatherObject alloc] initWithData:object];
            [dateArray addObject:weatherObject];
        }
    }
    self.list = dateArray;
}

@end
