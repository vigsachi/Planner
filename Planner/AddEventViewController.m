//
//  AddEventViewController.m
//  Planner
//
//  Created by Vig Sachidananda on 9/18/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "AddEventViewController.h"
#import "newTask.h"
#import "PlannerTextField.h"




@interface AddEventViewController ()

@end


@implementation AddEventViewController
{
    UIDatePicker *_startPicker;
    UIDatePicker *_endPicker;
    
}
@synthesize delegate = _delegate;


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    PlannerTextField *resigner = (PlannerTextField *)textField;
    [resigner resignFirstResponder];
    return [resigner.nextField becomeFirstResponder];
    
}

- (void) viewDidLoad

{
    _startPicker = [[UIDatePicker alloc] init];
    _startPicker.datePickerMode = UIDatePickerModeTime;
    self.startDate.inputView = _startPicker;
    _endPicker = [[UIDatePicker alloc] init];
    _endPicker.datePickerMode = UIDatePickerModeTime;
    self.endDate.inputView = _endPicker;
    [super viewDidLoad];
}




- (IBAction)doneAdding:(id)sender {
    newTask *_newTask = [[newTask alloc]init];
    _newTask.event = _eventName.text;
    _newTask.taskStartDate = self.startDate.text;
    NSLog(@"%@", _newTask.event);
    _newTask.taskEndDate = self.endDate.text;
    if (_newTask.event != nil && _newTask.event != @""){
    [_delegate viewController:self didAddTask:_newTask];
    }
}


@end
