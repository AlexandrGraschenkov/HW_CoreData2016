//
//  CoreDataWorker.m
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "CoreDataWorker.h"
#import "CDBook.h"
@import CoreData;

@interface CoreDataWorker ()
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readonly) NSManagedObjectModel *managedObjectModel;
@end

@implementation CoreDataWorker
@synthesize managedObjectContext = _managedObjectContext;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;

- (void)fillBooksWithDefaultValues {
//    не забываем вызвать этот метод, если у нас таблица пустая
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"books" ofType:@"txt"];
    NSString *namesFileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *items = [namesFileContent componentsSeparatedByString:@"\n"];
    NSMutableArray *result = [NSMutableArray new];
    for (NSInteger i = 0; i < items.count / 3; i++) {
        [result addObject:[CDBook bookWithID:i + 1 work:items[i * 3] andAuthor:items[i * 3 + 1] inManagedObjectContext:self.managedObjectContext]];
    }
    [self saveContext];
}

- (NSInteger)booksCount {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"CDBook" inManagedObjectContext:self.managedObjectContext]];
    [request setIncludesSubentities:NO];
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:nil];
    return count;
}

- (void)deleteBook:(CDBook *)book {
//    уничтожаем книгу
}

- (NSArray *)booksArrayUsingQuery:(NSInteger)offset count:(NSInteger)count {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"CDBook" inManagedObjectContext:self.managedObjectContext]];
    request.fetchLimit = count;
    request.fetchOffset = offset;
    NSSortDescriptor *idnSort = [NSSortDescriptor sortDescriptorWithKey:@"uid" ascending:YES];
    request.sortDescriptors = @[idnSort];
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:nil];
    return results;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Core Data stack
- (NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        NSURL *storeURL = [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"HW_CoreData2016.sqlite"];
        NSError *error = nil;
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
            dict[NSLocalizedFailureReasonErrorKey] = @"There was an error creating or loading the application's saved data.";
            dict[NSUnderlyingErrorKey] = error;
            error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!_managedObjectModel) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HW_CoreData2016" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSError *error = nil;
    if (self.managedObjectContext.hasChanges && ![self.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
