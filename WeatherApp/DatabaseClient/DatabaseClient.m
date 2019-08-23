//
//  DatabaseClient.m
//  WeatherApp
//
//  Created by Konstantin Igorevich on 10/19/17.
//  Copyright © 2017 I am Konstantin. All rights reserved.
//

#import "DatabaseClient.h"
#import <MagicalRecord/MagicalRecord.h>
#import "City+CoreDataClass.h"

@implementation DatabaseClient

+ (void)saveObjectWithCityName:(NSString *)cityName {
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        City *city = [City MR_findFirstByAttribute:@"name" withValue:cityName inContext:localContext];
        if (city) {
            [city MR_deleteEntityInContext:localContext];
        } else {
            city = [City MR_createEntityInContext:localContext];
            city.name = cityName;
        }
    }];
}

+ (BOOL)containsCityWithName:(NSString *)cityName {
    City *city = [City MR_findFirstByAttribute:@"name" withValue:cityName];
    return city != nil;
}

+ (NSArray *)getFavouritesCityNames {
    NSArray *cities = [City MR_findAll];
    return [cities valueForKeyPath:@"name"];
}

+ (void)deleteObjectWithCityName:(NSString *)cityName {
    City *city = [City MR_findFirstByAttribute:@"name" withValue:cityName];
    [city MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}
@end
