//
//  PayView.m
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "PayView.h"

@implementation PayView
@synthesize myView;
@synthesize dashboardRef;
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
    paySearch=[[PaySearch alloc]init];
    pumpDetail=[[PumpDetail alloc]init];
    
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

-(void)call
{
    [progressAlert dismissWithClickedButtonIndex:0 animated:NO];////Dismiss the Loading....Alertview
    pumpDetail.navigationItem.hidesBackButton=YES;
    pumpDetail.dashboardRef=dashboardRef;
    /////Push to PimpDetail View
    [self.navigationController pushViewController:pumpDetail animated:NO];
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIBarButtonItem *backButton;
    
    switch (buttonIndex) {
           case 1:
            if(cancel)
            {
                //back to Dashboard on pressing Cancel
                [self.navigationController popViewControllerAnimated:NO];
                cancel=NO;
            }
            //move to PaySearch View(select petrol station) on pressing NO
                backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
                [self.navigationItem setBackBarButtonItem: backButton];
                [self.navigationController pushViewController:paySearch animated:NO];
            break;
        case 0: 
            if(!status)
            {
                //Display Alert for OK Button to enter a pump number
                    progressAlert = [[UIAlertView alloc]initWithTitle: @"" 
                                                              message:@"Which pump are you filling up at?\n\n\n\n" 
                                                             delegate:self
                                                    cancelButtonTitle:@"Submit" otherButtonTitles:@"Cancel",nil];
                    progressAlert.frame=CGRectMake(20, 50, 300, 300);
                    progressAlert.transform = CGAffineTransformTranslate( progressAlert.transform, 0.0, -15.0 );
                    textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 70.0, 265.0, 37.0)];
                    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
                    textField.keyboardType=UIKeyboardTypeNumberPad;
                    textField.borderStyle = UITextBorderStyleRoundedRect;
                    //textField.returnKeyType = UIReturnKeyDone;
                    [progressAlert addSubview:textField];
                    [textField becomeFirstResponder];
                    submitPage=YES;
                    cancel=YES;
                    [progressAlert show];
                    status=YES;
                   

            }
        else  if(submitPage)
        {
//                
                pumpDetail.section=[textField.text intValue];
                
                if([textField.text isEqualToString:@""]||([textField.text length]>1)||([textField.text intValue]>8)||[textField.text intValue]==0)
                {
                    //Display Alert when wrong number entered
                    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter a digit \nbetween 1 and 8" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [alert1 show];
                    status=NO;
                    submitPage=YES;
                   
                }
            
                else{
                    myView.alpha = 0.0;
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.5];
                    myView.alpha = 1.0;   
                    [UIView commitAnimations];
                    //To show Loading for 5 seconds
                progressAlert = [[UIAlertView alloc]initWithTitle:@"Loading...\n\n" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil] ;
                UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
                activityView.frame = CGRectMake(140.0f-18.0f, 60.0f, 26.0f, 26.0f);
                [progressAlert addSubview:activityView];
                [activityView startAnimating];
                [progressAlert show];
                
                [self performSelector:@selector(call) withObject:nil afterDelay:5.0];
                }
                             
                
            }
            else {
               //Display Alert for YES button to enter a pump number
                progressAlert = [[UIAlertView alloc]initWithTitle: @"" 
                                                          message:@"Which pump are you filling up at?\n\n\n\n" 
                                                         delegate:self
                                                cancelButtonTitle:@"Submit" otherButtonTitles:@"Cancel",nil];
                progressAlert.frame=CGRectMake(20, 50, 300, 300);
                progressAlert.transform = CGAffineTransformTranslate( progressAlert.transform, 0.0, -15.0 );
                textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 70.0, 265.0, 37.0)];
               [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
                textField.keyboardType=UIKeyboardTypeNumberPad;
                textField.borderStyle = UITextBorderStyleRoundedRect;
                [progressAlert addSubview:textField];
                [textField becomeFirstResponder];
                submitPage=YES;
                cancel=YES;
                [progressAlert show];
               
            }
            
            break;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    myView.alpha=0.0;
    //Display Alert to confirm the petrol station
    progressAlert = [[UIAlertView alloc] 
                     initWithTitle: @"" 
                     message:@"Is this the petrol station you would like to fill up at?"
                     delegate: self 
                     cancelButtonTitle: @"Yes" otherButtonTitles: @"No", nil]; 
    progressAlert.transform = CGAffineTransformTranslate( progressAlert.transform, 0.0, -25.0 );
    [progressAlert show];
    submitPage=NO;
    status=YES;
    cancel=NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
