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
    

    [SSViewHelper iterateTextFieldRecursively: self.view handler:^(UITextField *view) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField* tx = (UITextField*)view;
            tx.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(12)];
            tx.enabled = YES;
        }
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            tx.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(12)];
            tx.keyboardType = UIKeyboardTypeDecimalPad;
            tx.enabled = NO;
        }
        // set delegate
        if ([view isKindOfClass:[CaculateTextField class]]) {
            CaculateTextField* tx = (CaculateTextField*)view;
            tx.enabled = YES;
            tx.keyboardType = UIKeyboardTypeDecimalPad;
            tx.delegate = self;
        }
    
    }];
    
    
    // swip
    
    UISwipeGestureRecognizer* swipe;
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [swipe setDirection: (UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:swipe];
    
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [swipe setDirection: (UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipe];

    [SSViewHelper translateViewsFramesRecursive: self.view];
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
        int selectIndex = (int)tabController.selectedIndex;
        int previousIndex = selectIndex - 1;
        if (selectIndex == 5) {
            previousIndex = 0;
        }else if (selectIndex == 6) {
            previousIndex = 0;
        }else if (selectIndex == 7) {
            previousIndex = 0;
        }else if (selectIndex == 8) {
            previousIndex = 1;
        }else if (selectIndex == 9) {
            previousIndex = 1;
        }else if (selectIndex == 10) {
            previousIndex = 1;
        }else if (previousIndex < 0) {
            previousIndex = 4;
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
        int selectIndex = (int)tabController.selectedIndex;
        int nextIndex = selectIndex + 1;
        if (selectIndex == 5) {
            nextIndex = 0;
        }else if (selectIndex == 6) {
            nextIndex = 0;
        }else if (selectIndex == 7) {
            nextIndex = 0;
        }else if (selectIndex == 8) {
            nextIndex = 1;
        }else if (selectIndex == 9) {
            nextIndex = 1;
        }else if (selectIndex == 10) {
            nextIndex = 1;
        }else if (nextIndex > 4) {
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
    
    BOOL isNumeric = [SSNumberHelper isNumericValue: text];
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
- (IBAction)hmore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:5];
}
- (IBAction)rectangmore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:6];
}
- (IBAction)circlemore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:7];
}
- (IBAction)back:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)back1:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)back2:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:0];
}


- (IBAction)Processhmore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:8];
}
- (IBAction)Processrectangmore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:9];
}
- (IBAction)Processcirclemore:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:10];
}

- (IBAction)Processback:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)Processback1:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)Processback2:(id)sender {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageUnCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}



@end
