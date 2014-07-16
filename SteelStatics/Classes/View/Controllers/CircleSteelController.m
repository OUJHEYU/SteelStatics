
#import "CircleSteelController.h"

@interface CircleSteelController ()

@end

@implementation CircleSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"圓鋼"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}

@end
