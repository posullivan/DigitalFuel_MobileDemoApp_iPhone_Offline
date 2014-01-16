//
//  PaySearch.h
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaySearch : UIViewController
{
    NSArray *petrolStation;
    NSArray *image;
    NSMutableArray *tableData;
    NSMutableArray *indexArray;
}
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *myTableView;

@end
