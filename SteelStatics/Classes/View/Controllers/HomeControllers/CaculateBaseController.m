#import "CaculateBaseController.h"
#import "AppInterface.h"


@implementation CaculateBaseController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden: YES animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // textfield
    [SSViewHelper iterateTextFieldRecursively: self.view handler:^(UITextField *view) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField* tx = (UITextField*)view;
            tx.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(12)];
            tx.enabled = YES;
        }
        
        if ([view isKindOfClass:[ValueTextField class]] && ![view isKindOfClass:[CaculateTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            tx.enabled = NO;
        }
        
        // set delegate
        if ([view isKindOfClass:[CaculateTextField class]]) {
            CaculateTextField* tx = (CaculateTextField*)view;
            tx.keyboardType = UIKeyboardTypeDecimalPad;
            tx.delegate = self;
        }
        
    }];
    
    
    // swip
    [GestureHelper addGestureToView: self.view];
    
    
    // add order button
    AppScrollView* scrollView = (AppScrollView*)self.view;
    UIView* contentView = [scrollView.subviews firstObject];
    [SSViewHelper iterateAddOrderButtonRecursively: contentView handler:^BOOL(AddOrderButton *button) {
        button.didClickButtonAction = ^void(BaseButton* button) {
            
            ValueView* superView = (ValueView*)button.superview;
            NSString* projectName = [superView projectName];
            NSString* projectModelName = [superView projectModelName];
            
            AppTabBarController* tabController = (AppTabBarController*)((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController;
            OrderTableViewController* tableViewController = (OrderTableViewController*)[tabController.viewControllers objectAtIndex: 3];
            [tableViewController.tableView.dataContents addObject:@[projectName, projectModelName, @"套", @"22679", @"1", @"2258"]];
            [tableViewController.tableView reloadData];
        };
        return NO;
    }];
    
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




@end
