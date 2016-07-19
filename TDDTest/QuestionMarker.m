//
//  QuestionMarker.m
//  TDDTest
//
//  Created by Forr on 16/7/6.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import "QuestionMarker.h"
#define kMAX_NUMBER_OF_QUESTIONS  50

@implementation QuestionMarker

- (instancetype)init
{
    if (self = [super init]) {
        for (int i = 0; i < kMAX_NUMBER_OF_QUESTIONS; i++) {
            [self.popQuestions addObject:[NSString stringWithFormat:@"Pop Question %d", i]];
            [self.scienceQuestions addObject:[NSString stringWithFormat:@"Science Question %d", i]];
            [self.sportsQuestions addObject:[NSString stringWithFormat:@"Sports Question %d", i]];
            [self.rockQuestions addObject:[NSString stringWithFormat:@"Rock Question %d", i]];
        }
    }
    return self;
}

- (NSMutableArray *)popQuestions
{
    if (_popQuestions == nil) {
        _popQuestions = [NSMutableArray array];
    }
    return _popQuestions;
}

- (NSMutableArray *)scienceQuestions
{
    if (_scienceQuestions == nil) {
        _scienceQuestions = [NSMutableArray array];
    }
    return _scienceQuestions;
}

- (NSMutableArray *)sportsQuestions
{
    if (_sportsQuestions == nil) {
        _sportsQuestions = [NSMutableArray array];
    }
    return _sportsQuestions;
}

- (NSMutableArray *)rockQuestions
{
    if (_rockQuestions == nil) {
        _rockQuestions = [NSMutableArray array];
    }
    return _rockQuestions;
}




@end
