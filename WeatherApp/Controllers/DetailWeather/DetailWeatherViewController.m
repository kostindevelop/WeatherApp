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
@property (weak, nonatomic) IBOutlet UILabel *oneTempDay;
@property (weak, nonatomic) IBOutlet UILabel *oneTempNight;
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
    NSString *imageUrlString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png",self.weatherModel.imageId];
    [self.oneWeatherImage sd_setImageWithURL:[NSURL URLWithString:imageUrlString]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

}

@end
