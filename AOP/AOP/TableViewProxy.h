//
//  TableViewProxy.h
//  AOP
//
//  Created by cjfire on 16/9/26.
//  Copyright © 2016年 cjfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewProxy : NSProxy

- (instancetype)initWithTarget:(UITableView*)target;

@end
