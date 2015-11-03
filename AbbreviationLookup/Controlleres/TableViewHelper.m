//
//  TableViewHelper.m
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

#import "TableViewHelper.h"

@implementation TableViewHelper {
    NSArray *_rowList;
}

- (TableViewHelper *)initWithTableView:(UITableView *)tableView delegate:(id)delegate {
    self = [super init];

    if (self) {
        tableView.delegate = self;
        tableView.dataSource = self;
    }

    return self;
}

//----------------------------------------------------------------------------------------------------------------------
    // MARK: - ActionMethods
//----------------------------------------------------------------------------------------------------------------------

- (void) updateRowList:(NSArray *) newRowList forTable:(UITableView *)tableView {
    _rowList = newRowList;
    [tableView reloadData];
}

//----------------------------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource Methods
//----------------------------------------------------------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rowList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = _rowList[indexPath.row];
    return cell;
}

@end
