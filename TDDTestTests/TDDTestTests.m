//
//  TDDTestTests.m
//  TDDTestTests
//
//  Created by Forr on 16/7/4.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CityClock.h"
#import "PhoneClock.h"
#import "LCRGame.h"
#import "Player.h"

@interface TDDTestTests : XCTestCase
{
    LCRGame *game;
    Player *player;
    BOOL isGameStillInProgress;
}
@end

@implementation TDDTestTests

- (void)setUp {
    [super setUp];
    //arrange
    game = [LCRGame new];
    
    player = [Player new];
    player.name = @"jobs";
    player.places = 0;
    
    isGameStillInProgress = YES;
}

- (void)tearDown {
    [super tearDown];
    game = nil;
    player = nil;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    [self the_time_of_clock_london_and_newYork_should_be_1_and_20_respectively_after_the_phone_clock_is_set_to_9_beijing_time];
}

#pragma mark -worldClock test-
- (void)the_time_of_clock_london_and_newYork_should_be_1_and_20_respectively_after_the_phone_clock_is_set_to_9_beijing_time
{
    //arrage
    CityClock *londonClock = [CityClock new];
    londonClock.utcOffset = 0;
    CityClock *netYorkClock = [CityClock new];
    netYorkClock.utcOffset = -5;
    
    
    HotelWorldClockSystem *worldClockSystem = [HotelWorldClockSystem new];
    [worldClockSystem.locationClockArray addObject:londonClock];
    [worldClockSystem.locationClockArray addObject:netYorkClock];
       
    
    PhoneClock *phoneClock = [PhoneClock new];
    phoneClock.utcOffset = 8;
    //act
    
    [phoneClock setWorldClockSystem:worldClockSystem];
    [phoneClock setTime:9];

    //assert
    XCTAssertEqual(1, [londonClock time]);
    XCTAssertEqual(20,[netYorkClock time]);
}

- (void)testGame
{
    [game addPlayerNamed:@"Chet"];
    [game addPlayerNamed:@"Pat"];
    [game addPlayerNamed:@"Sue"];
    
    do {
        
        [game roll:(rand() % 5) + 1];//点数为1到6的区间
        
        if ((rand() % 9) == 7) {//1/10机会答错
            isGameStillInProgress = [game wrongAnswer];
        } else {
            isGameStillInProgress = [game wasCorrectlyAnswered];
        }
        
        
    } while (isGameStillInProgress);
}

#pragma mark -game test-
- (void)testUserIntention1
{
    //arrange
    [game addPlayerNamed:@"Chet"];
    
    //act
    for (int i = 0; i < 6; i++) {
        [game roll:1];
        isGameStillInProgress = [game wasCorrectlyAnswered];
    }
    //assert
    XCTAssertEqual(NO, isGameStillInProgress);
}


- (void)testUserIntention2
{
    //arrange
    [game addPlayerNamed:@"Chet"];
    
    //act
    [game roll:1];
    [game wrongAnswer];
    [game roll:1];
    [game wasCorrectlyAnswered];
    for (int i = 0; i < 5; i++) {
        [game roll:1];
        isGameStillInProgress = [game wasCorrectlyAnswered];
    }
    //assert
    XCTAssertEqual(NO, isGameStillInProgress);
}


- (void)testUserIntention3
{
    //arrange
    [game addPlayerNamed:@"Chet"];
    
    //act
    [game roll:1];
    [game wrongAnswer];
    [game roll:2];
    for (int i = 0; i < 6; i++) {
        [game roll:1];
        isGameStillInProgress = [game wasCorrectlyAnswered];
    }
    //assert
    XCTAssertEqual(NO, isGameStillInProgress);
}




#pragma mark -player  test-

- (void)testThePlaceShouldBe1IfThePlayerMovesForward1Step
{
    //act
    [player moveForwardSteps:1];
    //assert
    XCTAssertEqual(1, player.places);
}

- (void)testThePlaceShouldBe0IfThePlayerMovesForward12Step
{
    //act
    [player moveForwardSteps:12];
    //assert
    XCTAssertEqual(0, player.places);
}

- (void)testTheCateGoryShouldBePopIfThePlayerMoves12Or4Or8Step
{
    NSString *category = @"Pop";
    [player moveForwardSteps:12];
    XCTAssertEqualObjects(category, [player currentCategory]);
    [player moveForwardSteps:4];
    XCTAssertEqualObjects(category, [player currentCategory]);
    [player moveForwardSteps:4];
    XCTAssertEqualObjects(category, [player currentCategory]);
}




















@end
