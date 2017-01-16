//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Abhinav Wagle on 1/16/17.
//  Copyright (c) 2017 Abhinav. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableViews];
    self.tableData = @[ @"15%", @"20%", @"25%"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) configureTableViews {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
}

// Loads number of rows in table. Mandatory to implement this method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

// Logic to load each value in the table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"indexPath.row %li", indexPath.row);
    NSLog(@"title of cell %@", [self.tableData objectAtIndex:indexPath.row]);
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    [defaults setInteger: indexPath.row forKey:@"defaultKey"];
    [defaults synchronize];

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"Settings view did appear");
}

@end
