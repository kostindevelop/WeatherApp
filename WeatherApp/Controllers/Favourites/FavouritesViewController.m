//
//  FavouritesViewController.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "FavouritesViewController.h"
#import "DatabaseClient.h"
#import "APIClient.h"

@interface FavouritesViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray *cityNames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FavouritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCities];
}

- (void)getCities {
    self.cityNames = [DatabaseClient getFavouritesCityNames];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifire = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    cell.textLabel.text = [self.cityNames objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    APIClient *apiClient = [APIClient new];
    NSString *findCity = [self.cityNames objectAtIndex:indexPath.row];
    NSLog(@"tapCity:%@", findCity);
    [apiClient searchWithCityName:findCity];
}

@end
