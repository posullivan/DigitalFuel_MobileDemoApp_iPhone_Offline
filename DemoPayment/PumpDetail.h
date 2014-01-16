//
//  PumpDetail.h
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PumpDetail : UIViewController
{
    NSArray *rowHeadings;
    NSDictionary *detailDict;
    NSArray *image;
    NSArray *address;
    UIAlertView *progressAert;
    int section;
    UIViewController *dashboardRef;
    
}
@property (unsafe_unretained, nonatomic) IBOutlet UIView *myView;
@property(nonatomic)int section;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *myImage;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *myLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *myTable;
@property (unsafe_unretained, nonatomic) IBOutlet UITextView *myTextView;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *myDoneBtn;
@property (nonatomic,strong)UIViewController *dashboardRef;
- (IBAction)confirmBtn:(id)sender;
- (IBAction)cancelBtn:(id)sender;
- (IBAction)doneBtn:(id)sender;
-(void)call;
@end

