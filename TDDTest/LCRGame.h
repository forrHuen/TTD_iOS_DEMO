#import <Foundation/Foundation.h>

@interface LCRGame : NSObject
-(void)addPlayerNamed:(NSString *)aPlayerName;
-(void)roll:(int)rollingNumber;
-(BOOL)wasCorrectlyAnswered;
-(BOOL)wrongAnswer;


@end
