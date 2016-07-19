//
//  CityClock.m
//  TDDTest
//
//  Created by Forr on 16/7/4.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import "CityClock.h"

@implementation CityClock

- (NSInteger)time
{
    NSInteger time = self.utcZeroTime + self.utcOffset;
    return [self makeTime0To23WithTime:time];
}

- (NSInteger)makeTime0To23WithTime:(NSInteger)time
{
    return (time + 24 ) % 24;
}

@end
