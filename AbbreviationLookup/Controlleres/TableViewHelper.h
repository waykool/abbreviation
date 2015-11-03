//
//  TableViewHelper.h
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewHelper : NSObject<UITableViewDelegate, UITableViewDataSource>

- (TableViewHelper *)initWithTableView:(UITableView *)tableView delegate:(id)delegate;
- (void) updateRowList:(NSArray *) newRowList forTable:(UITableView *)tableView;

@end
