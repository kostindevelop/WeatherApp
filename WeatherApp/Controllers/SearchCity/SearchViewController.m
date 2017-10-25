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
//        ConvertModel *convertModel = [ConvertModel new];
//        [convertModel convertResponse:result];
    }
}

- (void)convertFromResponse:(id)response {
    NSDictionary *weatherResponse = (NSDictionary *)response;// приведение типов
    NSDictionary *cityResponse = [weatherResponse valueForKey:@"city"];
    NSString *cityNameResponse = [cityResponse valueForKey:@"name"];
    NSString *countryNameResponse = [cityResponse valueForKey:@"country"];
    NSArray *dateArrayResponse = [weatherResponse valueForKey:@"list"];
    NSString *firstDateData = [[dateArrayResponse valueForKeyPath:@"dt_txt"] firstObject];
    NSString *firstTimeData = [[firstDateData componentsSeparatedByString:@" "] lastObject];

    WeatherModel *weatherModel = [WeatherModel new];
    weatherModel.cityName = cityNameResponse;
    weatherModel.countryName = countryNameResponse;

    NSMutableArray *dateArray = [NSMutableArray new];
    for (NSDictionary *object in dateArrayResponse) {
        NSString *firstDateString = [object valueForKey:@"dt_txt"];
        if ([firstDateString containsString:firstTimeData]) {
            WeatherObject *weatherObject = [WeatherObject new];
            NSString *date = [object valueForKey:@"dt_txt"];
            NSNumber *tempMin = [[object valueForKey:@"main"] valueForKey:@"temp_min"];
            NSNumber *tempMax = [[object valueForKey:@"main"] valueForKey:@"temp_max"];
            NSString *imageUrl = [[[[dateArrayResponse valueForKey:@"weather"] objectAtIndex:0] valueForKey:@"icon"] firstObject];
            weatherObject.currentDate = date;
            weatherObject.tempMin = tempMin;
            weatherObject.tempMax = tempMax;
            weatherObject.weatherIcon = imageUrl;
            [dateArray addObject:weatherObject];
        }
    }
    weatherModel.list = dateArray;

    [self presentDetailControllerWithModel:weatherModel animated:YES];
}

@end
