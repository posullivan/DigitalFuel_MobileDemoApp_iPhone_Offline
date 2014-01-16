//
//  PumpDetail.m
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "PumpDetail.h"
#import "CustomCell.h"

@implementation PumpDetail

@synthesize myTextView;
@synthesize myDoneBtn;
@synthesize dashboardRef;
@synthesize myView;
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
    [self.navigationItem setTitle:@"Your Fuel Card Name"];
    rowHeadings=[[NSArray alloc]initWithObjects:@"Date & Time",
                 @"Liters",
                 @"Cost per Liter",
                 @"Total Cost",
                 nil ];
    address=[[NSArray alloc]initWithObjects:@"Royale Leisure Park,\nKendal Avenue,\nLondon,\nW3 0PA\nTel: 020 8896 7400",
             @"Royale Leisure Park,\nKendal Avenue,\nLondon,\nW3 0PA\nTel: 020 8896 7400",
             @"297-309,Southwark Park Rd,\nLondon,\nSE16 2JN\nTel: 020 7394 4810",
             @"196-206,Camden Rd,\nLondon,\nNW1 9HG\nTel: 020 7800 7400",
             @"Marsh Rd, Huntingdon,\nCambridgeshire,\nPE28 2DN\nTel: 01480 444760",
             @"Ackworth Rd, Pontefract,\nWest Yorkshire,\nWF8 3QH\nTel: 01977 702581",
             @"177,Creek Rd,\nLondon,\nSE8 3BU\nTel: 020 8692 9871",
             @"211,Shinfield Rd,Reading,\nBerkshire,\nRG2 8HA\nTel: 0118 922 4510",
             @"196-206,Camden Rd,\nLondon,\nNW1 9HG\nTel: 020 7800 7400",
             nil ];
    image =[[NSArray alloc]initWithObjects:@"Shell_logo_svg_full.png",@"Shell_logo_svg_full.png",@"Shell_logo_svg_full.png",@"esso.png",@"bp123.png",@"bp123.png",@"esso.png",@"Shell_logo_svg_full.png",@"esso.png", nil];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Detail" ofType:@"plist" ];
    detailDict=[NSDictionary  dictionaryWithContentsOfFile:path];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMyImage:nil];
    [self setMyLabel:nil];
    [self setMyTable:nil];
    [self setMyView:nil];
    [self setMyTextView:nil];
    [self setMyDoneBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewWillAppear:(BOOL)animated
{
    //Displays details of selected pump
    myDoneBtn.alpha=0.0;
    myTextView.alpha=0.0;
    [myView setAlpha:0.0];
    NSLog(@"secton=%d",section);
    myImage.image=[UIImage imageNamed:[image objectAtIndex:1]];
    
    myLabel.text=[address objectAtIndex:1];
    [myTable reloadData];
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
    NSString *key=[NSString stringWithFormat:@"%d",section-1];
    cell.secondaryLabel.text =[[detailDict objectForKey:key] objectAtIndex:indexPath.row];

    return cell;
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)call
{
    
    [progressAert dismissWithClickedButtonIndex:0 animated:NO];//dismiss laoding
    myTextView.alpha = 0.0;
    myDoneBtn.alpha = 0.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    myTextView.alpha = 1.0; 
    myDoneBtn.alpha = 1.0;
    [UIView commitAnimations];
   
}

- (IBAction)confirmBtn:(id)sender 
{
     //To show Loading for Confirm Button
    myView.alpha = 0.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    myView.alpha = 1.0;   
    [UIView commitAnimations];
    progressAert = [[UIAlertView alloc]initWithTitle:@"Loading...\n\n" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil] ;
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityView.frame = CGRectMake(140.0f-18.0f, 60.0f, 26.0f, 26.0f);
    [progressAert addSubview:activityView];
    [activityView startAnimating];
    [progressAert show];
    
    [self performSelector:@selector(call) withObject:nil afterDelay:0.8];
}

- (IBAction)cancelBtn:(id)sender 
{
    //move to Pay View
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneBtn:(id)sender 
{
   //move to dashBoard View
    [self.navigationController popToViewController:dashboardRef animated:YES];
}
@end
