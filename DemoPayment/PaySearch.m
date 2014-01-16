//
//  PaySearch.m
//  DemoPayment
//
//  Created by Basil Abbas on 07/03/12.
//  Copyright (c) 2012 basil@tecsolsoftware.com. All rights reserved.
//

#import "PaySearch.h"

@implementation PaySearch
@synthesize myTableView;

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
    self.navigationItem.title=@"Select a Petrol Station";
    petrolStation=[[NSArray alloc]initWithObjects:@"Royale Leisure Park,Kendal Avenue,\nLondon,\nW3 0PA\nTel: 020 8896 7400",
                                            @"297-309,Southwark Park Rd,\nLondon,\nSE16 2JN\nTel: 020 7394 4810",
                                            @"196-206,Camden Rd,\nLondon,\nNW1 9HG\nTel: 020 7800 7400",
                                            @"Marsh Rd, Huntingdon,\nCambridgeshire,\nPE28 2DN\nTel: 01480 444760",
                                            @"Ackworth Rd, Pontefract,\nWest Yorkshire,\nWF8 3QH\nTel: 01977 702581",
                                            @"177,Creek Rd,\nLondon,\nSE8 3BU\nTel: 020 8692 9871",
                                            @"211,Shinfield Rd,Reading,\nBerkshire,\nRG2 8HA\nTel: 0118 922 4510",
                                            @"196-206,Camden Rd,\nLondon,\nNW1 9HG\nTel: 020 7800 7400",
                                            nil ];
     image =[[NSArray alloc]initWithObjects:@"Shell_logo_svg_full.png",@"Shell_logo_svg_full.png",@"esso.png",@"bp123.png",@"bp123.png",@"esso.png",@"Shell_logo_svg_full.png",@"esso.png", nil];
    tableData = [[NSMutableArray alloc]initWithArray:petrolStation];
    indexArray = [[NSMutableArray alloc]init];
    for (int i =0; i<[petrolStation count]; i++) {
        [indexArray addObject:[NSNumber numberWithInt:i]];
    }

    NSLog(@"%@",tableData);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [indexArray removeAllObjects];
    [tableData removeAllObjects];// remove all data that belongs to previous search
    if([searchText isEqualToString:@""]||searchText==nil)
    {
        [tableData addObjectsFromArray:petrolStation];
        for (int i =0; i<[petrolStation count]; i++) 
        {
            [indexArray addObject:[NSNumber numberWithInt:i]];
        }
        
        [myTableView reloadData];
        
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
    //load to table view
    [myTableView reloadData];    
 
}
- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{ 
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backGround.png"]];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //search...
    [searchBar resignFirstResponder];//hide Keypad
    [indexArray removeAllObjects];
    tableData = [[NSMutableArray alloc]initWithArray:petrolStation];
    
    for (int i =0; i<[petrolStation count]; i++) {
        [indexArray addObject:[NSNumber numberWithInt:i]];
    }
    [myTableView reloadData];
    
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
    //displays petrol station on the cell
    [cell.textLabel setNumberOfLines:4];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    cell.textLabel.text=[tableData objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[image objectAtIndex:[(NSNumber *)[indexArray objectAtIndex:indexPath.row] intValue]]];
    cell.textLabel.textColor=[UIColor whiteColor];
    return cell;    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //Display alert for selcting the cell on Table
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Error" message:@" You cannot fill up at this petrol pump " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert1 show];
    
} 

-(void)viewWillAppear:(BOOL)animated
{
    //displays all Petrol station on table
    [indexArray removeAllObjects];  
    tableData = [[NSMutableArray alloc]initWithArray:petrolStation];
    for (int i =0; i<[petrolStation count]; i++) 
    {
        [indexArray addObject:[NSNumber numberWithInt:i]];
    }
    [myTableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
  
   
}
- (void)viewDidUnload
{
    [self setMyTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
