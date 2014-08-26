#import "OrderTableViewController.h"
#import "AppInterface.h"

@implementation OrderTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[self.view subviews] firstObject];
    
//    [GestureHelper addGestureToView: self.view];
}


- (IBAction)pinchAction:(id)sender {
    
    UIPinchGestureRecognizer* recoginizer = (UIPinchGestureRecognizer*)sender;

    if(recoginizer.state == UIGestureRecognizerStateEnded){
        
    }
}


@end