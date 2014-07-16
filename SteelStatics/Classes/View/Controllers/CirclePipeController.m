
#import "CirclePipeController.h"

@interface CirclePipeController ()

@end

@implementation CirclePipeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"圓管"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
