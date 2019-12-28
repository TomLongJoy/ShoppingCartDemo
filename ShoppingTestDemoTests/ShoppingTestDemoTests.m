//
//  ShoppingTestDemoTests.m
//  ShoppingTestDemoTests
//
//  Created by 赵龙杰 on 2018/1/18.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ShoppingTestDemoTests : XCTestCase

@end

@implementation ShoppingTestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSInteger   a = 5;
    CGFloat   b = 5.1;
    XCTAssertEqual(a, b,"a不等于b");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
       
    }];
}

@end
