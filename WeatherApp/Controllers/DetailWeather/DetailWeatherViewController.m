//
//  DetailWeatherViewController.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "DetailWeatherViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailWeatherViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneDateWeather;
@property (weak, nonatomic) IBOutlet UILabel *oneTempMax;
@property (weak, nonatomic) IBOutlet UILabel *oneTempMin;
@property (weak, nonatomic) IBOutlet UIImageView *oneWeatherImage;

@end

@implementation DetailWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateViews];
}
- (IBAction)hideController:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)populateViews {
    NSString *cityName = [NSString stringWithFormat:@"%@, %@", self.weatherModel.cityName, self.weatherModel.countryName];
    self.cityNameLabel.text = cityName;
    WeatherObject *firstObject = self.weatherModel.list.firstObject;
    NSString *imageUrlString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", firstObject.weatherIcon];
    [self.oneWeatherImage sd_setImageWithURL:[NSURL URLWithString:imageUrlString]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    NSString *tempMax = [NSString stringWithFormat:@"%.2f", [firstObject.tempMax floatValue]];
    self.oneTempMax.text = tempMax;
    NSString *tempMin = [NSString stringWithFormat:@"%.2f", [firstObject.tempMin floatValue]];
    self.oneTempMin.text = tempMin;

}

@end
