//
//  TransactionDetail.m
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "TransactionDetail.h"
#import "CustomCell.h"

@implementation TransactionDetail
@synthesize section;
@synthesize myImage;
@synthesize myLabel;
@synthesize myTable;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self.navigationItem setTitle:@"Transaction History"]; 
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    rowHeadings=[[NSArray alloc]initWithObjects:@"Date & Time",
                 @"Liters",
                 @"Cost per Liter",
                 @"Total Cost",
                 nil ];
    address=[[NSArray alloc]initWithObjects:@"Royale Leisure Park,\nKendal Avenue,\nLondon,\nW3 0PA\nTel: 020 8896 7400",
    @"297-309,Southwark Park Rd,\nLondon,\nSE16 2JN\nTel: 020 7394 4810",
    @"196-206,Camden Rd,\nLondon,\nNW1 9HG\nTel: 020 7800 7400",
    @"Marsh Rd, Huntingdon,\nCambridgeshire,\nPE28 2DN\nTel: 01480 444760",
    @"Ackworth Rd, Pontefract,\nWest Yorkshire,\nWF8 3QH\nTel: 01977 702581",
    @"177,Creek Rd,\nLondon,\nSE8 3BU\nTel: 020 8692 9871",
    @"211,Shinfield Rd,Reading,\nBerkshire,\nRG2 8HA\nTel: 0118 922 4510",
    @"196-206,Camden Rd,\nLondon,\nNW1 9HG\nTel: 020 7800 7400",
    nil ];
    image =[[NSArray alloc]initWithObjects:@"Shell_logo_svg_full.png",@"Shell_logo_svg_full.png",@"esso.png",@"bp123.png",@"bp123.png",@"esso.png",@"Shell_logo_svg_full.png",@"esso.png", nil];
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Detail" ofType:@"plist" ];
    detailDict=[NSDictionary  dictionaryWithContentsOfFile:path];
}


- (void)viewDidUnload
{
  
    [self setMyImage:nil];
    [self setMyLabel:nil];
    [self setMyTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewWillAppear:(BOOL)animated
{
    //Displays details of selected pump
     myImage.image=[UIImage imageNamed:[image objectAtIndex:section]];
     myLabel.text=[address objectAtIndex:section];
     [myTable reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    
    return 4;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
   //displays Date,Time,Price....
    static NSString *CellIdentifier = @"Cell"; 
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
         cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
    }
    
    cell.primaryLabel.text =[rowHeadings objectAtIndex:indexPath.row];
    NSLog(@"section=%d",section);
    NSString *key=[NSString stringWithFormat:@"%d",section];
    cell.secondaryLabel.text =[[detailDict objectForKey:key] objectAtIndex:indexPath.row];
            
   
   
    return cell;
    
}


@end
