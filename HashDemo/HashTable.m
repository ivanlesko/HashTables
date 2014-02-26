//
//  HashTable.m
//  HashDemo
//
//  Created by Ivan Lesko on 2/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "HashTable.h"

#import "HashBucket.h"

@interface HashTable ()

@end

@implementation HashTable

- (id)init {
    self = [super init];
    if (self) {
        self.tableSize  = 100;
        self.tableArray = [NSMutableArray new];
        
        for (int i = 0; i < self.tableSize; i++) {
            HashBucket *bucket = [HashBucket new];
            [self.tableArray addObject:bucket];
        }
    }
    
    return self;
}

- (void)setObject:(id)obj forKey:(NSString *)key {
    HashBucket *bucket = [HashBucket new];
    NSUInteger index = [self hash:key];
    bucket.obj = obj;
    bucket.key = key;
    
    [self removeObjectForKey:key];
    bucket.next = self.tableArray[index];
    self.tableArray[index] = bucket;
    self.count++;
    
    HashBucket *currentBuck = self.tableArray[index];
    
    if (currentBuck.obj) {
        
    } else {
        
        self.tableArray[index] = bucket;
        self.count++;
    }
}

- (NSUInteger)hash:(NSString *)key {
    
    NSUInteger total = 0;
    
    for (int i = 0; i <= key.length - 1; i++) {
        NSUInteger asc = [key characterAtIndex:i];
        
        total += asc;
    }
    
    NSUInteger index = total % self.tableSize;
    
    return index;
}

- (void)removeObjectForKey:(NSString *)key {
    NSUInteger index = [self hash:key];
    HashBucket *previousBucket = nil;
    HashBucket *bucket = self.tableArray[index];
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]) {
            if (previousBucket == nil) {
                HashBucket *nextBucket = bucket.next;
                self.tableArray[index] = nextBucket;
            } else {
                previousBucket.next = bucket.next;
            }
            
            self.count--;
            return;
        }
        
        previousBucket = bucket;
        bucket = bucket.next;
    }
}

- (id)objectForKey:(NSString *)key {
    NSUInteger index = [self hash:key];
    
    HashBucket *bucket = self.tableArray[index];
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]) {
            return bucket.obj;
        } else bucket = bucket.next;
    }
    
    return nil;
}

@end














