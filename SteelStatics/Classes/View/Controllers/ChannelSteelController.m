#import "ChannelSteelController.h"

@interface ChannelSteelController ()

@end

@implementation ChannelSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"槽鋼"];    
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
