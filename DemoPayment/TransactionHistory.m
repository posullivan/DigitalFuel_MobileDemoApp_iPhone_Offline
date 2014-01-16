//
//  TransactionHistory.m
//  DemoPayment
//
//  Created by Basil Abbas on 06/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "TransactionHistory.h"

@implementation TransactionHistory
@synthesize myTable;
@synthesize mySearchBar;
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
    detail =[[TransactionDetail alloc]init];
    petrolStation=[NSArray arrayWithObjects:@"Royale Leisure Park,\n12th July 2011, 13:21",
                @"297-309,Southwark Park Rd,\n9th Aug 2011, 10:14",
                @"196-206,Camden Rd,\n29th Sep 2011, 08:49",
                @"Marsh Rd,\n2nd Oct 2011, 19:23",
                @"Ackworth Rd,\n19th Nov 2011, 21:43",
                @"177,Creek Rd,\n10th Dec 2011, 07:12",
                @"211,Shinfield Rd,\n26th Dec 2011, 14:22",
                @"196-206,Camden Rd,\n29th Jan 2012, 17:23",nil];
    
    image =[[NSArray alloc]initWithObjects:@"Shell_logo_svg_full.png",@"Shell_logo_svg_full.png",@"esso.png",@"bp123.png",@"bp123.png",@"esso.png",@"Shell_logo_svg_full.png",@"esso.png", nil];
    tableData = [[NSMutableArray alloc]initWithArray:petrolStation];
     [self.navigationItem setTitle:@"Transaction History"]; 
    indexArray = [[NSMutableArray alloc]init];
    for (int i =0; i<[petrolStation count]; i++) {
        [indexArray addObject:[NSNumber numberWithInt:i]];
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)onCancelSearch:(id)sender
{
/////Cancelling the Search
        cancel=YES;
        mySearchBar.text = @"";
        [mySearchBar resignFirstResponder];
        [indexArray removeAllObjects];
        [tableData removeAllObjects];
            [tableData addObjectsFromArray:petrolStation];
            for (int i =0; i<[petrolStation count]; i++)
            {
                [indexArray addObject:[NSNumber numberWithInt:i]];
            }
    
            [myTable reloadData];
      
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
  
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor clearColor];
    [btn setFrame:CGRectMake(260, 5, 53, 32)];
    [btn addTarget:self action:@selector(onCancelSearch:) forControlEvents:UIControlEventTouchUpInside];
    [searchBar addSubview:btn];
//////Loading the search 
    if(![searchBar isFirstResponder]) 
    {
        // user tapped the 'clear' button
        shouldBeginEditing = NO;
        // do whatever I want to happen when the user clears the search...
        [searchBar resignFirstResponder];
    }
    [indexArray removeAllObjects];
    [tableData removeAllObjects];// remove all data that belongs to previous search
    if([searchText isEqualToString:@""]||searchText==nil)
    {
        //        [tableData removeAllObjects];
        [tableData addObjectsFromArray:petrolStation];
        for (int i =0; i<[petrolStation count]; i++)
        {
            [indexArray addObject:[NSNumber numberWithInt:i]];
        }

        [myTable reloadData];
        
        return;
    }
    for(int i=0; i<[petrolStation count]; i++)
    {
        NSString *name = [petrolStation objectAtIndex:i];
        NSRange r = [name rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if(r.location != NSNotFound)
        {
            [tableData addObject:name];
            NSLog(@"name:%@",name);
            [indexArray addObject:[NSNumber numberWithInt:i]];
        }
        
    }
    [myTable reloadData];
   
}
- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{ 
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backGround.png"]];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)bar {
    // reset the shouldBeginEditing BOOL ivar to YES, but first take its value and use it to return it from the method call
    
    BOOL boolToReturn = shouldBeginEditing;
    shouldBeginEditing = YES;
    return boolToReturn;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

     [mySearchBar resignFirstResponder];///hide Keypad
   
    // Do the search...
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    
    return [tableData count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell"; 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
    if (cell == nil) 
    { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
    }
    
    [cell.textLabel setNumberOfLines:2];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    cell.textLabel.text=[tableData objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[image objectAtIndex:[(NSNumber *)[indexArray objectAtIndex:indexPath.row] intValue]]];
    cell.textLabel.textColor=[UIColor whiteColor];
     
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ////////On selecting the table cell will push to corresponding Transaction Detail View
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    detail.section=[(NSNumber *)[indexArray objectAtIndex:indexPath.row] intValue];
    NSLog(@"section=%d",detail.section);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.navigationItem setBackBarButtonItem: backButton];
    [self.navigationController pushViewController:detail animated:YES];
    
   
} 
- (void)viewDidUnload
{
    [self setMyTable:nil];
    mySearchBar = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewWillAppear:(BOOL)animated
{
     shouldBeginEditing = YES;
     cancel=NO;
}
-(void)viewWillDisappear:(BOOL)animated{
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
