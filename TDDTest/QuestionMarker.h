//
//  QuestionMarker.h
//  TDDTest
//
//  Created by Forr on 16/7/6.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionMarker : NSObject

@property (nonatomic , strong) NSMutableArray<NSString *> *popQuestions;

@property (nonatomic , strong) NSMutableArray<NSString *> *scienceQuestions;

@property (nonatomic , strong) NSMutableArray<NSString *> *sportsQuestions;

@property (nonatomic , strong) NSMutableArray<NSString *> *rockQuestions;


@end
