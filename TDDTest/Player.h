//
//  Player.h
//  TDDTest
//
//  Created by Forr on 16/7/6.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

/** 名字 */
@property (nonatomic ,copy) NSString *name;
/** 当前位置 */
@property (nonatomic ,assign) int places;

/** 当前位置对应的问题 */
-(NSString *)currentCategory;
/** 向前走n步 */
-(void)moveForwardSteps:(int)rollingNumber;

/** 金币数目 */
@property (nonatomic ,assign) int sumOfGoldCoins;

/** 赢得一个金币 */
-(void)winAGoldCoin;
/** 是否在禁闭室 */
@property (nonatomic ,assign) BOOL isInPenaltyBox;


/** 离开禁闭室 */
- (void)getOutOfPenaltyBox;
/** 留在禁闭室 */
- (void)stayInPenaltyBox;




@end
