#import "BaseController.h"
#import "AppInterface.h"
@interface BaseController ()


@end

@implementation BaseController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden: NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [SSViewHelper translateViewsFramesRecursive: self.view];
}


@end
