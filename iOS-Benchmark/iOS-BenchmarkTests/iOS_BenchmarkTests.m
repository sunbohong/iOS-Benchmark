//
//  iOS_BenchmarkTests.m
//  iOS-BenchmarkTests
//
//  Created by 孙博弘 on 2017/3/19.
//  Copyright © 2017年 孙博弘. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SunModel4YY.h"
#import "SunModel4KVC.h"
#import "SunModel4Mantel.h"

#import <YYModel/YYModel.h>
#import <Mantle/MTLModel.h>

@interface iOS_BenchmarkTests : XCTestCase

@end

@implementation iOS_BenchmarkTests {
    NSDictionary *_dic;
}

- (void)setUp {
    [super setUp];
    _dic = @{
             @"name":@"酷酷的哀殿",
             @"title":@"title",
             @"description":@"description"
             };
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testYYModel {
    SunModel4YY *model = [SunModel4YY yy_modelWithDictionary:_dic];

    XCTAssert([@"酷酷的哀殿" isEqual: model.name]);
    XCTAssert([@"title" isEqual: model.title]);
    XCTAssert([@"description" isEqual: model.description]);
}

- (void)testYYModel4JSON {
    SunModel4YY *model = [SunModel4YY yy_modelWithDictionary:_dic];

    NSDictionary *JSONDictionary = [model yy_modelToJSONObject];
    XCTAssert([JSONDictionary isEqual: _dic]);
}

- (void)testKVCMentalModel {
    SunModel4KVC *model = [SunModel4KVC new];
    [model setValuesForKeysWithDictionary:_dic];

    XCTAssert([@"酷酷的哀殿" isEqual: model.name]);
    XCTAssert([@"title" isEqual: model.title]);
    XCTAssert([@"description" isEqual: model.description]);
}

-(void)testRuntime4JSON {
    SunModel4KVC *model = [SunModel4KVC new];
    [model setValuesForKeysWithDictionary:_dic];

    NSDictionary *JSONDictionary = [model toDictionary];
    XCTAssert([JSONDictionary isEqual: _dic]);
}

- (void)testMentalModel {
    NSError *error;
    SunModel4Mantel *model = [[SunModel4Mantel alloc]initWithDictionary:_dic error:&error];
    XCTAssertNil(error);
    XCTAssert([@"酷酷的哀殿" isEqual: model.name]);
    XCTAssert([@"title" isEqual: model.title]);
    XCTAssert([@"description" isEqual: model.description]);
}

- (void)testMentalModel4JSON {
    NSError *error;
    SunModel4Mantel *model = [[SunModel4Mantel alloc]initWithDictionary:_dic error:&error];

    NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:model error:&error];
    XCTAssertNil(error);
    XCTAssert([_dic isEqualToDictionary:JSONDictionary]);
}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
