//
//  APIClient.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/16/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworking/AFNetworking.h>

static NSString *kOpenWeatherMapAppId = @"d2a6b21c943e38d9e44edcc03c9912ad";
static NSString *kUnitsFormatMetric = @"metric";

@implementation APIClient

- (void)searchWithCityName:(NSString *)cityName{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?APPID=%@&q=%@&units=%@", kOpenWeatherMapAppId, cityName, kUnitsFormatMetric];
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        [self.delegate didRecieveResponseWithResult:responseObject error:error];
    }];
    [dataTask resume];
}

@end
