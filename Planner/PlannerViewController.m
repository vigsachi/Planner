//
//  PlannerViewController.m
//  Planner
//
//  Created by Vig Sachidananda on 9/12/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "PlannerViewController.h"

@interface PlannerViewController ()

@end

@implementation PlannerViewController {}
    
@synthesize tableTitles = _tableTitles;
@synthesize tableSubTitles = _tableSubTitles;
@synthesize tableView = _tableView;
@synthesize toBeDeleted = _toBeDeleted;
@synthesize NavBar = _NavBar;
@synthesize NavBarTitle = _NavBarTitle;
#pragma mark - View Loaded

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableTitles = [[NSMutableArray alloc]init];
    _tableSubTitles = [[NSMutableArray alloc]init];
    _toBeDeleted = [[NSMutableArray alloc]init];

//    UIImage *backgroundImage = [UIImage imageNamed:@"xxx.png"];
//    [_NavBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    UIFont *myFont = [UIFont fontWithName:@"MuseoSlab-500" size:22];
    for (NSString *familyName in [UIFont familyNames])
    { NSLog(@"Family %@", familyName); NSLog(@"Names = %@", [UIFont fontNamesForFamilyName:familyName]); }
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.font = myFont;
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor =[UIColor whiteColor];
    label.text=@"Assistant";
    _NavBarTitle.titleView = label;
    [label sizeToFit];


}




- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if ([segue.identifier isEqualToString:@"AddTask"])
    {
        AddEventViewController *addEventViewController = [segue destinationViewController];
        addEventViewController.delegate = self;
    }
    if([segue.identifier isEqualToString:@"detailView"]){
        
        // do some prep based on indexPath, if needed
    }
    
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // do a segue based on the indexPath or do any setup later in prepareForSegue
    [self performSegueWithIdentifier:@"detailView" sender:self];
}


#pragma mark - Required UITableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell = nil;
    cell = [_tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"Cell"];
    }
    
    [cell.textLabel setFont:[UIFont fontWithName:@"IstokWeb-Regular" size:18
                             ]];
    UIFont *myFont = [UIFont fontWithName:@"IstokWeb-Regular" size:12];
    cell.detailTextLabel.font = myFont;
    
    cell.textLabel.text = [_tableTitles objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_tableSubTitles objectAtIndex:indexPath.row];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
 
    UITableViewCell *c = [_tableView cellForRowAtIndexPath:indexPath];
    if (c.accessoryType == UITableViewCellAccessoryNone) {
        [c setAccessoryType:UITableViewCellAccessoryCheckmark];
        [_toBeDeleted addObject:indexPath];

    }
    else if (c.accessoryType == UITableViewCellAccessoryCheckmark) {
        [c setAccessoryType:UITableViewCellAccessoryNone];
        [_toBeDeleted removeObject:indexPath];

    }
    
    //else do the opposite
    
    /*
    NSString *message = [NSString stringWithFormat:@"You Selected: %@", [tableTitles objectAtIndex:indexPath.row]];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert!" message:message delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
     */
}


#pragma mark - Add and Remove Items



- (IBAction)deleteItem
{

//    NSMutableArray *cellIndicesToBeDeleted = [[NSMutableArray alloc] init];
//    for (int i = 0; i < [_tableView numberOfRowsInSection:0]; i++) {
//        NSIndexPath *p = [NSIndexPath indexPathWithIndex:i];
//        if ([[_tableView cellForRowAtIndexPath:p] accessoryType] ==
//            UITableViewCellAccessoryCheckmark) {
//            [cellIndicesToBeDeleted addObject:p];
//            /*
//             perform deletion on data source
//             object here with i as the index
//             for whatever array-like structure
//             you're using to house the data
//             objects behind your UITableViewCells
//             */
//        }
//    }
    
    
    for (int i = 0; i< [_toBeDeleted count]; i++)
    {
        NSIndexPath *myInt = [_toBeDeleted objectAtIndex:i];
        NSInteger row = myInt.row;
        NSUInteger unsignedInt = (NSUInteger)row;
        [_tableTitles removeObjectAtIndex:unsignedInt];

        
    }
    
    NSLog(@"%@", _toBeDeleted);
    [tableView deleteRowsAtIndexPaths:_toBeDeleted
                     withRowAnimation:UITableViewRowAnimationLeft];
    [_tableView reloadData];

    
    
}




- (void) viewController: (AddEventViewController *) viewController
             didAddTask: (newTask *) task
{
    NSLog(@"%@", task.event);
    if (task.event != nil && task.event != @""){
    [_tableTitles addObject:task.event];
    NSString *concat = [task.taskStartDate stringByAppendingString:@" - "];
    NSString *concat2 = [concat stringByAppendingString:task.taskEndDate];
    [_tableSubTitles addObject:concat2];
    [_tableView reloadData];
    }
    else {
        [_tableView reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];

}







- (void)viewDidUnload {
    [self setNavBar:nil];
    [super viewDidUnload];
}
@end
