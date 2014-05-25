//
//  RulesListViewController.m
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import "RulesListViewController.h"
#import "RuleEditViewController.h"
#import "LoginViewController.h"
#import "SummaryViewController.h"
#import "Notification.h"
#import "AppDelegate.h"

@interface RulesListViewController ()

@end

@implementation RulesListViewController
{
    UITableView *_tableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Rules list";
        }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.view.backgroundColor = [UIColor colorWithPatternImage:appDelegate.backgrnd];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.autoresizingMask = ~UIViewAutoresizingNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ruleCell"];
    
    [self.view addSubview:_tableView];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addTouched:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(loginTouched:)];
    self.navigationItem.leftBarButtonItem = loginButton;
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userDidSwipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

- (void)userDidSwipe:(UISwipeGestureRecognizer*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addTouched:(UIBarButtonItem*)sender
{
    Notification *newNotification = [[Notification alloc] init];
    newNotification.conditions = [[NSMutableArray alloc] init];
    
    RuleEditViewController *ruleEditController = [[RuleEditViewController alloc] init];
    ruleEditController.notification = newNotification;
    ruleEditController.title = @"Add new rule";
    [self.navigationController pushViewController:ruleEditController animated:YES];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.notifications addObject:newNotification];
}

- (void)loginTouched:(UIBarButtonItem*)sender
{
//    LoginViewController *loginController = [[LoginViewController alloc] init];
//    loginController.rulesListController = self;
//    [self.navigationController pushViewController:loginController animated:YES];
    
 //   SummaryViewController *summaryController = [[SummaryViewController alloc] init];
 //   [self.navigationController pushViewController:summaryController animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.notifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ruleCell"];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    Notification *notification = appDelegate.notifications[indexPath.row];
    cell.textLabel.text = notification.title;
    //cell.imageView.image=[UIImage imageNamed:@"five.jpg"];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    Notification *newNotification = appDelegate.notifications[indexPath.row];
    RuleEditViewController *ruleEditController = [[RuleEditViewController alloc] init];
    ruleEditController.notification = newNotification;
    ruleEditController.title = @"Edit rule";
    [self.navigationController pushViewController:ruleEditController animated:YES];
}

@end
