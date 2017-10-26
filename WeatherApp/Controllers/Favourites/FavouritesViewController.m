//
//  FavouritesViewController.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "FavouritesViewController.h"
#import "DatabaseClient.h"

@interface FavouritesViewController ()

@end

@implementation FavouritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCities];
}

- (void)getCities {
    NSArray *cityNames = [DatabaseClient getFavouritesCityNames];
}

@end
