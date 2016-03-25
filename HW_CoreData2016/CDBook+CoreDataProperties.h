//
//  CDBook+CoreDataProperties.h
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDBook.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDBook (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *uid;
@property (nullable, nonatomic, retain) NSString *work;
@property (nullable, nonatomic, retain) NSString *author;

@end

NS_ASSUME_NONNULL_END
