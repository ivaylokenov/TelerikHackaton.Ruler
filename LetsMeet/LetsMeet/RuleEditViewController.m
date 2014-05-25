//
//  ViewController.m
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import "RuleEditViewController.h"
#import "Notification.h"
#import "AppDelegate.h"

@interface RuleEditViewController ()

@end

@implementation RuleEditViewController
{
    UITableView *_tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //self.view.backgroundColor = [UIColor whiteColor];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.view.backgroundColor = [UIColor colorWithPatternImage:appDelegate.backgrnd];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 30)];
    _tableView.autoresizingMask = ~UIViewAutoresizingNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return @"Title:";
    
    if (section == 1)
        return @"Conditions:";
    
    if (section == 2)
        return @"Action:";
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return 1;
    
    if (section == 1)
        return self.notification.conditions.count + 1;
    
    return 1;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    int section = textField.tag / 1000;
    int row = textField.tag - (textField.tag / 1000);
    
    if (section == 0) {
        _notification.title = textField.text;
    }
    else if (section == 1) {
        if (row < _notification.conditions.count) {
            [_notification.conditions removeObjectAtIndex:row];
            [_notification.conditions insertObject:textField.text atIndex:row];
        }
        else {
            [_notification.conditions addObject:textField.text];
            [_tableView reloadData];
        }
    }
    else if (section == 2) {
        _notification.action = textField.text;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    
    NSString *text = @"";
    NSString *img = nil;
    
    if (indexPath.section == 0)
        text = _notification.title;
    
    if (indexPath.section == 1)
    {
        if (indexPath.row < self.notification.conditions.count) {
            text = self.notification.conditions[indexPath.row];
            if (indexPath.row < self.notification.icons.count) {
                img = self.notification.icons[indexPath.row];
            }
        }
        else {
            text = @"Tap to add new condition!";
        }
    }

    if (indexPath.section == 2)
    {
        text = self.notification.action;
    }
    
    if (cell.tag == 0) {
        UITextField *editField = [[UITextField alloc] initWithFrame:CGRectMake(70, 12, 240, 31)];
        editField.textAlignment = UITextAlignmentCenter;
        editField.clearButtonMode  = UITextFieldViewModeAlways;
        editField.textAlignment = UITextAlignmentLeft;
        editField.delegate = self;
        editField.text = text;
        editField.font = [UIFont fontWithName:@"Helvetica" size:14.0];
        editField.tag = indexPath.section * 1000 + indexPath.row;
        [cell.contentView addSubview:editField];
        cell.tag = 1;
    }
    else {
      ///  UITextField *editField = cell.contentView.subviews[cell.contentView.subviews.count-1];
     //   editField.text = text;
    }
    
    //cell.backgroundColor = [UIColor clearColor];
    
    if (img != nil) {
        cell.imageView.image = [UIImage imageNamed:img];
    }
    
    return cell;
}

#pragma mark UITextFieldDelegate

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 33)];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 33)];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont fontWithName:@"Noteworthy-Bold" size:23]];
    NSString *string = nil;
    
    if (section == 0)
        string = @"Title";
    
    if (section == 1)
        string = @"Conditions";
    
    if (section == 2)
        string = @"Action";

    [label setText:string];
    [view addSubview:label];
    //[view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]];
    
    return view;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}


@end
