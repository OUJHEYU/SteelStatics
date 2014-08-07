#import "AppInterface.h"
#import "RolledSteelController.h"

@interface RolledSteelController ()

@end

@implementation RolledSteelController
//鋼柱 caculate field
@synthesize pillarh1;
@synthesize pillarh2;
@synthesize pillarb;
@synthesize pillart1;
@synthesize pillart2;
@synthesize pillarm;
@synthesize pillarpcs;
@synthesize pillarloss;
//鋼樑 caculate field
@synthesize bridgeh1;
@synthesize bridgeh2;
@synthesize bridgeb;
@synthesize bridget1;
@synthesize bridget2;
@synthesize bridgewater;
@synthesize bridgem;
@synthesize bridgepcs;
@synthesize bridgeloss;
//天車樑caculate field
@synthesize overheadmidl;
@synthesize overheadw;
@synthesize overheadtopl;
@synthesize overheadtopw;
@synthesize overheadlowerl;
@synthesize overheadlowerw;
@synthesize overheadoxh;
@synthesize overheadm;
@synthesize overheadpcs;
@synthesize overheadloss;
//鋼板caculate field
@synthesize boardl;
@synthesize boardw;
@synthesize boardh;
@synthesize boardpcs;
@synthesize boardloss;
//成型鋼caculate field
@synthesize typeunits;
@synthesize typem;
@synthesize typepcs;
@synthesize typeloss;

//成型鋼 result field
@synthesize type;
@synthesize board;
@synthesize overhead;
@synthesize bridge;
@synthesize pillar;


#pragma mark - Override Methods
-(void) autoUpdateResuls
{
    pillar.value = ((pillarh1.value + pillarh2.value) / 2 * pillart1.value * 0.00785 + pillarb.value * pillart2.value * 2 * 0.00785) * pillarm.value * pillarpcs.value * (pillarloss.value / 100 + 1);
    bridge.value = ((bridgeh1.value + bridgeh2.value) / 2 * bridget1.value * 0.00785 + bridgeb.value * bridget2.value * 2 * 0.00785) * bridgem.value * bridgepcs.value * (sqrtf(100 * 100 + bridgewater.value * bridgewater.value) / 100) * (bridgeloss.value / 100 + 1);
    overhead.value = ((overheadmidl.value * overheadw.value * overheadm.value * 0.00785) + (overheadtopl.value * overheadtopw.value * overheadm.value * 0.00785) + (overheadlowerl.value * overheadlowerw.value * (overheadm.value + ((overheadmidl.value - overheadoxh.value) / 500)) * 0.00785)) * overheadpcs.value * (overheadloss.value / 100 + 1);
    board.value = (boardl.value * boardw.value * boardh.value * 0.00000785) * boardpcs.value * (boardloss.value / 100 + 1);
    type.value = typeunits.value * typem.value * typepcs.value * (typeloss.value / 100 + 1);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)hclear {
    pillar.text = nil;
    pillarh1.text = nil;
    pillarh2.text = nil;
    pillarb.text = nil;
    pillart1.text = nil;
    pillart2.text = nil;
    pillarm.text = nil;
    pillarpcs.text = nil;
    pillarloss.text = nil;
    
    [pillarh1 becomeFirstResponder];
    [pillarh1 resignFirstResponder];
}
- (IBAction)bridgeclear {
    bridge.text = nil;
    bridgeh1.text = nil;
    bridgeh2.text = nil;
    bridgeb.text = nil;
    bridget1.text = nil;
    bridget2.text = nil;
    bridgewater.text = nil;
    bridgem.text = nil;
    bridgepcs.text = nil;
    bridgeloss.text = nil;
    
    [pillarh1 becomeFirstResponder];
    [pillarh1 resignFirstResponder];
}
- (IBAction)overheadclear {
    overhead.text = nil;
    overheadmidl.text = nil;
    overheadw.text = nil;
    overheadtopl.text = nil;
    overheadtopw.text = nil;
    overheadlowerl.text = nil;
    overheadlowerw.text = nil;
    overheadoxh.text = nil;
    overheadm.text = nil;
    overheadpcs.text = nil;
    overheadloss.text = nil;
    
    [pillarh1 becomeFirstResponder];
    [pillarh1 resignFirstResponder];
}
- (IBAction)boardclear {
    board.text = nil;
    boardh.text = nil;
    boardl.text = nil;
    boardloss.text = nil;
    boardpcs.text = nil;
    boardw.text = nil;
    
    [pillarh1 becomeFirstResponder];
    [pillarh1 resignFirstResponder];
}
- (IBAction)typeclear {
    type.text = nil;
    typeloss.text = nil;
    typem.text = nil;
    typepcs.text = nil;
    typeunits.text = nil;
    
    [pillarh1 becomeFirstResponder];
    [pillarh1 resignFirstResponder];
}
@end
