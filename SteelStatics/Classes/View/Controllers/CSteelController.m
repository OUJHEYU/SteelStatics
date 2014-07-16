
#import "CSteelController.h"

@interface CSteelController ()

@end

@implementation CSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"C型鋼"];
}


- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
