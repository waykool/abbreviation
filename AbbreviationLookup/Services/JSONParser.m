//
//  JSONParser.m
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

#import "JSONParser.h"

NSString *const kListOfAbbreviationKey = @"lfs";
NSString *const kAbbreviationKey = @"lf";

@implementation JSONParser

/**
     Convert a api response dictionary into an Array of Strings
     @param data: a json object returned by the API
     @return a list of strings with all fullforms
*/
+ (NSArray *)parseFullFormsFromDictionary:(NSArray *)data
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];

    if(data.count > 0) {
        NSArray *responseList = data[0][kListOfAbbreviationKey];

        for (NSDictionary *object in responseList) {
            NSString *acromine = object[kAbbreviationKey];
            [returnArray addObject: [acromine capitalizedString]];
        }
    }

    return returnArray;
}

@end
