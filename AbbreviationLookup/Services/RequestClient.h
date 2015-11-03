//
//  RequestClient.h
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestClient : NSObject

+ (void)makeGetRequestForURL:(NSString *)urlString
              successHandler:(void (^)(NSArray *))successHandler
              failureHandler:(void (^)(NSError *))failureHandler;

@end
