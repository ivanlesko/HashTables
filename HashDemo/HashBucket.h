//
//  HashBucket.h
//  HashDemo
//
//  Created by Ivan Lesko on 2/26/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashBucket : NSObject

@property (nonatomic) NSString *key;
@property (nonatomic, strong) id obj;
@property (nonatomic, strong) HashBucket *next;

@end
