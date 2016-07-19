#import "LCRGame.h"
#import "QuestionMarker.h"
#import "Player.h"


#define kNUMBER_OF_GOLD_COINS_TO_WIN_AND_GMAE_OVER 6
@implementation LCRGame{
    NSMutableArray<Player *> * players;
    
    QuestionMarker *questionMarker;

    int currentPlayer;
    
    Player *player;
}

- (id)init
{
    self = [super init];
    if (self) {
        players = [NSMutableArray new];
        
        questionMarker = [QuestionMarker new];
        
        currentPlayer = 0;
    }
    return self;
}

-(void)addPlayerNamed:(NSString *)aPlayerName
{
    Player *aPlayer = [Player new];
    aPlayer.name = aPlayerName;
    aPlayer.places = 0;
    aPlayer.sumOfGoldCoins = 0;
    aPlayer.isInPenaltyBox = NO;
    [players addObject:aPlayer];
    
    NSLog(@"%@ was added", aPlayerName);
    NSLog(@"They are player number %li", [players count]);
}

-(void)roll:(int)rollingNumber
{
    player = players[currentPlayer];
    NSLog(@"%@ is the current player",player.name);
    NSLog(@"They have rolled a %d", rollingNumber);
    //非留在禁闭室的选手
    if (player.isInPenaltyBox == NO) {
        [self currentPlayerMovesToNewPlaceAndAnswersAQuestion:rollingNumber];
        return;
    }
    
    //留在禁闭室的选手
    //奇数，能从惩罚盒子里出来
    BOOL isRollingNumberOdd = (rollingNumber % 2 != 0)?YES:NO;
    if (isRollingNumberOdd)
    {
        [player getOutOfPenaltyBox];
        
        NSLog(@"%@ is getting out of the pentaly box", player.name);
        [self currentPlayerMovesToNewPlaceAndAnswersAQuestion:rollingNumber];
        return;
    }
    //偶数，不能从禁闭室里出来
    NSLog(@"%@ is not getting out of the penalty box", player.name);
    [player stayInPenaltyBox];
}

- (void)currentPlayerMovesToNewPlaceAndAnswersAQuestion:(int)rollingNumber
{
    [player moveForwardSteps:rollingNumber];
    
    NSLog(@"%@'s new location is %d",player.name, player.places);
    NSLog(@"The category is %@", [player currentCategory]);
    
    [self askQuestion];
}

-(void)askQuestion
{
    if ([[player currentCategory] isEqualToString:@"Pop"]){
        NSLog(@"%@",[questionMarker.popQuestions objectAtIndex:0]);
        [questionMarker.popQuestions removeObjectAtIndex:0];
    }
    if ([[player currentCategory] isEqualToString:@"Science"]){
        NSLog(@"%@",[questionMarker.scienceQuestions objectAtIndex:0]);
        [questionMarker.scienceQuestions removeObjectAtIndex:0];
    }
    if ([[player currentCategory] isEqualToString:@"Sports"]){
        NSLog(@"%@",[questionMarker.sportsQuestions objectAtIndex:0]);
        [questionMarker.sportsQuestions removeObjectAtIndex:0];
    }
    if ([[player currentCategory] isEqualToString:@"Rock"]){
        NSLog(@"%@",[questionMarker.rockQuestions objectAtIndex:0]);
        [questionMarker.rockQuestions removeObjectAtIndex:0];
    }
}	
	


-(BOOL)wasCorrectlyAnswered
{
    if (player.isInPenaltyBox)
    {
        //在惩罚盒子中的选手答对问题
        [self nextPlayer];
        BOOL isGmaeStillInProgress = YES;
        return isGmaeStillInProgress;
    }

    //不在惩罚盒子中的选手答对问题
    return [self currentPlayerGetsAGoldCoinAndSelectNextPalyer];
}

- (BOOL)currentPlayerGetsAGoldCoinAndSelectNextPalyer
{
    BOOL isGmaeStillInProgress = YES;
    NSLog(@"Answer was corrent!!!!");
    [player winAGoldCoin];
    NSLog(@"%@ now has %d Gold Coins.",
          player.name, player.sumOfGoldCoins);
    
    isGmaeStillInProgress = [self isGameStillInProgress];
    [self nextPlayer];
    return isGmaeStillInProgress;
}

- (void)nextPlayer
{
    currentPlayer++;
    if(currentPlayer == [players count]) currentPlayer = 0;
}

-(BOOL)wrongAnswer
{
    NSLog(@"Question was incorrectly answered");
    NSLog(@"%@ was sent to the penalty box",player.name);
    player.isInPenaltyBox = YES;
    
    [self nextPlayer];
    BOOL isGmaeStillInProgress = YES;
    return isGmaeStillInProgress;
}

-(BOOL)isGameStillInProgress
{
    return !(player.sumOfGoldCoins == kNUMBER_OF_GOLD_COINS_TO_WIN_AND_GMAE_OVER);
}

@end

