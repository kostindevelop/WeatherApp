//
//  APIClient.h
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/16/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIClientDelegate
- (void)didRecieveResponseWithResult:(id)result error:(NSError *)error;
@end

@interface APIClient : NSObject

@property (nonatomic, weak) id<APIClientDelegate> delegate;

- (void)searchWithCityName:(NSString *)cityName;

@end
