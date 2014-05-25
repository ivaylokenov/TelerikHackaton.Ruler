//
//  LoginViewController.h
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SummaryViewController;

@interface LoginViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, assign) SummaryViewController *rulesListController;

@end
