#import "AppInterface.h"
#import "ToolsController.h"

@interface ToolsController ()

@end

@implementation ToolsController
// caculate field
@synthesize h1;
@synthesize h2;
@synthesize b;
@synthesize water;
@synthesize dropping;
@synthesize wind;
@synthesize side1;
@synthesize side2;
@synthesize addthick;
@synthesize addpcs;
@synthesize addear;
@synthesize addsetwight;
@synthesize addsetpcs;
@synthesize addsuppcs;
@synthesize calwater;
@synthesize total;
// result field
@synthesize waterper;
@synthesize high;
@synthesize slant;
@synthesize percentage;
#pragma mark - Override Methods
-(void) autoUpdateResuls
{
    waterper.value = sqrtf(100 * 100 + water.value * water.value) / 100;
    high.value = dropping.value + (wind.value / 100) * calwater.value ;
    slant.value = sqrtf(side1.value * side1.value + side2.value * side2.value);
    percentage.value = ((((h1.value + h2.value) / 2 * b.value * addthick.value * 0.00000785 * addpcs.value)+(addsetwight.value * addsetpcs.value) + (addsuppcs.value * 0.5) + addear.value) / total.value) * 100;
    
    if ([water.text  isEqualToString: @""]) {
        waterper.text = @"0";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)waterclear {
    water.text = nil;
    waterper.text = nil;
    
    [water becomeFirstResponder];
    [water resignFirstResponder];
}
- (IBAction)highclear {
    high.text = nil;
    dropping.text = nil;
    wind.text = nil;
    calwater.text = nil;
    
    [water becomeFirstResponder];
    [water resignFirstResponder];
}
- (IBAction)slantclear {
    slant.text = nil;
    side1.text = nil;
    side2.text = nil;
    
    
    [water becomeFirstResponder];
    [water resignFirstResponder];
}
- (IBAction)percentageclear {
    addthick.text = nil;
    addpcs.text = nil;
    addear.text = nil;
    addsetwight.text = nil;
    addsetpcs.text = nil;
    addsuppcs.text = nil;
    total.text = nil;
    percentage.text = nil;
    h1.text = nil;
    h2.text = nil;
    b.text = nil;

    [water becomeFirstResponder];
    [water resignFirstResponder];
}

@end
