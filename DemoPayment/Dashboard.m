//
//  Dashboard.m
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "Dashboard.h"

@implementation Dashboard
@synthesize myView;

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
    transactionHistory=[[TransactionHistory alloc]init];
    payView = [[PayView alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMyView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
    myView.alpha=0.0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)call
{
    [progressAert dismissWithClickedButtonIndex:0 animated:NO]; //////Dismiss the Loading view   
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.navigationItem setBackBarButtonItem: backButton];
    payView.dashboardRef=self;
    //////Push to Pay View
    [self.navigationController pushViewController:payView animated:YES];
    
}

- (IBAction)playBtn:(id)sender 
{
     //To show Loading for .5 second
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

    [self performSelector:@selector(call) withObject:nil afterDelay:1.0];
}

- (IBAction)profileBtn:(id)sender 
{
    /////Display the Alert for Profile 
    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Profile" message:@" This is not supported in this Demo " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert1 show];
}

- (IBAction)transactionBtn:(id)sender 
{
    ///////Push to Transaction History View
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.navigationItem setBackBarButtonItem: backButton];
    [self.navigationController pushViewController:transactionHistory animated:YES];
    
}

- (IBAction)signOutBtn:(id)sender 
{
    ////////To signOut
    [self.navigationController popViewControllerAnimated:YES];
}

@end
