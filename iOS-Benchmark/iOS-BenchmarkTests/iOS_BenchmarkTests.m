//
//  iOS_BenchmarkTests.m
//  iOS-BenchmarkTests
//
//  Created by 孙博弘 on 2017/3/19.
//  Copyright © 2017年 孙博弘. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SunModel.h"

#import <YYModel/YYModel.h>

@interface iOS_BenchmarkTests : XCTestCase

@end

@implementation iOS_BenchmarkTests {
    NSDictionary *_dic;
}

- (void)setUp {
    [super setUp];
    _dic = @{@"name":@"酷酷的哀殿"};
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testYYModel {
    SunModel *model = [SunModel yy_modelWithDictionary:_dic];

    XCTAssertEqual(@"酷酷的哀殿", model.name);

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testKVC {
    SunModel *model = [SunModel new];
    [model setValuesForKeysWithDictionary:_dic];

    XCTAssertEqual(@"酷酷的哀殿", model.name);

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
