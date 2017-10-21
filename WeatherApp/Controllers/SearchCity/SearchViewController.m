//
//  SearchViewController.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "SearchViewController.h"
#import "UIViewController+Routes.h"
#import "APIClient.h"
#import "WeatherModel.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface SearchViewController () <UISearchBarDelegate, APIClientDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) APIClient *apiClient;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor blueColor].CGColor];
    gradient.locations = @[[NSNumber numberWithInt:0.0], [NSNumber numberWithInt:1.0]];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    self.searchBar.layer.borderColor = [UIColor whiteColor].CGColor;
    self.searchBar.layer.borderWidth = 3;
    self.searchBar.layer.cornerRadius = 20;
    self.searchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.apiClient = [APIClient new];
    self.apiClient.delegate = self;
    [self.apiClient searchWithCityName:searchBar.text];
    [self.searchBar resignFirstResponder];
}

- (void)didRecieveResponseWithResult:(id)result error:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if (error) {
        // TODO:
    } else {
        [self convertFromResponse:result];
    }
}

- (void)convertFromResponse:(id)response {
    NSDictionary *weatherResponse = (NSDictionary *)response;// приведение типов
    NSDictionary *cityResponse = [weatherResponse valueForKey:@"city"];
    NSString *cityNameResponse = [cityResponse valueForKey:@"name"];
    NSString *countryNameResponse = [cityResponse valueForKey:@"country"];
    NSArray *dateArrayResponse = [weatherResponse valueForKey:@"list"];
    NSArray *firstDdata = [dateArrayResponse valueForKeyPath:@"dt_txt"];
    NSString *imageUrl = [[[[dateArrayResponse valueForKey:@"weather"] objectAtIndex:0] valueForKey:@"icon"] firstObject];
    
    WeatherModel *weatherModel = [WeatherModel new];
    weatherModel.cityName = cityNameResponse;
    weatherModel.countryName = countryNameResponse;
    weatherModel.imageId = imageUrl;
    
    [self presentDetailControllerWithModel:weatherModel animated:YES];
}

@end
