//
//  SunModel4KVC.h
//  iOS-Benchmark
//
//  Created by 孙博弘 on 2017/3/19.
//  Copyright © 2017年 孙博弘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SunModel4KVC : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *description;

- (NSDictionary *)toDictionary;

@end
