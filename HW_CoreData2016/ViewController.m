//
//  ViewController.m
//  HW_CoreData2016
//
//  Created by Alexander on 23.03.16.
//  Copyright © 2016 RoadAR. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "LimitedArray.h"
#import "CDBook.h"

@interface ViewController ()
@property (nonatomic, strong) LimitedArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = [LimitedArray new];
    self.arr[0] = @10;
    self.arr[1] = @20;
    for (int i = 0; i < 100; i++) {
        [self.arr addObject:@(i)];
    }
    NSLog(@"Count %ld", self.arr.count);
}

пустота и безысходность

@end
