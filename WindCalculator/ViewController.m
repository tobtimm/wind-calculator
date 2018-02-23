//
//  ViewController.m
//  WindCalculator
//
//  Created by Tobias Timm on 2018-02-22.
//  Copyright © 2018 Tobias Timm. All rights reserved.
//

#import "ViewController.h"
#import "WindTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITextField *windTextField;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)applicationDidBecomeActive:(NSNotification *)notification {
    [self.windTextField becomeFirstResponder];
}

#pragma mark UITableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"windCell" forIndexPath:indexPath];
    
    CGFloat maxWind = [self.windTextField.text floatValue] / [cell.windPerRing.text floatValue];
    
    cell.minLabel.text = [NSString stringWithFormat:@"%.2f", maxWind * 0.75];
    
    cell.midLabel.text = [NSString stringWithFormat:@"%.2f", maxWind * 0.87];
    
    cell.maxLabel.text = [NSString stringWithFormat:@"%.2f", maxWind];
    
    return cell;
}

- (IBAction)textFieldDidChange:(id)sender {
    [self.tableView reloadData];
}

@end
