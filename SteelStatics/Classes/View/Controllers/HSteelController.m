
#import "HSteelController.h"

@interface HSteelController ()

@end

@implementation HSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"H型鋼"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
