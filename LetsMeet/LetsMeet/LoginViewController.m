//
//  LoginViewController.m
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    UITableView *_tableView;
    UITextField *userNameFeild;
    UITextField *passWordFeild;
    UITableViewCell *signInCell;
    UITableViewCell *signUpCell;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Login";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    userNameFeild.text = @"";
    passWordFeild.text = @"";
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];

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

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"loginCell"];
    
    [self.view addSubview:_tableView];
   
}

- (void)doneTouched:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (userNameFeild.text.length > 0 && passWordFeild.text.length > 0) {
        signInCell.textLabel.enabled = YES;
    }
    else {
        signInCell.textLabel.enabled = NO;
    }
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loginCell"];
 
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"User name:";
            userNameFeild = [[UITextField alloc] initWithFrame:CGRectMake(115,12, 180, 31)];
            userNameFeild.textAlignment = UITextAlignmentCenter;
            userNameFeild.textColor = [UIColor blueColor];
            userNameFeild.clearButtonMode  = UITextFieldViewModeAlways;
            userNameFeild.delegate = self;
            userNameFeild.font = [UIFont fontWithName:@"Helvetica" size:14.0];
            [cell.contentView addSubview:userNameFeild];
        }
        else {
            cell.textLabel.text = @"Password:";
            passWordFeild = [[UITextField alloc] initWithFrame:CGRectMake(115,12, 180, 31)];
            passWordFeild.textAlignment = UITextAlignmentCenter;
            passWordFeild.textColor = [UIColor blueColor];
            passWordFeild.clearButtonMode = UITextFieldViewModeAlways;
            passWordFeild.secureTextEntry = YES;
            passWordFeild.delegate = self;
            passWordFeild.font = [UIFont fontWithName:@"Helvetica" size:14.0];
            [cell.contentView addSubview:passWordFeild];
        }
    }
    else {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Sign in";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.enabled = NO;
            signInCell = cell;
        }
        else {
            cell.textLabel.text = @"Sign up";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            signUpCell = cell;
        }
    }
    
    tableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        [self.view endEditing:YES];
        if (indexPath.row == 1) {
            SignUpViewController *signUpController = [[SignUpViewController alloc] init];
            signUpController.rulesListController = self.rulesListController;
            [self.navigationController pushViewController:signUpController animated:YES];
        }
        else if (indexPath.row == 0 && userNameFeild.text.length > 0 && passWordFeild.text.length > 0) {
            AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
            appDelegate.name = userNameFeild.text;
            appDelegate.password = passWordFeild.text;
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

@end
