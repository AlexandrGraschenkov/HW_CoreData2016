//
//  CoreDataWorker.h
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataWorker : NSObject

- (NSArray *)booksArrayUsingQuery:(NSInteger)shift count:(NSInteger)count;

@end
