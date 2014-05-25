//
//  SummaryViewController.h
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UIViewController

@property IBOutlet UILabel *nameLabel;
@property IBOutlet UILabel *descriptionLabel;
@property IBOutlet UIButton *logOutButton;

-(IBAction)logoutButtonTouched:(id)sender;

@end
