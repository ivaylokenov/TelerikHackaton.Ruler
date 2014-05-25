//
//  AppDelegate.h
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *password;

@property (strong,nonatomic) NSMutableArray *notifications;
@property (strong, nonatomic) UIImage *backgrnd;

@end
