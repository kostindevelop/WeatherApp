//
//  WeatherModel.h
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/19/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherObject.h"

@interface WeatherModel : NSObject

@property(nonatomic, strong) NSString *cityName;
@property(nonatomic, strong) NSString *countryName;
@property(nonatomic, strong) NSArray <WeatherObject *> *list;


@end
