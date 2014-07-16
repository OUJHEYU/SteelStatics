#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden: YES animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}



- (IBAction)exit:(id)sender {
    exit(0);
}


@end
