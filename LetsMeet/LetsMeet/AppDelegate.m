//
//  AppDelegate.m
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import "AppDelegate.h"
#import "RulesListViewController.h"
#import "HomeViewController.h"
#import "SummaryViewController.h"
#import "Notification.h"
#import "ActionViewController.h"
#import "LoginViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    self.notifications = [[NSMutableArray alloc] init];
    
    Notification *n1 = [[Notification alloc] init];
    n1.title = @"Go to the tech meetup";
    n1.conditions = [[NSMutableArray alloc] init];
    [n1.conditions addObject: @"If it's sunny"];
    [n1.conditions addObject: @"If am in Sofia"];
    [n1.conditions addObject: @"If it's between 10AM and 5PM"];
    [n1.conditions addObject: @"If it's on the weekend"];
   
    n1.icons = [[NSMutableArray alloc] init];
    [n1.icons addObject:@"Calendar.png"];
    [n1.icons addObject:@"Location.png"];
    [n1.icons addObject:@"Calendar.png"];
    [n1.icons addObject:@"Calendar.png"];
    n1.action = @"Check for tech events at meetup.com";
    [self.notifications addObject:n1];
    
    Notification *n2 = [[Notification alloc] init];
    n2.title = @"Play foosball with the team";
    n2.conditions = [[NSMutableArray alloc] init];
    [n2.conditions addObject: @"If I am in Sofia"];
    [n2.conditions addObject: @"If it's between 5 and 6 PM"];
    [n2.conditions addObject: @"If it's on a work day"];
    n2.action = @"Send sms to my colleagues";
    
    n2.icons = [[NSMutableArray alloc] init];
    [n2.icons addObject:@"Location.png"];
    [n2.icons addObject:@"Calendar.png"];
    [n2.icons addObject:@"Calendar.png"];
    
    [self.notifications addObject:n2];
    
    SummaryViewController *mainView = [[SummaryViewController alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:mainView];
    navigation.navigationBar.translucent = YES;
    
    self.backgrnd = [UIImage imageNamed:@"bg1.png"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigation;
//    self.window.backgroundColor = [UIColor colorWithPatternImage:backgrnd];
    [self.window makeKeyAndVisible];
    
    LoginViewController *login = [[LoginViewController alloc] init];
    [navigation pushViewController:login animated:NO];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UINavigationController *c = (UINavigationController*)self.window.rootViewController;
    ActionViewController *a = [[ActionViewController alloc] init];
    [c pushViewController:a animated:NO];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
