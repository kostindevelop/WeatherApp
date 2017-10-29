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
        WeatherModel *weatherModel = [[WeatherModel alloc] initWithData:result];
        [self presentDetailControllerWithModel:weatherModel animated:YES];
    }
}
@end
