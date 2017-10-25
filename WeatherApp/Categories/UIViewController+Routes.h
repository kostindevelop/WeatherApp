//
//  UIViewController+Routes.h
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherModel;
@class ConvertModel;

@interface UIViewController (Routes)

- (void)presentDetailControllerWithModel:(WeatherModel *)model animated:(BOOL)animated;

@end
