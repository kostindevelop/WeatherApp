//
//  DatabaseClient.h
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/19/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseClient : NSObject

+ (void)saveObjectWithCityName:(NSString *)cityName;
+ (void)deleteObjectWithCityName:(NSString *)cityName;
+ (BOOL)containsCityWithName:(NSString *)cityName;
+ (NSArray *)getFavouritesCityNames;

@end
