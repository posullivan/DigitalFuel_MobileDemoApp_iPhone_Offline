//
//  Dashboard.h
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionHistory.h"
#import "PayView.h"
@interface Dashboard : UIViewController
{
    UINavigationController *navigation;
    TransactionHistory *transactionHistory;
    PayView *payView;
    UIAlertView *progressAert;
}
- (IBAction)playBtn:(id)sender;
- (IBAction)profileBtn:(id)sender;
- (IBAction)transactionBtn:(id)sender;
- (IBAction)signOutBtn:(id)sender;
@property (unsafe_unretained, nonatomic) IBOutlet UIView *myView;
-(void)call;
@end
