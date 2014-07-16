#import "SteelSkyController.h"

@interface SteelSkyController ()

@end

@implementation SteelSkyController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"天車樑"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}

@end
