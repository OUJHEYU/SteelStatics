#import "OrderTableViewController.h"
#import "AppInterface.h"

@implementation OrderTableViewController
{
    int count;
    UIView* viewww;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[self.view subviews] firstObject];
    
//    [GestureHelper addGestureToView: self.view];
}

- (IBAction)pinchAction:(id)sender {
    
    UIPinchGestureRecognizer* recoginizer = (UIPinchGestureRecognizer*)sender;

    if(recoginizer.state == UIGestureRecognizerStateEnded){
       
        if (count == 0) {
            count ++;
    

        }else if (count == 1){
            count --;

        }
        
        
        NSLog(@"- - - do the scale job - - -");
    }
}

@end
