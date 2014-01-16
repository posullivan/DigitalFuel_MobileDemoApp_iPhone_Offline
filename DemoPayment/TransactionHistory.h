//
//  TransactionHistory.h
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionDetail.h"
@interface TransactionHistory : UIViewController
{
    TransactionDetail *detail;    
    NSArray *petrolStation;
    NSArray *image;
    NSMutableArray *tableData;
    NSMutableArray *indexArray;
    BOOL shouldBeginEditing;
    BOOL cancel;
    
  
}
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *myTable;
@property (unsafe_unretained, nonatomic) IBOutlet UISearchBar *mySearchBar;
-(void)onCancelSearch:(id)sender;
@end
