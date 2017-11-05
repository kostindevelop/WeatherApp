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
#import "WeatherModel.h"
#import "UIViewController+Routes.h"
#import "City+CoreDataClass.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <MagicalRecord/MagicalRecord.h>
#import <SCLAlertView-Objective-C/SCLAlertView.h>


@interface FavouritesViewController () <UITableViewDelegate, UITableViewDataSource, APIClientDelegate>

@property(nonatomic, strong) NSArray *cityNames;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FavouritesViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self getCities];
    [self.tableView reloadData];
}

- (void)getCities {
    self.cityNames = [DatabaseClient getFavouritesCityNames];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = [self.cityNames objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    APIClient *apiClient = [APIClient new];
    apiClient.delegate = self;
    NSString *findCity = [self.cityNames objectAtIndex:indexPath.row];
    [apiClient searchWithCityName:findCity];
}

- (void)didRecieveResponseWithResult:(id)result error:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if (error) {
        SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
        [alert showSuccess:@"Op's" subTitle:@"Something went wrong" closeButtonTitle:@"Ok" duration:0.0f];
    } else {
        WeatherModel *weatherModel = [[WeatherModel alloc] initWithData:result];
        [self presentDetailControllerWithModel:weatherModel animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        City *city = [self.cityNames objectAtIndex:indexPath.row];
        [city MR_deleteEntity];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}
}

@end
