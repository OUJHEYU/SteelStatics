
#import "AngleSteelController.h"

@interface AngleSteelController ()

@end

@implementation AngleSteelController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"角鋼"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
