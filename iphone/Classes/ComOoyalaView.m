#import "ComOoyalaView.h"
#import "TiUtils.h"
#import "OOOoyalaError.h"
#import "OOOoyalaPlayer.h"
#import "OOOoyalaPlayerViewController.h"
#import "OOPlayerDomain.h"

@implementation ComOoyalaView

NSString * const EMBED_CODE = @"RhdTQ5czo4prj0Fje_pmNf2-UWK9QGbj";
NSString * const PCODE = @"kwcGEyOheRtMQWquoNZE8oDyGUM7";
NSString * const PLAYERDOMAIN = @"http://www.ooyala.com";

- (void)initializeState
{
    [super initializeState];
    
    NSLog(@"[INFO] Player view is initializing");
    
    if(self)
    {
        ooyalaPlayerViewController = [[OOOoyalaPlayerViewController alloc] initWithPcode:PCODE domain:[[OOPlayerDomain alloc] initWithString:PLAYERDOMAIN]];
        
        [ooyalaPlayerViewController.view setFrame:[self frame]];
        
        player = ooyalaPlayerViewController.view;
        
        [self addSubview:player];
    }
}
/*
-(UIView*)player
{
    NSLog(@"[INFO] Creating player view");
    
    if(player == nil) {
        player = [[UIView alloc] initWithFrame:[self frame]];
        
        ooyalaPlayerViewController = [[OOOoyalaPlayerViewController alloc] initWithPcode:PCODE domain:[[OOPlayerDomain alloc] initWithString:PLAYERDOMAIN]];
        
        //player = ooyalaPlayerViewController.view;
        
        [ooyalaPlayerViewController.view setFrame:[self frame]];
        
        [player addSubview:ooyalaPlayerViewController.view];
        
        [self addSubview:player];
        
        //[ooyalaPlayerViewController.player setEmbedCode:EMBED_CODE];
    }
    
    return player;
}
*/
-(void)dealloc
{
    NSLog(@"[INFO] Dellocating player");
    
    // Deallocates the view
    RELEASE_TO_NIL(ooyalaPlayerViewController);
    RELEASE_TO_NIL(player);
    
    [super dealloc];
}
-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    // Sets the size and position of the view
    if(player != nil) {
        //[TiUtils setView:ooyalaPlayerViewController.view positionRect:bounds];
        [TiUtils setView:player positionRect:bounds];
    }
}
-(void)setEmbedCode_:(id)embedCode
{
    ENSURE_UI_THREAD_1_ARG(embedCode);
    ENSURE_SINGLE_ARG(embedCode, NSString);
    
    [ooyalaPlayerViewController.player setEmbedCode:EMBED_CODE];
}
@end