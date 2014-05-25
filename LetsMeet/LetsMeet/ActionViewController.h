//
//  ActionViewController.h
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionViewController : UIViewController <UITableViewDataSource>

@property IBOutlet UILabel *titleLabel;
@property IBOutlet UITextView *msgBody;
@property IBOutlet UITableView *recipientsList;

- (IBAction)sendMessageTouched:(id)sender;
- (IBAction)ignoreTouched:(id)sender;

@end
