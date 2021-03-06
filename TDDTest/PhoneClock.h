//
//  PhoneClock.h
//  TDDTest
//
//  Created by Forr on 16/7/4.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityClock.h"

#import "HotelWorldClockSystem.h"

@interface PhoneClock : NSObject

@property (nonatomic ,assign) NSInteger utcOffset;

@property (nonatomic ,assign) NSInteger time;

@property (nonatomic ,assign) NSInteger utcZeroTime;

@property (nonatomic , strong) CityClock *cityClock;

@property (nonatomic , strong) HotelWorldClockSystem *worldClockSystem;


@end
