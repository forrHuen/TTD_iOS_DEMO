//
//  TDDLoginTests.m
//  TDDTest
//
//  Created by Forr on 16/7/7.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TDDLoginTests : XCTestCase

@end

@implementation TDDLoginTests

/** testXXX方法执行前调用 */
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"haha1");
}

/** testXXX方法执行后调用 */
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"haha3");
}

#pragma mark -testXXXXXXX条测试用例-


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"haha2");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testLogin
{
    NSLog(@"登录成功");
}

@end
