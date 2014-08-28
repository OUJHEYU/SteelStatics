#import "OrderTableViewController.h"
#import "AppInterface.h"

@implementation OrderTableViewController
{
    int count;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[self.view subviews] firstObject];
    
//  [GestureHelper addGestureToView: self.view];
}

- (IBAction)pinchAction:(id)sender {

    UIPinchGestureRecognizer* recoginizer = (UIPinchGestureRecognizer*)sender;
    FormulaView* formilaview = [[FormulaView alloc]init];

    if(recoginizer.state == UIGestureRecognizerStateEnded){

        if (count == 0){
            count++;
            //ShowFormulaView
            [formilaview show];

        }else if (count == 1){
            count --;
            //HideFormulaView
            [formilaview hide];

            }
    }
}

@end
