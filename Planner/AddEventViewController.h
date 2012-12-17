//
//  AddEventViewController.h
//  Planner
//
//  Created by Vig Sachidananda on 9/18/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newTask.h"
#import "PlannerTextField.h"

@protocol AddEventViewControllerDelegate;

@interface AddEventViewController : UIViewController<UITextFieldDelegate> 


@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextField *startDate;
@property (weak, nonatomic) IBOutlet UITextField *endDate;
@property (weak, nonatomic) id <AddEventViewControllerDelegate> delegate;

- (IBAction)doneAdding : (id) sender;

@end



@protocol AddEventViewControllerDelegate <NSObject>

- (void) viewController: (AddEventViewController *) viewController
             didAddTask: (newTask *) task;


@end