//
//  Player.m
//  TDDTest
//
//  Created by Forr on 16/7/6.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import "Player.h"

#define kMAX_NUMBER_OF_PLACE       12
#define kGATEGORY_POP_1      0
#define kGATEGORY_POP_2      4
#define kGATEGORY_POP_3      8
#define kGATEGORY_SCIENCE_1      1
#define kGATEGORY_SCIENCE_2      5
#define kGATEGORY_SCIENCE_3      9
#define kGATEGORY_SPORTS_1      2
#define kGATEGORY_SPORTS_2      6
#define kGATEGORY_SPORTS_3      10
#define kPop            @"Pop"
#define kScience        @"Science"
#define kSports         @"Sports"
#define kRock           @"Rock"
@implementation Player

-(NSString *)currentCategory
{ 
    if (self.places == kGATEGORY_POP_1) return kPop;
    if (self.places == kGATEGORY_POP_2) return kPop;
    if (self.places == kGATEGORY_POP_3) return kPop;
    if (self.places == kGATEGORY_SCIENCE_1) return kScience;
    if (self.places == kGATEGORY_SCIENCE_2) return kScience;
    if (self.places == kGATEGORY_SCIENCE_3) return kScience;
    if (self.places == kGATEGORY_SPORTS_1) return kSports;
    if (self.places == kGATEGORY_SPORTS_2) return kSports;
    if (self.places == kGATEGORY_SPORTS_3) return kSports;
    return kRock;
}

-(void)moveForwardSteps:(int)rollingNumber {
    self.places = self.places + rollingNumber;
    if (self.places > kMAX_NUMBER_OF_PLACE-1) self.places = self.places - kMAX_NUMBER_OF_PLACE;
}

-(void)winAGoldCoin {
    self.sumOfGoldCoins++;
}

- (void)getOutOfPenaltyBox {
    self.isInPenaltyBox = NO;
}

- (void)stayInPenaltyBox {
    self.isInPenaltyBox = YES;
}




@end
