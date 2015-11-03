//
//  ViewController.m
//  AbbreviationLookup
//
//  Created by Pedro Peres on 11/2/15.
//  Copyright (c) 2015 Pedro Peres. All rights reserved.
//

#import "ViewController.h"
#import "Services.h"
#import "MBProgressHUD.h"
#import "TableViewHelper.h"

@interface ViewController ()

@end

@implementation ViewController {
    UISearchBar * _searchBar;
    UITableView * _mainView;
    TableViewHelper * _helper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//----------------------------------------------------------------------------------------------------------------------
    // MARK: - Setup Methods
//----------------------------------------------------------------------------------------------------------------------

- (void) setupView {
    [self setTitle:@"Abbreviations Lookup"];
    _mainView = [[UITableView alloc] init];
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
    [_mainView setTableHeaderView:_searchBar];
    _searchBar.delegate = self;
    _helper = [[TableViewHelper alloc] initWithTableView:_mainView delegate:self];
    self.view = _mainView;
}


//----------------------------------------------------------------------------------------------------------------------
    // MARK: - Action Methods
//----------------------------------------------------------------------------------------------------------------------

- (void) getFullFormsForAbbreviation:(NSString *) abbreviation {
    [MBProgressHUD showHUDAddedTo:_mainView animated:YES];

    [[Services sharedInstance] getFullFormsForAbbreviation:abbreviation successHandler:^(NSArray *listOfFullForms) {
        [MBProgressHUD hideAllHUDsForView:_mainView animated:YES];
        [_helper updateRowList:listOfFullForms forTable:_mainView];


    } failureHandler:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:_mainView animated:YES];
        NSLog(@"Error: %@", error);
    }];
}

//----------------------------------------------------------------------------------------------------------------------
// MARK: - Search Delegate Methods
//----------------------------------------------------------------------------------------------------------------------

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self getFullFormsForAbbreviation:searchBar.text];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self getFullFormsForAbbreviation:searchBar.text];
}

@end
