//
//  HotelWorldClockSystem.m
//  TDDTest
//
//  Created by Forr on 16/7/5.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import "HotelWorldClockSystem.h"

@implementation HotelWorldClockSystem

- (NSMutableArray *)locationClockArray
{
    if (_locationClockArray == nil) {
        _locationClockArray = [NSMutableArray array];
    }
    return _locationClockArray;
}

@end
