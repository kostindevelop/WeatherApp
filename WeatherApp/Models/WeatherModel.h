//
//  WeatherModel.h
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/19/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property(nonatomic, strong) NSString *cityName;
@property(nonatomic, strong) NSString *countryName;
@property(nonatomic, strong) NSString *firstDateWeather;
@property(nonatomic, strong) NSString *firstTempDay;
@property(nonatomic, strong) NSString *firstTempNight;
@property(nonatomic, strong) NSString *imageId;


@end
