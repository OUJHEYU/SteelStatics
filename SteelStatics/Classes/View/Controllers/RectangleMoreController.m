#import "AppInterface.h"
#import "RectangleMoreController.h"

@interface RectangleMoreController ()

@end

@implementation RectangleMoreController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)back:(id)sender {
    [self.tabBarController setSelectedIndex:1];
}

@end
