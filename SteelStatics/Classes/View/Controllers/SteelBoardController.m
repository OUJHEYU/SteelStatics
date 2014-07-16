
#import "SteelBoardController.h"

@interface SteelBoardController ()

@end

@implementation SteelBoardController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"鋼板"];
}

- (IBAction)Hide {
    [self.view endEditing:YES];
}
@end
