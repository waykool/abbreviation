//
//  Services.h
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright © 2015 Pedro Peres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Services : NSObject

+(Services *)sharedInstance;

- (void)getFullFormsForAbbreviation:(NSString *)abbreviation
                     successHandler:(void (^)(NSArray *))successHandler
                     failureHandler:(void (^)(NSError *))failureHandler;

@end
