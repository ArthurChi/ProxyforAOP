//
//  TableViewProxy.m
//  AOP
//
//  Created by cjfire on 16/9/26.
//  Copyright © 2016年 cjfire. All rights reserved.
//

#import "TableViewProxy.h"

@interface TableViewProxy()

@property(nonatomic, strong) UITableView* target;

@end

@implementation TableViewProxy

- (instancetype)initWithTarget:(UITableView*)target {
    _target = target;
    return self;
}

- (NSMethodSignature*) methodSignatureForSelector:(SEL)sel {
    return [NSObject instanceMethodSignatureForSelector:sel];
}

- (void)reloadData {
    [_target performSelector:@selector(reloadData)];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"Proxy调用完毕");
    });
}

@end
