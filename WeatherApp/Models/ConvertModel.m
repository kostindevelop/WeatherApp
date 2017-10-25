//
//  ConvertModel.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/25/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "ConvertModel.h"
#import "WeatherModel.h"
#import "UIViewController+Routes.h"
#import "SearchViewController.h"

@implementation ConvertModel

//- (void)convertResponse:(id)response {
//    NSDictionary *weatherResponse = (NSDictionary *)response;// приведение типов
//    NSDictionary *cityResponse = [weatherResponse valueForKey:@"city"];
//    NSString *cityNameResponse = [cityResponse valueForKey:@"name"];
//    NSString *countryNameResponse = [cityResponse valueForKey:@"country"];
//    NSArray *dateArrayResponse = [weatherResponse valueForKey:@"list"];
//    NSString *firstDateData = [[dateArrayResponse valueForKeyPath:@"dt_txt"] firstObject];
//    NSString *firstTimeData = [[firstDateData componentsSeparatedByString:@" "] lastObject];
//
//    WeatherModel *weatherModel = [WeatherModel new];
//    weatherModel.cityName = cityNameResponse;
//    weatherModel.countryName = countryNameResponse;
//
//    NSMutableArray *dateArray = [NSMutableArray new];
//    for (NSDictionary *object in dateArrayResponse) {
//        NSString *firstDateString = [object valueForKey:@"dt_txt"];
//        if ([firstDateString containsString:firstTimeData]) {
//            WeatherObject *weatherObject = [WeatherObject new];
//            NSNumber *tempMin = [[object valueForKey:@"main"] valueForKey:@"temp_min"];
//            NSNumber *tempMax = [[object valueForKey:@"main"] valueForKey:@"temp_max"];
//            NSString *imageUrl = [[[[dateArrayResponse valueForKey:@"weather"] objectAtIndex:0] valueForKey:@"icon"] firstObject];
//            weatherObject.tempMin = tempMin;
//            weatherObject.tempMax = tempMax;
//            weatherObject.weatherIcon = imageUrl;
//            [dateArray addObject:weatherObject];
//        }
//    }
//    weatherModel.list = dateArray;
//
//    [self presentDetailControllerWithModel:weatherModel animated:YES];
//
//}

@end
