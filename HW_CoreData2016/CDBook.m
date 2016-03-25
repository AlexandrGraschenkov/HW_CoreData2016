//
//  CDBook.m
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "CDBook.h"

@implementation CDBook

+ (instancetype)bookWithID:(NSInteger)uid work:(NSString *)work andAuthor:(NSString *)author inManagedObjectContext:(NSManagedObjectContext *)context {
    CDBook *book = [NSEntityDescription insertNewObjectForEntityForName:@"CDBook" inManagedObjectContext:context];
    book.uid = @(uid);
    book.work = work;
    book.author = author;
    return book;
}

@end
