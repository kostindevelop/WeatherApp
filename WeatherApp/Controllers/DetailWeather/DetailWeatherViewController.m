//
//  DetailWeatherViewController.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "DetailWeatherViewController.h"
#import "DatabaseClient.h"
#import "FavouritesViewController.h"
#import "DetailWeatherTableViewCell.h"

@interface DetailWeatherViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToFavouritesButton;

@end

@implementation DetailWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateViews];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.weatherModel.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass([DetailWeatherTableViewCell class]);
    DetailWeatherTableViewCell *cell = (DetailWeatherTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell configureWithWeatherObject:[self.weatherModel.list objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (IBAction)hideController:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)populateViews {
    NSString *cityName = [NSString stringWithFormat:@"%@, %@", self.weatherModel.cityName, self.weatherModel.countryName];
    self.cityNameLabel.text = cityName;
    [self updateFavouriteButton];
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
