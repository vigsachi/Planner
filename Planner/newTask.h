//
//  newTask.h
//  Planner
//
//  Created by Vig Sachidananda on 9/18/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newTask : NSObject

@property (strong, nonatomic) NSString *event;
@property (strong, nonatomic) NSString *taskStartDate;
@property (strong, nonatomic) NSString *taskEndDate;
@property (strong, nonatomic) NSString *concatDate;

@end
