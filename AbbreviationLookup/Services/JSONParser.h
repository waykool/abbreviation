//
//  JSONParser.h
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

+ (NSArray *)parseFullFormsFromDictionary:(NSArray *)data;

@end
