//
//  ViewController.m
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize useridText;
@synthesize passcodeText;
@synthesize usersecondText;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
     self.navigationController.navigationBarHidden=YES;
    dashboard =[[Dashboard alloc]init];
  
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    [useridText resignFirstResponder]; // hide the keyboard
    [usersecondText resignFirstResponder];
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
   // NSUInteger newLengthforid;
    NSUInteger newLengthforPasscode;
    NSCharacterSet *numSet;
    NSString *newString;

    //check for maximum charecters while typing
    
    switch (textField.tag) 
    {
        case 1:
            
//            newLengthforid = [useridText.text length] + [string length] - range.length;
//                return (newLengthforid > 8) ? NO : YES;
          numSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "];
           newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            int charCount = [newString length];
            
            if ([newString rangeOfCharacterFromSet:[numSet invertedSet]].location != NSNotFound
                || [string rangeOfString:@" "].location != NSNotFound
                || charCount > 8) {
                return NO;
            }
            if ([string isEqualToString:@""]) { return YES; }
            if (charCount == 4) {
                newString = [newString stringByAppendingString:@" "];
            }
            
            textField.text = newString;
            
            return NO;

                break;
            
        case 2:
            
            newLengthforPasscode = [passcodeText.text length] + [string length] - range.length;
            return (newLengthforPasscode>5) ? NO : YES;
            
        default:
            break;
          
    }
  
}  
    

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [useridText resignFirstResponder];
    [passcodeText resignFirstResponder];
}

- (void)viewDidUnload
{
    [self setUseridText:nil];
    [self setPasscodeText:nil];
    [self setUsersecondText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    useridText.text=@"";
    passcodeText.text=@"";
    usersecondText.text=@"";
   
	[super viewWillDisappear:animated];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loginBtn:(id)sender 
{
    NSString *letters;
    NSString *num;
    
    ////check for valid username and password
    
    scanner = [NSScanner scannerWithString:useridText.text];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789 "];
    status= [scanner scanCharactersFromSet:numbers intoString:&num];
    status = status && scanner.scanLocation ==useridText.text.length;
    
    NSCharacterSet *string = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "];
    status1= [scanner scanCharactersFromSet:string intoString:&letters];
    status1 = status1 && scanner.scanLocation ==useridText.text.length;
  
    if([useridText.text isEqualToString:@""]|| [passcodeText.text isEqualToString:@""]||([useridText.text length]>8 )||([passcodeText.text length]>5)||(status==YES)||(status1==YES))
    {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Unrecognised" message:@"Please enter registered vehicle " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert1 show]; 
        
    }
    
    else
    {
        [useridText resignFirstResponder];
        [passcodeText resignFirstResponder];
        [usersecondText resignFirstResponder];
        dashboard.navigationItem.hidesBackButton=YES;
        [self.navigationController pushViewController:dashboard animated:YES];
    
    }
    
}

- (IBAction)forgottenBtn:(id)sender 
{
    //display alert for for forgot button
    
    UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Help-Forgotten Passcode" message:@" This is not supported in this Demo " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert1 show];
}

-(IBAction)hideKeypad:(id)sender
{
    [sender resignFirstResponder];
}



@end
