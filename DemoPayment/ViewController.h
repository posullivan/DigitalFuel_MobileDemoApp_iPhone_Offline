//
//  ViewController.h
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface ViewController : UIViewController
{
  //  UINavigationController *navigation;
    Dashboard *dashboard;
    bool status;
    bool status1;
    NSScanner *scanner;
    double result;
    
    
}

@property (strong, nonatomic) IBOutlet UITextField *useridText;
@property (strong, nonatomic) IBOutlet UITextField *passcodeText;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *usersecondText;

- (IBAction)loginBtn:(id)sender;
- (IBAction)forgottenBtn:(id)sender;
-(IBAction)hideKeypad:(id)sender;


@end
