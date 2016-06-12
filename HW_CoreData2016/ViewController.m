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
#import "CoreDataWorker.h"

@interface ViewController ()
@property (nonatomic, strong) LimitedArray *arr;
@property CoreDataWorker *worker;

@property NSInteger count;
@property NSInteger currentPage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.worker = [CoreDataWorker new];
    self.arr = [LimitedArray new];
    self.currentPage = 0;
    [self.arr addObjectsFromArray:[self.worker booksArrayUsingQuery:self.currentPage count:40]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.worker.booksCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentPage > indexPath.row / 40) {
        [self.arr removeAllObjects];
        self.currentPage = self.currentPage - 1;
        [self.arr addObjectsFromArray:[self.worker booksArrayUsingQuery:self.currentPage * 40 count:40]];
    }
    if (self.currentPage < indexPath.row / 40) {
        [self.arr removeAllObjects];
        self.currentPage = self.currentPage + 1;
        [self.arr addObjectsFromArray:[self.worker booksArrayUsingQuery:self.currentPage * 40 count:40]];
    }
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [self.arr[indexPath.row % 40] uid], [self.arr[indexPath.row % 40] work]];
    return cell;
}

@end
