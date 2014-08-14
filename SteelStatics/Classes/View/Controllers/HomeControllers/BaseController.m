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




#pragma mark - IB Action
- (IBAction)hmore:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:5];
}
- (IBAction)rectangmore:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:6];
}
- (IBAction)circlemore:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:7];
}
- (IBAction)back:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)back1:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)back2:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:0];
}
- (IBAction)Processhmore:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:8];

}
- (IBAction)Processrectangmore:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:9];
}
- (IBAction)Processcirclemore:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:10];
}

- (IBAction)Processback:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)Processback1:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)Processback2:(id)sender {
    [self transiton];
    [self.tabBarController setSelectedIndex:1];
}
-(void)transiton
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.5];
    [transition setType:@"pageCurl"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
}
@end
