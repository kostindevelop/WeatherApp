//
//  WeatherObject.h
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/21/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherObject : NSObject

@property(nonatomic, strong) NSNumber *tempMin;
@property(nonatomic, strong) NSNumber *tempMax;
@property(nonatomic, strong) NSString *weatherIcon;

@end
