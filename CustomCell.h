//
//  CustomCell.h
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CustomCell : UITableViewCell {
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
  
}
@property(nonatomic,retain)UILabel *primaryLabel;
@property(nonatomic,retain)UILabel *secondaryLabel;

@end