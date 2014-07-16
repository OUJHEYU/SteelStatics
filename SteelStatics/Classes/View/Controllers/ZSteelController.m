
#import "ZSteelController.h"

@interface ZSteelController ()

@end

@implementation ZSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Z型鋼"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}

@end
