//
//  SummaryViewController.m
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import "SummaryViewController.h"
#import "RulesListViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController
{
    UILabel *label; // Hi
    UILabel *label2; // Name
    UILabel *label3; // Description
    UILabel *label4; // Slide msg
    UIImageView *avatar;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Home";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor whiteColor];
    
//    label = [[UILabel alloc] init];
//    label.text = @"Hi";
//    label.font = [UIFont systemFontOfSize:44];
//    [label sizeToFit];
//    label.frame = CGRectMake(150, 80, 300, 50);
//    [self.view addSubview:label];
//    
//    label2 = [[UILabel alloc] init];
//    label2.text = @"";
//    label2.font = [UIFont systemFontOfSize:22];
//    label2.frame = CGRectMake(150, 80 + label.frame.size.height, 100, 50);
//    [self.view addSubview:label2];
//    
//    label3 = [[UILabel alloc] init];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.view.backgroundColor = [UIColor colorWithPatternImage:appDelegate.backgrnd];

    if (appDelegate.notifications.count < 1) {
        self.descriptionLabel.text = @"It is a nice day to meet with your friends. Start by adding a new rule for this!";
    }
    else {
        self.descriptionLabel.text = [NSString stringWithFormat:@"You have %d active rules.", appDelegate.notifications.count];
    }
//    label3.numberOfLines = 0;
//    label3.lineBreakMode = UILineBreakModeWordWrap;
//    label3.frame = CGRectMake(30, 140, 250, 200);
//    [self.view addSubview:label3];
//    
//    label4 = [[UILabel alloc] init];
//    label4.font = [UIFont systemFontOfSize:19];
//    label4.text = @"Slide right to see the rules list!";
//    label4.frame = CGRectMake(30, 300, 300, 40);
//    [self.view addSubview:label4];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button setTitle:@"Log out" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(logOutTouched:) forControlEvents:UIControlEventTouchUpInside];
//    button.frame = CGRectMake(50, 500, 200, 44);
//    [self.view addSubview:button];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userDidSwipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
    
    


}

int i = 0;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.nameLabel.text = appDelegate.name;
    
    i ++;
    if (i == 3) {
        
        NSDate *d = [NSDate date];
        NSDate* newDate = [d dateByAddingTimeInterval:10.0];
        [self scheduleNotificationWithItem:0 date:newDate body:@"Foosball time" action:@"It's almost 7 pm"];
    }

}

- (void)scheduleNotificationWithItem:(int)minutesBefore
                                date:(NSDate*)itemDate
                                body:(NSString*)body
                              action:(NSString*)action
{
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.fireDate = [itemDate addTimeInterval:-(minutesBefore*60)];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotif.alertBody = body;
    localNotif.alertAction = action;
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    
    //    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:item.eventName forKey:ToDoItemKey];
    //    localNotif.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

- (void)userDidSwipe:(UISwipeGestureRecognizer*)sender
{
    RulesListViewController *rules = [[RulesListViewController alloc] init];
    [self.navigationController pushViewController:rules animated:YES];
}

- (void)logoutButtonTouched:(id)sender
{
    LoginViewController *login = [[LoginViewController alloc] init];
    login.rulesListController = self;
    [self.navigationController pushViewController:login animated:YES];
}

@end
