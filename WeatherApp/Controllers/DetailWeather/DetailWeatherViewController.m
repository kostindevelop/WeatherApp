//
//  DetailWeatherViewController.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "DetailWeatherViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DatabaseClient.h"
#import "FavouritesViewController.h"

@interface DetailWeatherViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneDateWeather;
@property (weak, nonatomic) IBOutlet UILabel *oneTempMax;
@property (weak, nonatomic) IBOutlet UILabel *oneTempMin;
@property (weak, nonatomic) IBOutlet UIImageView *oneWeatherImage;
@property (weak, nonatomic) IBOutlet UIButton *addToFavouritesButton;

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
    NSString *oneTempMax = [NSString stringWithFormat:@"%.2f", [firstObject.tempMax floatValue]];
    self.oneTempMax.text = oneTempMax;
    NSString *oneTempMin = [NSString stringWithFormat:@"%.2f", [firstObject.tempMin floatValue]];
    self.oneTempMin.text = oneTempMin;
    self.oneDateWeather.text = [self dateFormater:firstObject.currentDate];
    
    [self updateFavouriteButton];
}

- (NSString *)dateFormater:(NSString *)date {
    NSDateFormatter *dateFormatterStr = [NSDateFormatter new];
    [dateFormatterStr setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *newDate = [dateFormatterStr dateFromString:date];
    [dateFormatterStr setDateFormat:@"dd MMMM"];
    return [dateFormatterStr stringFromDate:newDate];
}

- (IBAction)addToFavouritesTapped:(UIButton *)sender {
    [DatabaseClient saveObjectWithCityName:self.weatherModel.cityName];
    [self updateFavouriteButton];
}

- (void)updateFavouriteButton {
    NSString *favouriteButtonTitle = [DatabaseClient containsCityWithName:self.weatherModel.cityName] ? @"-" : @"+";
    [self.addToFavouritesButton setTitle:favouriteButtonTitle forState:UIControlStateNormal];
}

@end
