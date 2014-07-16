#import "BaseController.h"
#import "AppInterface.h"

@interface BaseController ()

@end

@implementation BaseController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden: NO animated:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    
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
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"Format Error"
                                                        message: @"Please input the numeric value"
                                                       delegate: nil
                                              cancelButtonTitle: @"OK"
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

- (IBAction)refresh:(id)sender {
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass: [BaseTextField class]]) {
            BaseTextField* tx = (BaseTextField*)view;
            tx.text = nil;
        }
    }
}



@end
