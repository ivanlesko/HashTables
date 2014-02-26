//
//  HashTable.h
//  HashDemo
//
//  Created by Ivan Lesko on 2/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject

@property (nonatomic, strong) NSMutableArray *tableArray;
@property (nonatomic) NSUInteger tableSize;
@property (nonatomic) NSUInteger count;

- (void)setObject:(id)obj forKey:(NSString *)key;

- (id)objectForKey:(NSString *)key;

@end
