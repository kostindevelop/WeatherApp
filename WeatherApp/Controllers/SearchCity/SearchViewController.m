//
//  SearchViewController.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/14/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "SearchViewController.h"
#import "UIViewController+Routes.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (IBAction)showDetailController:(UIButton *)sender {
    [self presentDetailControllerAnimated:YES];
}

- (void)setupViews{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor blueColor].CGColor];
    gradient.locations = @[[NSNumber numberWithInt:0.0], [NSNumber numberWithInt:1.0]];
    [self.view.layer insertSublayer:gradient atIndex:0];
}

@end
