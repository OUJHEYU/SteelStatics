#import "CircleController.h"
#import "AppInterface.h"
@interface CircleController ()

@end

@implementation CircleController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)top {
    self.topcilick.hidden = YES;
    self.downcilck.hidden = NO;
    self.image1.hidden = NO;
    self.image2.hidden = NO;
    self.image3.hidden = YES;
}
- (IBAction)down {
    self.topcilick.hidden = NO;
    self.downcilck.hidden = YES;
    self.image1.hidden = YES;
    self.image2.hidden = YES;
    self.image3.hidden = NO;
}
- (IBAction)back:(id)sender {
    [self.tabBarController setSelectedIndex:1];
}

@end
