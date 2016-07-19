//
//  PhoneClock.m
//  TDDTest
//
//  Created by Forr on 16/7/4.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import "PhoneClock.h"

@implementation PhoneClock

- (void)setTime:(NSInteger)time
{
    _time = time;
    NSInteger utcZeroTime = time - self.utcOffset;
//    [self.cityClock setUtcZeroTime:utcZeroTime];
    for (CityClock *cityClock in self.worldClockSystem.locationClockArray) {
        [cityClock setUtcZeroTime:utcZeroTime];
    }
}

@end
