
#import "SmallSteelController.h"

@interface SmallSteelController ()

@end

@implementation SmallSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"扁鋼"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}

@end
