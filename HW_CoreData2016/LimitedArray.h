//
//  LimitedArray.h
//  HW_CoreData2016
//
//  Created by Alexander on 23.03.16.
//  Copyright © 2016 RoadAR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LimitedArray : NSObject
@property (nonatomic, readonly) NSInteger count;

- (instancetype)initWithArray:(NSArray *)arr;

// Некоторые методы из NSMutableArray
- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)addObjectsFromArray:(NSArray *)otherArray;
- (void)removeAllObjects;
- (void)removeObject:(id)anObject;
- (void)removeObjectsInRange:(NSRange)range;


// Для обращения к элементам через скобки
- (id)objectAtIndexedSubscript:(NSInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSInteger)idx;


@end
