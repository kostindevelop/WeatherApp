//
//  DetailWeatherTableViewCell.h
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/29/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherObject;

@interface DetailWeatherTableViewCell : UITableViewCell

- (void)configureWithWeatherObject:(WeatherObject *)weatherObject;

@end
