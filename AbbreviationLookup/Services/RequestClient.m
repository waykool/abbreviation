//
//  RequestClient.m
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

#import "RequestClient.h"
#import "AFNetworking.h"

@implementation RequestClient

/**
    Makes a GET request with the provided urlString
    @param urlString: string used to make Request
    @param successHandler: success block called of request is successful
    @param failureHandler: failure block called when request fails
*/
+ (void)makeGetRequestForURL:(NSString *)urlString
               successHandler:(void (^)(NSArray *))successHandler
               failureHandler:(void (^)(NSError *))failureHandler
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        successHandler(responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureHandler(error);
    }];
}

@end
