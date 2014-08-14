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
    
    
    [SSViewHelper iterateTextFieldRecursively: self.view handler:^(UITextField *view) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField* tx = (UITextField*)view;
            tx.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(12)];
            tx.enabled = YES;
        }
        if ([view isKindOfClass:[BaseTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            tx.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(12)];
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
    [GestureHelper addGestureToView: self.view];
    
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
