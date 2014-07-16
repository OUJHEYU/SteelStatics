
#import "GirderSteelController.h"

@interface GirderSteelController ()

@end

@implementation GirderSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"工字鋼"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
