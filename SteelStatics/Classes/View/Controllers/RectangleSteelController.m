
#import "RectangleSteelController.h"

@interface RectangleSteelController ()

@end

@implementation RectangleSteelController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"矩形管"];
}


- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
