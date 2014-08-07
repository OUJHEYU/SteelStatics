#import "BaseController.h"
#import "AppInterface.h"
@interface BaseController ()

@end

@implementation BaseController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden: YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.hidden = YES;
    
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            tx.enabled = NO;
        }
        // set delegate
        if ([view isKindOfClass:[CaculateTextField class]]) {
            CaculateTextField* tx = (CaculateTextField*)view;
            tx.enabled = YES;
            tx.delegate = self;
        }
    }
    
    // swip
    
    UISwipeGestureRecognizer* swipe;
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [swipe setDirection: (UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:swipe];
    
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [swipe setDirection: (UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipe];
}


#pragma mark - Swipe Action
-(void) swipeRight: (UISwipeGestureRecognizer*)swipe
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    
    UIViewController* viewController = ((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController;
     [self.view endEditing:YES];
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = (UINavigationController*)viewController;
        [nav popViewControllerAnimated: YES];
    }
    else if ([viewController isKindOfClass: [UITabBarController class]]) {
        UITabBarController* tabController = (UITabBarController*)viewController;
//        int maxIndex = tabController.viewControllers.count - 1;
        int selectIndex = tabController.selectedIndex;
        int previousIndex = selectIndex - 1;
        if (selectIndex == 6) {
            previousIndex = 1;
        }else if (selectIndex == 7) {
            previousIndex = 1;
        }else if (selectIndex == 8) {
            previousIndex = 1;
        }else if (previousIndex < 0) {
            previousIndex = 5;
//          previousIndex = maxIndex;
        }
        tabController.selectedIndex = previousIndex;
    }
}

-(void) swipeLeft: (UISwipeGestureRecognizer*)swipe
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    
    
    UIViewController* viewController = ((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController;
     [self.view endEditing:YES];
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = (UINavigationController*)viewController;
        [nav popViewControllerAnimated: YES];
    } else if ([viewController isKindOfClass: [UITabBarController class]]) {
        UITabBarController* tabController = (UITabBarController*)viewController;
//        int maxIndex = tabController.viewControllers.count - 1;
        int selectIndex = tabController.selectedIndex;
        int nextIndex = selectIndex + 1;
        if (selectIndex == 6) {
            nextIndex = 1;
        }else if (selectIndex == 7) {
            nextIndex = 1;
        }else if (selectIndex == 8) {
            nextIndex = 1;
        }else if (nextIndex > 5) {
            nextIndex = 0;
        }
        tabController.selectedIndex = nextIndex;
    }
}

#pragma mark - UITextFieldDelegate Methods
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    NSString* text = textField.text;
    if (! text || [text isEqualToString: @""]) {
        return;
    }
    
    BOOL isNumeric = [NumberHelper isNumericValue: text];
    if (!isNumeric) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"錯誤"
                                                        message: @"請輸入數字"
                                                       delegate: nil
                                              cancelButtonTitle: @"確定"
                                              otherButtonTitles: nil];
        [alert show];
        
        textField.text = nil;
        
        return;
    }
    [self autoUpdateResuls];
}

#pragma mark - Override Methods

-(void) autoUpdateResuls
{
    
}


#pragma mark - IB Action
- (IBAction)view:(id)sender
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"rippleEffect"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:5];
}
- (IBAction)tools:(id)sender
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"rippleEffect"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:4];
}
- (IBAction)paint:(id)sender
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"rippleEffect"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:3];
}
- (IBAction)profile2:(id)sender
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"rippleEffect"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:2];
}
- (IBAction)profile1:(id)sender
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"rippleEffect"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}
- (IBAction)rolled:(id)sender
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"rippleEffect"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:0];
}
- (IBAction)hmore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:6];
}
- (IBAction)rectangmore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:7];
}
- (IBAction)circlemore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:8];
}
- (IBAction)back:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)back1:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)back2:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}
@end
