//
//  SunModel4Mantel.m
//  iOS-Benchmark
//
//  Created by 孙博弘 on 2017/3/19.
//  Copyright © 2017年 孙博弘. All rights reserved.
//

#import "SunModel4Mantel.h"

@implementation SunModel4Mantel {
    NSString *_description;
}

- (NSString *)description{
    return _description;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"name":@"name",
             @"title":@"title",
             @"description":@"_description",
             @"_description":@"_description"
             };
}

@end
