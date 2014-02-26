//
//  MutableHashTable.m
//  HashDemo
//
//  Created by Ivan Lesko on 2/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "MutableHashTable.h"
#import "HashBucket.h"

@implementation MutableHashTable

- (id)init {
    return self;
}

- (void)doubleSize {
    
    for (int i = 0; i < self.tableSize; i++) {
        HashBucket *bucket = [HashBucket new];
        [self.tableArray addObject:bucket];
    }
    self.tableSize *= 2;
    
    NSLog(@"mutable hash table: %@", self);

}

- (void)setObject:(id)obj forKey:(NSString *)key {
    [super setObject:obj forKey:key];
    
    if (self.count >= self.tableSize * 0.7) {
        [self doubleSize];
    }
}

@end
