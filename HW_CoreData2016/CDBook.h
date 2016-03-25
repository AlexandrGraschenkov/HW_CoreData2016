//
//  CDBook.h
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDBook : NSManagedObject 

+ (instancetype)bookWithID:(NSInteger)uid work:(NSString *)work andAuthor:(NSString *)author inManagedObjectContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "CDBook+CoreDataProperties.h"
