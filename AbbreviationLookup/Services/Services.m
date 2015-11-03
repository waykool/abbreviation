//
//  Services.m
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright © 2015 Pedro Peres. All rights reserved.
//

#import "Services.h"
#import "JSONParser.h"
#import "RequestClient.h"

static Services *_sharedInstance = nil;
NSString *const kBaseURL = @"http://nactem.ac.uk/software/acromine/dictionary.py";

@implementation Services


+ (Services *)sharedInstance {
    if (_sharedInstance == nil) {
        _sharedInstance = [[Services alloc] init];
    }
    return _sharedInstance;
}

/**
    Service Method for calling abbreviation API parsing
    @param Abbreviation: string used in the API call
    @param successHandler: success block called of request is successful
    @param failureHandler: failure block called when request fails
*/
- (void)getFullFormsForAbbreviation:(NSString *)abbreviation
               successHandler:(void (^)(NSArray *))successHandler
               failureHandler:(void (^)(NSError *))failureHandler
{
    NSString *urlString = [NSString stringWithFormat:@"%@?sf=%@", kBaseURL, abbreviation];
    [RequestClient makeGetRequestForURL:urlString successHandler:^(NSArray *responseObject) {
        NSArray *listOfStrings = [JSONParser parseFullFormsFromDictionary:responseObject];
        successHandler(listOfStrings);

    } failureHandler:^(NSError *error) {
        failureHandler(error);

    }];
}

@end
