//
//  CoreDataWorker.h
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataWorker : NSObject

- (NSInteger)booksCount;

- (NSArray *)booksArrayUsingQuery:(NSInteger)offset count:(NSInteger)count;

@end
