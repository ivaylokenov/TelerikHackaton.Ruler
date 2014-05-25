//
//  ActionViewController.m
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import "ActionViewController.h"

@interface ActionViewController () <UIAlertViewDelegate>

@end

@implementation ActionViewController
{
    NSArray *recipients;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Message recieved";
        recipients = @[ @"pesho", @"gosho", @"doncho" ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.recipientsList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"recell"];
    
    self.titleLabel.text = @"It's 6 pm";
    self.msgBody.text = @"Foosball time!";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessageTouched:(id)sender
{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"" message:@"The message has been successfully sent!"
                                                  delegate:self
                                         cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [view show];
}

- (IBAction)ignoreTouched:(id)sender
{
    exit(0);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    exit(0);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return recipients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recell"];
    cell.textLabel.text = recipients[indexPath.row];
    return cell;
}

@end
