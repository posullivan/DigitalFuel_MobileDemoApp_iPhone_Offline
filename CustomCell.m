//
//  CustomCell.m
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize primaryLabel,secondaryLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"demoCell.png"]];
        primaryLabel = [[UILabel alloc]init];
        primaryLabel.textColor = [UIColor whiteColor];
        primaryLabel.textAlignment = UITextAlignmentCenter;
        primaryLabel.font = [UIFont systemFontOfSize:14];
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentCenter;
        secondaryLabel.font = [UIFont systemFontOfSize:14];
      
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
     
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
 
    
    frame= CGRectMake(boundsX+10 ,0, 150, 50);
    [primaryLabel setBackgroundColor:[UIColor clearColor]];
    primaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+160 ,0, 150, 50);
    [secondaryLabel setBackgroundColor:[UIColor clearColor]];
    secondaryLabel.frame = frame;
}


/*
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        primaryLabel = [[UILabel alloc]init];
        primaryLabel.textAlignment = UITextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:14];
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:8];
        myImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:myImageView];
        
    }
    return self;
}
*/
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
