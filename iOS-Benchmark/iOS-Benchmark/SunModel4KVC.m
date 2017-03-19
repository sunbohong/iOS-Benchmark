//
//  SunModel4KVC.m
//  iOS-Benchmark
//
//  Created by 孙博弘 on 2017/3/19.
//  Copyright © 2017年 孙博弘. All rights reserved.
//

#import "SunModel4KVC.h"
#import <objc/runtime.h>

@implementation SunModel4KVC {
    NSString *_description;
}

- (NSString *)description{
    return _description;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    Ivar var = class_getInstanceVariable([self class], key.UTF8String);
    if (!var) {
        var = class_getInstanceVariable([self class],[@"_" stringByAppendingString:key].UTF8String);
    }
    object_setIvar(self, var, value);
}

- (NSDictionary *)toDictionary{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    uint count = 0;
    Ivar *varList = class_copyIvarList([self class], &count);
    for (uint i=0; i<count; i++) {
        NSString *name = [NSString stringWithUTF8String:ivar_getName(varList[i])];
        NSString *trimName = [name stringByReplacingOccurrencesOfString:@"_" withString:@"" options:0 range:NSMakeRange(0, 1)];
        [dic setObject:[self valueForKeyPath:trimName] forKey:trimName];
    }
    return dic;
}

@end
