//
//  UIViewController+Routes.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "UIViewController+Routes.h"
#import "DetailWeatherViewController.h"

@implementation UIViewController (Routes)

- (void)presentDetailControllerWithModel:(WeatherModel *)model animated:(BOOL)animated {
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailWeatherViewController *detailController = [main instantiateViewControllerWithIdentifier:@"detailControllerIdentifier"];
    detailController.weatherModel = model;
    [self presentViewController:detailController animated:animated completion:nil];
}

@end
