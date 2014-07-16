#import "SteelGirderController.h"

@interface SteelGirderController ()

@end

@implementation SteelGirderController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"鋼樑"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
