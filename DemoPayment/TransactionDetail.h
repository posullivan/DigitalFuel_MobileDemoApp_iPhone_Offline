//
//  TransactionDetail.h
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionDetail : UIViewController{
    
    NSArray *rowHeadings;
    NSDictionary *detailDict;
    int section;
    NSArray *image;
    NSArray *address;
    
}

@property(nonatomic)int section;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *myImage;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *myLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *myTable;

@end
