//
//  Services.h
//  AcromineLookUp
//
//  Created by Pedro Peres on 11/1/15.
//  Copyright © 2015 Pedro Peres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Services : NSObject

+(Services *)sharedInstance;

- (void)getFullFormsForAbbreviation:(NSString *)abbreviation
                     successHandler:(void (^)(NSArray *))successHandler
                     failureHandler:(void (^)(NSError *))failureHandler;

@end
