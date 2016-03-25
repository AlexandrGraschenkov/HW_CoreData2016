//
//  LimitedArray.m
//  HW_CoreData2016
//
//  Created by Alexander on 23.03.16.
//  Copyright © 2016 RoadAR. All rights reserved.
//

#import "LimitedArray.h"

#define MAX_COUNT 40

@interface LimitedArray ()
@property (nonatomic, strong) NSMutableArray *arr;
@end

@implementation LimitedArray


- (instancetype)initWithArray:(NSArray *)arr {
    self = [super init];
    if (self) {
        self.arr = [[NSMutableArray alloc] initWithArray:arr];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.arr = [NSMutableArray new];
    }
    return self;
}

- (void)logErrorInsertion {
    NSLog(@"В этом массиве может быть только %d элементов", MAX_COUNT);
}

#pragma mark - Методы массива

- (NSInteger)count {
    return self.arr.count;
}

- (id)objectAtIndexedSubscript:(NSInteger)idx {
    return self.arr[idx];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSInteger)idx {
    self.arr[idx] = obj;
    if (self.arr.count > MAX_COUNT) {
        [self logErrorInsertion];
        [self.arr removeObjectAtIndex:idx];
    }
}

- (void)addObject:(id)anObject {
    if (self.arr.count + 1 > MAX_COUNT) {
        [self logErrorInsertion];
    } else {
        [self.arr addObject:anObject];
    }
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (self.arr.count + 1 > MAX_COUNT) {
        [self logErrorInsertion];
    } else {
        [self.arr insertObject:anObject atIndex:index];
    }
}
- (void)removeLastObject {
    [self.arr removeLastObject];
}
- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.arr removeObjectAtIndex:index];
}

- (void)addObjectsFromArray:(NSArray *)otherArray {
    if (self.arr.count + otherArray.count > MAX_COUNT) {
        [self logErrorInsertion];
    } else {
        [self.arr addObjectsFromArray:otherArray];
    }
}

- (void)removeAllObjects {
    [self.arr removeAllObjects];
}

- (void)removeObject:(id)anObject {
    [self.arr removeObject:anObject];
}

- (void)removeObjectsInRange:(NSRange)range {
    [self.arr removeObjectsInRange:range];
}


- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len {
    return [self.arr countByEnumeratingWithState:state objects:buffer count:len];
}
@end

