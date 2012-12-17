//
//  PlannerViewController.h
//  Planner
//
//  Created by Vig Sachidananda on 9/12/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "newTask.h"
#import "PlannerTextField.h"
#import "AddEventViewController.h"

@interface PlannerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, AddEventViewControllerDelegate>

{
    NSMutableArray *tableTitles;
    NSMutableArray *tableSubTitles;
    IBOutlet UITableView *tableView;

}

@property (weak, nonatomic) IBOutlet UINavigationItem *NavBarTitle;
@property (nonatomic, retain) NSMutableArray *toBeDeleted;
@property (weak, nonatomic) IBOutlet UINavigationBar *NavBar;
@property (nonatomic, retain) NSMutableArray *tableTitles;
@property (nonatomic, retain) NSMutableArray *tableSubTitles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;



- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

- (IBAction)deleteItem;

- (void)applicationWillTerminate:(NSNotification *)notification;
- (void)SavingStatus;




@end
