#import "SteelColumnController.h"
#import "AppInterface.h"

@interface SteelColumnController () 

@end

@implementation SteelColumnController

// caculate field
@synthesize h2TextField;
@synthesize bTextField;
@synthesize t1TextField;
@synthesize t2TextField;
@synthesize lenghtTextField;
@synthesize countTextField;
@synthesize consumedTextField;
@synthesize paintUnitTextField;
@synthesize paintAreaTextField;

// result field
@synthesize unitWightTx;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"鋼柱"];
    
}


#pragma mark - Override Methods
-(void) autoUpdateResuls
{
    unitWightTx.value = h2TextField.value * bTextField.value * t1TextField.value;
}

@end
