//
//  SunModel4Mantel.h
//  iOS-Benchmark
//
//  Created by 孙博弘 on 2017/3/19.
//  Copyright © 2017年 孙博弘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SunVideoCatdDataSource.h"
#import <Mantle/Mantle.h>

@interface SunModel4Mantel : MTLModel<SunVideoCatdDataSource,MTLJSONSerializing>

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *description;

@end
