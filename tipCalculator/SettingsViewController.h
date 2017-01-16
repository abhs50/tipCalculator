//
//  SettingsViewController.h
//  tipCalculator
//
//  Created by Abhinav Wagle on 1/16/17.
//  Copyright (c) 2017 Abhinav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property UITableView *table;
@property NSArray *tableData;
@property NSString *defaultSettingKey;
@property (nonatomic) int selectedRow;

@end
