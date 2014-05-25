//
//  SignUpViewController.m
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
{
    UITableView *_tableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Sign Up";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIColor *backColor = [UIColor colorWithWhite:247./255. alpha:1.];
    
    self.view.backgroundColor = backColor;
    self.navigationItem.hidesBackButton = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.autoresizingMask = ~UIViewAutoresizingNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = backColor;
    
    UIView *footer = [UIView new];
    footer.backgroundColor = [UIColor colorWithRed:200./255. green:199./255. blue:204./255. alpha:1.];
    footer.frame = CGRectMake(0, 0, 320, 0.5);
    _tableView.tableFooterView = footer;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"signCell"];
    
    [self.view addSubview:_tableView];

}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Personal info";
    }
    else if (section == 1) {
        return @"Login details";
    }
    else {
        return @" ";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    else if (section == 1) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"signCell"];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Name:";
        }
        else if (indexPath.row == 1) {
            cell.textLabel.text = @"Family:";
        }
        else if (indexPath.row == 2) {
            cell.textLabel.text = @"Email:";
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"User name:";
        }
        else if (indexPath.row == 1) {
            cell.textLabel.text = @"Password:";
        }
        else if (indexPath.row == 2) {
            cell.textLabel.text = @"Retype password:";
        }
    }
    else {
        cell.textLabel.text = @"Done";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 33;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController popToViewController:self.rulesListController animated:YES];
}

@end
