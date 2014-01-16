//
//  PayView.h
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaySearch.h"
#import "PumpDetail.h"
@interface PayView : UIViewController<UIAlertViewDelegate>{
    
    UIAlertView *progressAlert;
    PaySearch *paySearch;
    PumpDetail *pumpDetail;
    UITextField *textField;
    BOOL submitPage;
    BOOL status;
    BOOL cancel;
    UIViewController *dashboardRef;
}
@property (unsafe_unretained, nonatomic) IBOutlet UIView *myView;
@property (nonatomic,strong)UIViewController *dashboardRef;
-(void)call;
@end
