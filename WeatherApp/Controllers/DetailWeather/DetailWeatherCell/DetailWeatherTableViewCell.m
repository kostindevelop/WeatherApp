//
//  DetailWeatherTableViewCell.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/29/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "DetailWeatherTableViewCell.h"
#import "WeatherObject.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailWeatherTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempMinLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempMaxLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;

@end

@implementation DetailWeatherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)configureWithWeatherObject:(WeatherObject *)weatherObject {
    self.dateLabel.text = [self dateFormater:weatherObject.currentDate];
    self.tempMaxLabel.text = [NSString stringWithFormat:@"%.2f", [weatherObject.tempMax floatValue]];
    self.tempMinLabel.text = [NSString stringWithFormat:@"%.2f", [weatherObject.tempMin floatValue]];
    NSString *imageUrlString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weatherObject.weatherIcon];
        [self.weatherImage sd_setImageWithURL:[NSURL URLWithString:imageUrlString]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

- (NSString *)dateFormater:(NSString *)date {
    NSDateFormatter *dateFormatterStr = [NSDateFormatter new];
    [dateFormatterStr setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *newDate = [dateFormatterStr dateFromString:date];
    [dateFormatterStr setDateFormat:@"dd MMMM"];
    return [dateFormatterStr stringFromDate:newDate];
}

@end
