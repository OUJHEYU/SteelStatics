#import "GestureHelper.h"
#import "AppInterface.h"

@implementation GestureHelper


+(void) addGestureToView: (UIView*)view
{
    UISwipeGestureRecognizer* swipe;
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [swipe setDirection: (UISwipeGestureRecognizerDirectionRight)];
    [view addGestureRecognizer:swipe];
    
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [swipe setDirection: (UISwipeGestureRecognizerDirectionLeft)];
    [view addGestureRecognizer:swipe];
}


#pragma mark - Swipe Action
+(void) swipeRight: (UISwipeGestureRecognizer*)swipe
{
    [self jumpToController: YES];
}

+(void) swipeLeft: (UISwipeGestureRecognizer*)swipe
{
    [self jumpToController: NO];
}


+(void) jumpToController: (BOOL)isRight
{
    AppTabBarController* tabController = (AppTabBarController*)((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController;
    
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [tabController.view.layer addAnimation:transition forKey:nil];
    
    [tabController.view endEditing:YES];
    
    int selectIndex = (int)tabController.selectedIndex;
    int resultIndex = isRight ? selectIndex - 1 : selectIndex + 1;
    
    if (isRight) {
        if (resultIndex < 0) {
            resultIndex = 4;
        }
    } else {
        if (resultIndex > 4) {
            resultIndex = 0;
        }
    }
    
    tabController.selectedIndex = resultIndex;
}

@end
