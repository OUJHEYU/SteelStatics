#import "SteelPillarController.h"

@interface SteelPillarController ()

@end

@implementation SteelPillarController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"鋼柱"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}

@end
