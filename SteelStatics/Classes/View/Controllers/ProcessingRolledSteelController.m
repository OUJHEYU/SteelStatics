#import "ProcessingRolledSteelController.h"
#import "AppInterface.h"
@interface ProcessingRolledSteelController ()

@property DropDown1 *dd1;
@property DropDown1 *dd2;
@property DropDown1 *dd3;
@property DropDown1 *dd4;
@property DropDown1 *dd5;
@property DropDown1 *dd6;
@property DropDown1 *dd7;
@property DropDown1 *dd8;
@property DropDown1 *dd9;
@property DropDown1 *dd10;
@end

@implementation ProcessingRolledSteelController
@synthesize dd1,dd2,dd3,dd4,dd5,dd6,dd7,dd8,dd9,dd10;

//標準H型鋼對稱 caculate field
@synthesize hsteelsymmetrym, hsteelsymmetrypcs, hsteelsymmetryloss, hsteelsymmetry, hsteelsymmetrykg, hsteelsymmetryname;

//變截面H型鋼 caculate field
@synthesize hsectionh1, hsectionh2, hsectionb, hsectiont1, hsectiont2, hsectionm, hsectionpcs, hsectionloss, hsection, hsectionname, hsectionmodel;

//H型鋼不對稱 caculate field
@synthesize hsteelasymmetricalh, hsteelasymmetricalb1, hsteelasymmetricalb2, hsteelasymmetricaltw, hsteelasymmetricalt1, hsteelasymmetricalt2, hsteelasymmetricalm, hsteelasymmetricalpcs, hsteelasymmetricalloss, hsteelasymmetrical, hsteelasymmetricalmodel , hsteelasymmetricalname;

//變截面H型鋼 屋面樑 caculate field
@synthesize bridgeh1, bridgeh2, bridgeb, bridget1, bridget2, bridgewater, bridgem, bridgepcs, bridgeloss, bridge,bridgemodel , bridgename;

//天車樑 caculate field
@synthesize overheadmidl, overheadw, overheadtopl, overheadtopw, overheadlowerl, overheadlowerw, overheadoxh, overheadm, overheadpcs, overheadloss, overhead, overheadmodel , overheadname;

//工字鋼 caculate field
@synthesize girderpcs, girderloss, girderm, girderkg, girder, girdername;

//槽鋼 caculate field
@synthesize channelpcs, channelloss, channelm, channelkg, channel, channelname;

//角鋼 caculate field
@synthesize angleside1, angleside2, anglethick, anglem, anglepcs, angleloss, angles, anglekg, anglesname;

//圓管 caculate field
@synthesize circlepipediamter, circlepipethick, circlepipem, circlepipepcs, circlepipeloss, circlepipe, circlepipemodel , circlepipename;

//圓鋼 caculate field
@synthesize circlesteeldiamter, circlesteelm, circlesteelpcs, circlesteelloss, circlesteel, circlesteelkg, circlesteelname;

//矩形管 caculate field
@synthesize rectanglepipelong, rectanglepipeshort, rectanglepipethick, rectanglepipem, rectanglepipepcs, rectanglepipeloss, rectanglepipekg, rectanglepipe, rectanglepipename;

//鋼板 caculate field
@synthesize boardl, boardw, boardh, boardpcs, boardloss, board, boardmodel, boardname;

//C型鋼 caculate field
@synthesize csteelh, csteelb, csteelc, csteelthick, csteelm, csteelpcs, csteelloss, csteelkg, csteel, csteelname;

//Z型鋼 caculate field
@synthesize zsteelh, zsteelb, zsteelc, zsteelthick, zsteelm, zsteelpcs, zsteelloss, zsteelkg, zsteel, zsteelname;




//角鋼 Label
@synthesize anglessidekglabel, anglesside1label, anglesside2label, anglesthicklabel, anglesmlabel, anglespcslabel, angleslosslabel, anglessidekg2label, a1, a2;

//圓鋼 Label
@synthesize circlesteeldiamterlabel, c1, circlesteelkglabel;

//矩形管 Label
@synthesize rectanglepipelonglabel, rectanglepipelonglabel2, rectanglepipeshortlabel, rectanglepipeshortlabel2, rectanglepipethicklabel, rectanglepipemlabel, rectanglepipepcslabel, rectanglepipelosslabel, rectanglepipekglabel, r1, r2, r3;

//C型鋼 Label
@synthesize csteelhlabel, csteelblabel, csteelclabel, csteelthicklabel, csteelmlabel, csteelpcslabel, csteellosslabel, csteelkglabel, x1, x2, x3;

//Z Label
@synthesize zsteelhlabel, zsteelblabel, zsteelclabel, zsteelthicklabel, zsteelmlabel, zsteelpcslabel, zsteellosslabel, zsteelkglabel, z1, z2, z3;

#pragma mark - Override Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Creat];
    //Scrollview
    AppScrollView* scrollView = (AppScrollView*)self.view;
    UIView* contentView = [scrollView.subviews firstObject];
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, contentView.bounds.size.height);
    //Hide tableview
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClicked)];
    gestureRecognizer.cancelsTouchesInView = NO;
    gestureRecognizer.delegate=self;
    [self.view addGestureRecognizer:gestureRecognizer];
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UITextField class]])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

-(void) autoUpdateResuls
{
    [self hsteelsymmetrycaculate];
    [self girdercaculate];
    [self channelcaculate];
    [self anglescaculate];
    [self rectanglepipecaculate];
    [self csteelcaculate];
    [self zsteelcaculate];
    [self circlesteelcaculate];
    hsection.value = ((hsectionh1.value + hsectionh2.value) / 2 * hsectiont1.value * 0.00785 + hsectionb.value * hsectiont2.value * 2 * 0.00785) * hsectionm.value * hsectionpcs.value * (hsectionloss.value / 100 + 1);
    bridge.value = ((bridgeh1.value + bridgeh2.value) / 2 * bridget1.value * 0.00785 + bridgeb.value * bridget2.value * 2 * 0.00785) * bridgem.value * bridgepcs.value * (sqrtf(100 * 100 + bridgewater.value * bridgewater.value) / 100) * (bridgeloss.value / 100 + 1);
    overhead.value = ((overheadmidl.value * overheadw.value * overheadm.value * 0.00785) + (overheadtopl.value * overheadtopw.value * overheadm.value * 0.00785) + (overheadlowerl.value * overheadlowerw.value * (overheadm.value + ((overheadmidl.value - overheadoxh.value) / 500)) * 0.00785)) * overheadpcs.value * (overheadloss.value / 100 + 1);
    board.value = (boardl.value * boardw.value * boardh.value * 0.00000785) * boardpcs.value * (boardloss.value / 100 + 1);
    circlepipe.value = (0.02466 * circlepipethick.value * (circlepipediamter.value - circlepipethick.value)) * circlepipem.value * circlepipepcs.value * (circlepipeloss.value / 100 + 1);
    hsteelasymmetrical.value = (((hsteelasymmetricalh.value - hsteelasymmetricalt1.value - hsteelasymmetricalt2.value)*hsteelasymmetricaltw.value*0.00785)+(hsteelasymmetricalb1.value*hsteelasymmetricalt1.value*0.00785)+(hsteelasymmetricalb2.value*hsteelasymmetricalt2.value*0.00785))*hsteelasymmetricalm.value*hsteelasymmetricalpcs.value*(hsteelasymmetricalloss.value / 100 + 1);
}

- (IBAction)hsteelsymmetryclear {
    hsteelsymmetrykg.text = nil;
    hsteelsymmetry.text = nil;
    hsteelsymmetrym.text = nil;
    hsteelsymmetrypcs.text = nil;
    hsteelsymmetryloss.text = nil;
    hsteelsymmetryname.text = nil;
    hsteelasymmetricalmodel.text = nil;
    dd1.textField.text = @"";
    
    
    [hsteelsymmetry becomeFirstResponder];
    
}
- (IBAction)hsteelasymmetricalclear {
    hsteelasymmetrical.text = nil;
    hsteelasymmetricalh.text = nil;
    hsteelasymmetricalb1.text = nil;
    hsteelasymmetricalb2.text = nil;
    hsteelasymmetricalt1.text = nil;
    hsteelasymmetricaltw.text = nil;
    hsteelasymmetricalm.text = nil;
    hsteelasymmetricalpcs.text = nil;
    hsteelasymmetricalloss.text = nil;
    hsteelasymmetricalt2.text = nil;
    hsteelasymmetricalname.text = nil;
    hsteelasymmetricalmodel.text = nil;
    
    [hsteelasymmetrical becomeFirstResponder];
}
- (IBAction)rectanglepipeclear {
    rectanglepipeshort.hidden = NO;
    rectanglepipethick.hidden = NO;
    rectanglepipelonglabel.hidden = NO;
    rectanglepipeshortlabel.hidden = NO;
    rectanglepipelonglabel2.hidden = NO;
    rectanglepipeshortlabel2.hidden = NO;
    rectanglepipethicklabel.hidden = NO;
    rectanglepipelong.hidden = NO;
    r1.hidden = NO;
    r2.hidden = NO;
    rectanglepipekg.hidden = YES;
    rectanglepipekglabel.hidden = YES;
    rectanglepipelonglabel.text = @"(mm)";
    
    rectanglepipekg.text = nil;
    rectanglepipe.text = nil;
    rectanglepipelong.text = nil;
    rectanglepipeshort.text = nil;
    rectanglepipethick.text = nil;
    rectanglepipem.text = nil;
    rectanglepipepcs.text = nil;
    rectanglepipeloss.text = nil;
    rectanglepipename.text = nil;
    dd2.textField.text = @"";
    dd3.textField.text = @"";
    
    
    [rectanglepipe becomeFirstResponder];
    
    
    [r3 setOriginX:CanvasX(498)];
    [rectanglepipem setOriginX:CanvasX(369)];
    [rectanglepipepcs setOriginX:CanvasX(439)];
    [rectanglepipeloss setOriginX:CanvasX(509)];
    [rectanglepipemlabel setOriginX:CanvasX(371)];
    [rectanglepipepcslabel setOriginX:CanvasX(451)];
    [rectanglepipelosslabel setOriginX:CanvasX(521)];
    
    dd3.textField.enabled = YES;
    dd2.textField.enabled = YES;
    
}
- (IBAction)circlepipeclear {
    circlepipe.text = nil;
    circlepipediamter.text = nil;
    circlepipethick.text = nil;
    circlepipem.text = nil;
    circlepipepcs.text = nil;
    circlepipeloss.text = nil;
    circlepipename.text = nil;
    circlepipemodel.text = nil;
    
    [circlepipe becomeFirstResponder];
}
- (IBAction)circlsteelclear {
    circlesteel.text = nil;
    circlesteelkg.text = nil;
    circlesteeldiamter.text = nil;
    circlesteelloss.text = nil;
    circlesteelm.text = nil;
    circlesteelpcs.text = nil;
    circlesteelname.text = nil;
    circlesteeldiamter.hidden = NO;
    circlesteeldiamterlabel.hidden = NO;
    circlesteelkg.hidden = YES;
    circlesteelkglabel.hidden = YES;
    c1.hidden = NO;
    
    dd4.textField.text = @"";
    [circlesteel becomeFirstResponder];
    [c1 setOriginX:CanvasX(236)];

}

- (IBAction)hsectionclear {
    hsection.text = nil;
    hsectionh1.text = nil;
    hsectionh2.text = nil;
    hsectionb.text = nil;
    hsectiont1.text = nil;
    hsectiont2.text = nil;
    hsectionm.text = nil;
    hsectionpcs.text = nil;
    hsectionloss.text = nil;
    hsectionmodel.text = nil;
    hsectionname.text = nil;
    
    [hsection becomeFirstResponder];
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
    bridgename.text = nil;
    bridgemodel.text = nil;
    
    [bridge becomeFirstResponder];
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
    overheadname.text = nil;
    overheadmodel.text = nil;
    
    [overhead becomeFirstResponder];
}
- (IBAction)boardclear {
    board.text = nil;
    boardh.text = nil;
    boardl.text = nil;
    boardloss.text = nil;
    boardpcs.text = nil;
    boardw.text = nil;
    boardname.text = nil;
    boardmodel.text = nil;
    
    [board becomeFirstResponder];
}
- (IBAction)csteelclear {
    x1.hidden = NO;
    x2.hidden = NO;
    x3.hidden = NO;
    csteelh.hidden = NO;
    csteelb.hidden = NO;
    csteelc.hidden = NO;
    csteelthick.hidden = NO;
    csteelclabel.hidden = NO;
    csteelblabel.hidden = NO;
    csteelthicklabel.hidden = NO;
    csteelkg.hidden = YES;
    csteelkglabel.hidden = YES;
    csteelkg.text = nil;
    csteel.text = nil;
    csteelh.text = nil;
    csteelb.text = nil;
    csteelc.text = nil;
    csteelthick.text = nil;
    csteelm.text = nil;
    csteelpcs.text = nil;
    csteelloss.text = nil;
    csteelname.text = nil;
    dd5.textField.text = @"";
    csteelhlabel.text = @"H(mm)";
    
    [csteel becomeFirstResponder];
    [csteelm setOriginX:CanvasX(410)];
    [csteelpcs setOriginX:CanvasX(475)];
    [csteelloss setOriginX:CanvasX(540)];
    [csteelmlabel setOriginX:CanvasX(412)];
    [csteelpcslabel setOriginX:CanvasX(487)];
    [csteellosslabel setOriginX:CanvasX(553)];
    
}
- (IBAction)zsteelclear {
    z1.hidden = NO;
    z2.hidden = NO;
    z3.hidden = NO;
    zsteelh.hidden = NO;
    zsteelb.hidden = NO;
    zsteelc.hidden = NO;
    zsteelthick.hidden = NO;
    zsteelclabel.hidden = NO;
    zsteelblabel.hidden = NO;
    zsteelthicklabel.hidden = NO;
    zsteelkg.hidden = YES;
    zsteelkglabel.hidden = YES;
    zsteelkg.text = nil;
    zsteel.text = nil;
    zsteelh.text = nil;
    zsteelb.text = nil;
    zsteelc.text = nil;
    zsteelthick.text = nil;
    zsteelm.text = nil;
    zsteelname.text = nil;
    zsteelpcs.text = nil;
    zsteelloss.text = nil;
    zsteelhlabel.text = @"H(mm)";
    dd8.textField.text = @"";
    
    [zsteel becomeFirstResponder];
    [zsteelm setOriginX:CanvasX(409)];
    [zsteelpcs setOriginX:CanvasX(471)];
    [zsteelloss setOriginX:CanvasX(533)];
    [zsteelmlabel setOriginX:CanvasX(412)];
    [zsteelpcslabel setOriginX:CanvasX(483)];
    [zsteellosslabel setOriginX:CanvasX(546)];
}
- (IBAction)girderclear {
    girder.text = nil;
    girderkg.text = nil;
    girderloss.text = nil;
    girderm.text = nil;
    girdername.text = nil;
    girderpcs.text = nil;
    dd6.textField.text = @"";
    
    
    [girder becomeFirstResponder];
    
}
- (IBAction)channelclear {
    channel.text = nil;
    channelloss.text = nil;
    channelm.text = nil;
    channelpcs.text = nil;
    channelname.text = nil;
    channelkg.text = nil;
    dd7.textField.text = @"";
    
    
    [channel becomeFirstResponder];
    
}
- (IBAction)angleclear {
    angleside1.hidden = NO;
    angleside2.hidden = NO;
    anglethick.hidden = NO;
    anglesside1label.hidden = NO;
    anglesside2label.hidden = NO;
    anglesthicklabel.hidden = NO;
    a1.hidden = NO;
    a2.hidden = NO;
    anglessidekglabel.hidden = YES;
    anglekg.hidden = YES;
    anglessidekg2label.hidden = YES;
    anglekg.text = nil;
    angleloss.text = nil;
    anglem.text = nil;
    anglepcs.text = nil;
    angles.text = nil;
    anglesname.text = nil;
    angleside1.text = nil;
    angleside2.text = nil;
    anglethick.text = nil;
    dd9.textField.text = @"";
    
    dd10.textField.text = @"";
    
    [angles becomeFirstResponder];
    [anglem setOriginX:CanvasX(399)];
    [anglepcs setOriginX:CanvasX(479)];
    [angleloss setOriginX:CanvasX(559)];
    [anglesmlabel setOriginX:CanvasX(402)];
    [anglespcslabel setOriginX:CanvasX(492)];
    [angleslosslabel setOriginX:CanvasX(571)];
    
    dd10.textField.enabled = YES;
    dd9.textField.enabled = YES;
}

-(void)Creat
{
    UIView* contentView = [self.view.subviews firstObject];
    
    dd1 = [[DropDown1 alloc] initWithFrame:CanvasRect(595 , 58, 165, 31)];
    dd1.textField.placeholder = @"標準H型鋼型號";
    ProcessingRolledSteelController* weakSelf1 = self;
    dd1.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        [self hsteelsymmetryselect];
        weakSelf1.hsteelsymmetryloss.text = nil;
        weakSelf1.hsteelsymmetry.text = nil;
        weakSelf1.hsteelsymmetrym.text = nil;
        weakSelf1.hsteelsymmetrypcs.text = nil;
        weakSelf1.hsteelsymmetryname.text = nil;
    };;
    NSArray* arr1=[[NSArray alloc]initWithObjects:@"HW 100*100*6*8",@"HW 125*125*6.5*9",@"HW 150*150*7*10",@"HW 175*175*7.5*11",@"HW 200*200*8*12",@"HW #200*204*12*12",@"HW 250*250*9*14",@"HW #250*255*14*14",@"HW #294*302*12*12",@"HW 300*300*10*15",@"HW 300*305*15*15",@"HW #344*348*10*16",@"HW 350*350*12*19",@"HW #388*402*15*15",@"HW #394*398*11*18",@"HW 400*400*13*21",@"HW #400*408*21*21",@"HW 414*405*18*28",@"HW #428*407*20*35",@"HW #458*417*30*50",@"HW 498*432*45*70",@"HM 148*100*6*9",@"HM 194*150*6*9",@"HM 244*175*7*11",@"HM 294*200*8*12",@"HM 340*250*9*14",@"HM 390*300*10*16",@"HM 440*300*11*18",@"HM 482*300*11*15",@"HM 488*300*11*18",@"HM 582*300*12*17",@"HM 588*300*12*20",@"HM #594*302*14*23",@"HN 100*50*5*7",@"HN 125*60*6*8",@"HN 150*75*5*7",@"HN 175*90*5*8",@"HN 198*99*4.5*7",@"HN 200*100*5.5*8",@"HN 248*124*5*8",@"HN 250*125*6*9",@"HN 298*149*5.5*8",@"HN 300*150*6.5*9",@"HN 347*174*6*9",@"HN 350*175*7*11",@"HN #400*150*8*13",@"HN 396*199*7*11",@"HN 400*200*8*13",@"HN #450*150*9*14",@"HN 446*199*8*12",@"HN 450*200*9*14",@"HN #500*150*10*16",@"HN 496*199*9*14",@"HN 500*200*10*16",@"HN #506*201*11*19",@"HN 596*199*10*15",@"HN 600*200*11*17",@"HN #606*201*12*20",@"HN #692*300*13*20",@"HN 700*300*13*24",@"HP 200*204*12*12",@"HP 244*252*11*11",@"HP 250*255*14*14",@"HP 294*302*12*12",@"HP 300*300*10*15",@"HP 300*305*15*15",@"HP 338*351*13*13",@"HP 344*354*16*16",@"HP 350*350*12*19",@"HP 350*357*19*19",@"HP 388*402*15*15",@"HP 394*405*18*18",@"HP 400*400*13*21",@"HP 400*408*21*21",@"HP 414*405*18*28",@"HP 428*407*20*35",nil];
    dd1.tableArray = arr1;
    [contentView addSubview:dd1];
    
    
    dd2 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 1803, 165, 31)];
    dd2.textField.placeholder = @"等邊矩形管型號";
    ProcessingRolledSteelController* weakSelf2 = self;
    dd2.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        
        dd3.textField.enabled = NO;
        
        
        [self rectanglepipeselect];
        weakSelf2.rectanglepipelong.hidden = YES;
        weakSelf2.rectanglepipelonglabel2.hidden = YES;
        weakSelf2.rectanglepipeshort.hidden = YES;
        weakSelf2.rectanglepipeshortlabel2.hidden = YES;
        weakSelf2.rectanglepipethick.hidden = YES;
        weakSelf2.rectanglepipeshortlabel.hidden = YES;
        weakSelf2.rectanglepipethicklabel.hidden = YES;
        weakSelf2.rectanglepipekglabel.hidden = NO;
        weakSelf2.rectanglepipekg.hidden = NO;
        weakSelf2.r1.hidden = YES;
        weakSelf2.r2.hidden = YES;
        weakSelf2.rectanglepipelonglabel.text = @" (Kg)";
        weakSelf2.rectanglepipename.text = nil;
        weakSelf2.rectanglepipe.text = nil;
        weakSelf2.rectanglepipeloss.text = nil;
        weakSelf2.rectanglepipem.text = nil;
        weakSelf2.rectanglepipepcs.text = nil;
        [weakSelf2.r3 setOriginX:CanvasX(215)];
        [weakSelf2.rectanglepipem setOriginX:CanvasX(229)];
        [weakSelf2.rectanglepipepcs setOriginX:CanvasX(299)];
        [weakSelf2.rectanglepipeloss setOriginX:CanvasX(369)];
        [weakSelf2.rectanglepipemlabel setOriginX:CanvasX(234)];
        [weakSelf2.rectanglepipepcslabel setOriginX:CanvasX(312)];
        [weakSelf2.rectanglepipelosslabel setOriginX:CanvasX(382)];
        
    };;
    NSArray* arr2=[[NSArray alloc]initWithObjects:@"25*1.20",@"25*1.50",@"25*1.75",@"25*2.00",@"30*2.50",@"30*3.00",@"40*2.50",@"40*3.00",@"40*4.00",@"50*2.50",@"50*3.00",@"50*4.00",@"60*2.50",@"60*3.00",@"60*4.00",@"60*5.00",@"70*3.00",@"70*4.00",@"70*5.00",@"80*3.00",@"80*4.00",@"80*5.00",@"90*3.00",@"90*4.00",@"90*5.00",@"90*6.00",@"100*4.00",@"100*5.00",@"100*6.00",@"120*4.00",@"120*5.00",@"120*6.00",@"120*8.00",@"140*4.00",@"140*5.00",@"140*6.00",@"140*8.00",@"160*4.00",@"160*5.00",@"160*6.00",@"160*8.00",nil];
    dd2.tableArray = arr2;
    [contentView addSubview:dd2];
    
    dd3 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 1837, 165, 31)];
    dd3.textField.placeholder = @"不等邊矩形管型號";
    ProcessingRolledSteelController* weakSelf3 = self;
    dd3.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        
        dd2.textField.enabled = NO;
        
        
        [self rectanglepipeselect];
        weakSelf3.rectanglepipelong.hidden = YES;
        weakSelf3.rectanglepipelonglabel2.hidden = YES;
        weakSelf3.rectanglepipeshort.hidden = YES;
        weakSelf3.rectanglepipeshortlabel2.hidden = YES;
        weakSelf3.rectanglepipethick.hidden = YES;
        weakSelf3.rectanglepipeshortlabel.hidden = YES;
        weakSelf3.rectanglepipethicklabel.hidden = YES;
        weakSelf3.rectanglepipekglabel.hidden = NO;
        weakSelf3.rectanglepipekg.hidden = NO;
        weakSelf3.r1.hidden = YES;
        weakSelf3.r2.hidden = YES;
        weakSelf3.rectanglepipelonglabel.text = @" (Kg)";
        weakSelf3.rectanglepipe.text = nil;
        weakSelf3.rectanglepipename.text = nil;
        weakSelf3.rectanglepipeloss.text = nil;
        weakSelf3.rectanglepipem.text = nil;
        weakSelf3.rectanglepipepcs.text = nil;
        [weakSelf3.r3 setOriginX:CanvasX(215)];
        [weakSelf3.rectanglepipem setOriginX:CanvasX(229)];
        [weakSelf3.rectanglepipepcs setOriginX:CanvasX(299)];
        [weakSelf3.rectanglepipeloss setOriginX:CanvasX(369)];
        [weakSelf3.rectanglepipemlabel setOriginX:CanvasX(234)];
        [weakSelf3.rectanglepipepcslabel setOriginX:CanvasX(312)];
        [weakSelf3.rectanglepipelosslabel setOriginX:CanvasX(382)];
    };;
    NSArray* arr3=[[NSArray alloc]initWithObjects:@"50*25*1.20",@"50*25*1.50",@"50*30*2.50",@"50*30*3.00",@"50*30*4.00",@"60*30*2.50",@"60*30*3.00",@"60*30*4.00",@"60*40*2.50",@"60*40*3.00",@"60*40*4.00",@"70*50*3.00",@"70*50*4.00",@"70*50*5.00",@"80*40*2.50",@"80*40*3.00",@"80*40*4.00",@"80*40*5.00",@"80*60*3.00",@"80*60*4.00",@"80*60*5.00",@"90*40*3.00",@"90*40*4.00",@"90*40*5.00",@"90*50*3.00",@"90*50*4.00",@"90*50*5.00",@"90*60*3.00",@"90*60*4.00",@"90*60*5.00",@"100*50*3.00",@"100*50*4.00",@"100*50*5.00",@"120*60*3.00",@"120*60*4.00",@"120*60*5.00",@"120*60*6.00",@"120*80*3.00",@"120*80*3.00",@"120*80*5.00",@"120*80*6.00",@"140*80*4.00",@"140*80*5.00",@"140*80*6.00",@"150*100*4.00",@"150*100*5.00",@"150*100*6.00",@"150*100*8.00",@"160*80*4.00",@"160*80*5.00",@"160*80*6.00",@"160*80*8.00",@"180*100*4.00",@"180*100*5.00",@"180*100*6.00",@"180*100*8.00",@"200*100*4.00",@"200*100*5.00",@"200*100*6.00",@"200*100*8.00",nil];
    dd3.tableArray = arr3;
    [contentView addSubview:dd3];
    
    
    dd4 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 1630 , 165, 31)];
    dd4.textField.placeholder = @"圓鋼型號";
    ProcessingRolledSteelController* weakSelf4 = self;
    dd4.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        [self circleselect];
        weakSelf4.circlesteeldiamter.hidden = YES;
        weakSelf4.circlesteeldiamterlabel.hidden = YES;
        weakSelf4.circlesteelkg.hidden = NO;
        weakSelf4.circlesteelkglabel.hidden = NO;
        weakSelf4.circlesteel.text = nil;
        weakSelf4.circlesteelloss.text = nil;
        weakSelf4.circlesteelm.text = nil;
        weakSelf4.circlesteelpcs.text = nil;
        weakSelf4.circlesteelname.text = nil;
        
        [weakSelf4.c1 setOriginX:CanvasX(228)];
    };;
    NSArray* arr4=[[NSArray alloc]initWithObjects:@"Ф5.5",@"Ф6",@"Ф6.5",@"Ф7",@"Ф8",@"Ф9",@"Ф10",@"*Ф11",@"Ф12",@"Ф13",@"Ф14",@"Ф15",@"Ф16",@"Ф17",@"Ф18",@"Ф19",@"Ф20",@"Ф21",@"Ф22",@"*Ф23",@"Ф24",@"Ф25",@"Ф26",@"*Ф27",@"Ф28",@"*Ф29",@"Ф30",@"*Ф31",@"Ф32",@"*Ф33",@"Ф34",@"*Ф35",@"Ф36",@"Ф38",@"Ф40",@"Ф42",@"Ф45",@"Ф48",@"Ф50",@"Ф53",@"*Ф55",@"Ф56",@"*Ф58",@"Ф60",@"Ф63",@"*Ф65",@"*Ф68",@"Ф70",@"Ф75",@"Ф80",@"Ф85",@"Ф90",@"Ф95",@"Ф100",@"Ф105",@"Ф110",@"Ф115",@"Ф120",@"Ф125",@"Ф130",@"Ф140",@"Ф150",@"Ф160",@"Ф170",@"Ф180",@"Ф190",@"Ф200",@"Ф220",@"Ф250",nil];
    dd4.tableArray = arr4;
    [contentView addSubview:dd4];
    
    
    
    dd5 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 2153, 165, 31)];
    dd5.textField.placeholder = @"C型鋼型號";
    ProcessingRolledSteelController* weakSelf5 = self;
    dd5.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        [self csteelselect];
        weakSelf5.x1.hidden = YES;
        weakSelf5.x2.hidden = YES;
        weakSelf5.x3.hidden = YES;
        weakSelf5.csteelh.hidden = YES;
        weakSelf5.csteelb.hidden = YES;
        weakSelf5.csteelc.hidden = YES;
        weakSelf5.csteelthick.hidden = YES;
        weakSelf5.csteelclabel.hidden = YES;
        weakSelf5.csteelblabel.hidden = YES;
        weakSelf5.csteelthicklabel.hidden = YES;
        weakSelf5.csteelkglabel.hidden = NO;
        weakSelf5.csteelkg.hidden = NO;
        [weakSelf5.csteelm setOriginX:CanvasX(221)];
        [weakSelf5.csteelpcs setOriginX:CanvasX(283)];
        [weakSelf5.csteelloss setOriginX:CanvasX(345)];
        [weakSelf5.csteelmlabel setOriginX:CanvasX(226)];
        [weakSelf5.csteelpcslabel setOriginX:CanvasX(295)];
        [weakSelf5.csteellosslabel setOriginX:CanvasX(358)];
        weakSelf5.csteelhlabel.text = @"  (Kg)";
        weakSelf5.csteelm.text = nil;
        weakSelf5.csteelname.text = nil;
        weakSelf5.csteelpcs.text = nil;
        weakSelf5.csteelloss.text = nil;
        weakSelf5.csteel.text = nil;
    };;
    NSArray* arr5=[[NSArray alloc]initWithObjects:@"C120*50*20*3.0",@"C140*50*20*2.0",@"C140*50*20*2.5",@"C160*60*20*2.0",@"C160*60*20*2.2",@"C160*60*20*2.5",@"C160*60*20*3.0",@"C180*70*20*2.0",@"C180*70*20*2.2",@"C180*70*20*2.5",@"C180*70*20*3.0",@"C200*70*20*2.0",@"C200*70*20*2.2",@"C200*70*20*2.5",@"C200*70*20*3.0",@"C220*75*20*2.0",@"C220*75*20*2.2",@"C220*75*20*2.5",@"C220*75*20*3.0",@"C250*75*20*2.0",@"C250*75*20*2.2",@"C250*75*20*2.5",nil];
    dd5.tableArray = arr5;
    [contentView addSubview:dd5];
    
    
    dd6 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 929, 165, 31)];
    dd6.textField.placeholder = @"工字鋼型號";
    ProcessingRolledSteelController* weakSelf6 = self;
    dd6.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        [self girderselect];
        weakSelf6.girder.text = nil;
        weakSelf6.girderloss.text = nil;
        weakSelf6.girderpcs.text = nil;
        weakSelf6.girdername.text = nil;
        weakSelf6.girderm.text = nil;
    };;
    NSArray* arr6=[[NSArray alloc]initWithObjects:@"工10",@"工12.6",@"工14",@"工16",@"工18",@"工20a",@"工20b",@"工22a",@"工22b",@"工25a",@"工25b",@"工28a",@"工28b",@"工32a",@"工32b",@"工32c",@"工36a",@"工36b",@"工36c",@"工40a",@"工40b",@"工40c",@"工45a",@"工45b",@"工45c",@"工50a",@"工50b",@"工50c",@"工56a",@"工56b",@"工56c",@"工63a",@"工63b",@"工63c",nil];
    dd6.tableArray = arr6;
    [contentView addSubview:dd6];
    
    
    dd7 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 1103, 165, 31)];
    dd7.textField.placeholder = @"槽鋼型號";
    ProcessingRolledSteelController* weakSelf7 = self;
    dd7.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        [self channelselect];
        weakSelf7.channel.text = nil;
        weakSelf7.channelloss.text = nil;
        weakSelf7.channelpcs.text = nil;
        weakSelf7.channelname.text = nil;
        weakSelf7.channelm.text = nil;
    };;
    NSArray* arr7=[[NSArray alloc]initWithObjects:@"〔5",@"〔6.3",@"〔8",@"〔10",@"〔12.6",@"〔14a",@"〔14b",@"〔16a",@"〔16b",@"〔18a",@"〔18b",@"〔20a",@"〔20b",@"〔22a",@"〔22b",@"〔25a",@"〔25b",@"〔25c",@"〔28a",@"〔28b",@"〔28c",@"〔32a",@"〔32b",@"〔32c",@"〔36a",@"〔36b",@"〔36c",@"〔30a",@"〔40b",@"〔40c",nil];
    dd7.tableArray = arr7;
    [contentView addSubview:dd7];
    
    
    dd8 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 2329, 165, 31)];
    dd8.textField.placeholder = @"Z型鋼型號";
    ProcessingRolledSteelController* weakSelf8 = self;
    dd8.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        [self zsteelselect];
        weakSelf8.z1.hidden = YES;
        weakSelf8.z2.hidden = YES;
        weakSelf8.z3.hidden = YES;
        weakSelf8.zsteelh.hidden = YES;
        weakSelf8.zsteelb.hidden = YES;
        weakSelf8.zsteelc.hidden = YES;
        weakSelf8.zsteelthick.hidden = YES;
        weakSelf8.zsteelclabel.hidden = YES;
        weakSelf8.zsteelblabel.hidden = YES;
        weakSelf8.zsteelthicklabel.hidden = YES;
        weakSelf8.zsteelkg.hidden = NO;
        weakSelf8.zsteelkglabel.hidden = NO;
        weakSelf8.zsteelhlabel.text = @"  (Kg)";
        weakSelf8.zsteelm.text = nil;
        weakSelf8.zsteelloss.text = nil;
        weakSelf8.zsteelpcs.text = nil;
        weakSelf8.zsteelname.text = nil;
        weakSelf8.zsteel.text = nil;
        
        [weakSelf8.zsteelm setOriginX:CanvasX(223)];
        [weakSelf8.zsteelpcs setOriginX:CanvasX(285)];
        [weakSelf8.zsteelloss setOriginX:CanvasX(347)];
        [weakSelf8.zsteelmlabel setOriginX:CanvasX(228)];
        [weakSelf8.zsteelpcslabel setOriginX:CanvasX(297)];
        [weakSelf8.zsteellosslabel setOriginX:CanvasX(358)];
    };;
    NSArray* arr8=[[NSArray alloc]initWithObjects:@"Z140*50*20*2.0",@"Z140*50*20*2.2",@"Z140*50*20*2.5",@"Z160*60*20*2.0",@"Z160*60*20*2.2",@"Z160*60*20*2.5",@"Z180*70*20*2.0",@"Z180*70*20*2.2",@"Z180*70*20*2.5",@"Z200*70*20*2.0",@"Z200*70*20*2.2",@"Z200*70*20*2.5",@"Z220*75*20*2.0",@"Z220*75*20*2.2",@"Z220*75*20*2.5",@"Z250*75*20*2.0",@"Z250*75*20*2.2",@"Z250*75*20*2.5",nil];
    dd8.tableArray = arr8;
    [contentView addSubview:dd8];
    
    
    dd9 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 1278, 165, 31)];
    dd9.textField.placeholder = @"等邊角鋼型號";
    ProcessingRolledSteelController* weakSelf9 = self;
    dd9.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        
        dd10.textField.enabled = NO;
        
        
        [self angleselect];
        weakSelf9.angleside1.hidden = YES;
        weakSelf9.angleside2.hidden = YES;
        weakSelf9.anglethick.hidden = YES;
        weakSelf9.anglesside1label.hidden = YES;
        weakSelf9.anglesside2label.hidden = YES;
        weakSelf9.anglesthicklabel.hidden = YES;
        weakSelf9.a1.hidden = YES;
        weakSelf9.a2.hidden = YES;
        weakSelf9.anglekg.hidden = NO;
        weakSelf9.anglessidekglabel.hidden = NO;
        weakSelf9.anglessidekg2label.hidden = NO;
        weakSelf9.angleloss.text = nil;
        weakSelf9.angles.text = nil;
        weakSelf9.anglem.text = nil;
        weakSelf9.anglepcs.text = nil;
        weakSelf9.anglesname.text = nil;
        
        [weakSelf9.anglem setOriginX:CanvasX(239)];
        [weakSelf9.anglepcs setOriginX:CanvasX(319)];
        [weakSelf9.angleloss setOriginX:CanvasX(399)];
        [weakSelf9.anglesmlabel setOriginX:CanvasX(243)];
        [weakSelf9.anglespcslabel setOriginX:CanvasX(331)];
        [weakSelf9.angleslosslabel setOriginX:CanvasX(413)];
    };;
    NSArray* arr9=[[NSArray alloc]initWithObjects:@"L 20*3",@"L 20*4",@"L 25*3",@"L 25*4",@"L 30*3",@"L 30*4",@"L 36*3",@"L 36*4",@"L 36*5",@"L 40*3",@"L 40*4",@"L 40*5",@"L 45*3",@"L 45*4",@"L 45*5",@"L 45*6",@"L 50*3",@"L 50*4",@"L 50*5",@"L 50*6",@"L 56*3",@"L 56*4",@"L 56*5",@"L 56*8",@"L 63*4",@"L 63*5",@"L 63*6",@"L 63*8",@"L 63*10",@"L 70*4",@"L 70*5",@"L 70*6",@"L 70*7",@"L 70*8",@"L 75*5",@"L 75*6",@"L 75*7",@"L 75*8",@"L 75*10",@"L 80*5",@"L 80*6",@"L 80*7",@"L 80*8",@"L 80*10",@"L 90*6",@"L 90*7",@"L 90*8",@"L 90*10",@"L 90*12",@"L 100*6",@"L 100*7",@"L 100*8",@"L 100*10",@"L 100*12",@"L 100*14",@"L 100*16",@"L 110*7",@"L 110*8",@"L 110*10",@"L 110*12",@"L 110*14",@"L 125*8",@"L 125*10",@"L 125*12",@"L 125*14",@"L 140*10",@"L 140*12",@"L 140*14",@"L 140*16",@"L 160*10",@"L 160*12",@"L 160*14",@"L 160*16",@"L 180*12",@"L 180*14",@"L 180*16",@"L 180*18",@"L 200*14",@"L 200*16",@"L 200*18",@"L 200*20",@"L 200*24",nil];
    dd9.tableArray = arr9;
    [contentView addSubview:dd9];
    
    dd10 = [[DropDown1 alloc] initWithFrame:CanvasRect(595, 1312, 165, 31)];
    dd10.textField.placeholder = @"不等邊角鋼型號";
    ProcessingRolledSteelController* weakSelf10 = self;
    dd10.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        
        dd9.textField.enabled = NO;
        
        
        [self angleselect];
        weakSelf10.angleside1.hidden = YES;
        weakSelf10.angleside2.hidden = YES;
        weakSelf10.anglethick.hidden = YES;
        weakSelf10.anglesside1label.hidden = YES;
        weakSelf10.anglesside2label.hidden = YES;
        weakSelf10.anglesthicklabel.hidden = YES;
        weakSelf10.a1.hidden = YES;
        weakSelf10.a2.hidden = YES;
        weakSelf10.anglekg.hidden = NO;
        weakSelf10.anglessidekg2label.hidden = NO;
        weakSelf10.anglessidekglabel.hidden = NO;
        
        weakSelf10.anglesname.text = nil;
        weakSelf10.angleloss.text = nil;
        weakSelf10.angles.text = nil;
        weakSelf10.anglem.text = nil;
        weakSelf10.anglepcs.text = nil;
        
        [weakSelf10.anglem setOriginX:CanvasX(239)];
        [weakSelf10.anglepcs setOriginX:CanvasX(319)];
        [weakSelf10.angleloss setOriginX:CanvasX(399)];
        [weakSelf10.anglesmlabel setOriginX:CanvasX(243)];
        [weakSelf10.anglespcslabel setOriginX:CanvasX(331)];
        [weakSelf10.angleslosslabel setOriginX:CanvasX(413)];
    };;
    
    NSArray* arr10=[[NSArray alloc]initWithObjects:@"L 25*10*3",@"L 25*10*4",@"L 32*20*3",@"L 32*20*4",@"L 40*25*3",@"L 40*25*4",@"L 45*28*3",@"L 45*28*4",@"L 50*32*3",@"L 50*32*4",@"L 56*36*3",@"L 56*36*4",@"L 56*36*5",@"L 63*40*4",@"L 63*40*5",@"L 63*40*6",@"L 63*40*7",@"L 70*45*4",@"L 70*45*5",@"L 70*45*6",@"L 70*45*7",@"L 75*50*5",@"L 75*50*6",@"L 75*50*8",@"L 75*50*10",@"L 80*50*5",@"L 80*50*6",@"L 80*50*7",@"L 80*50*8",@"L 90*56*5",@"L 90*56*6",@"L 90*56*7",@"L 90*56*8",@"L 100*63*6",@"L 100*63*7",@"L 100*63*8",@"L 100*63*10",@"L 100*80*6",@"L 100*80*7",@"L 100*80*8",@"L 100*80*10",@"L 110*70*6",@"L 110*70*7",@"L 110*70*8",@"L 110*70*10",@"L 125*80*7",@"L 125*80*8",@"L 125*80*10",@"L 125*80*12",@"L 140*90*8",@"L 140*90*10",@"L 140*90*12",@"L 140*90*14",@"L 160*100*10",@"L 160*100*12",@"L 160*100*14",@"L 160*100*16",@"L 180*110*10",@"L 180*110*12",@"L 180*110*14",@"L 180*110*16",@"L 200*125*12",@"L 200*125*14",@"L 200*125*16",@"L 200*125*18",nil];
    dd10.tableArray = arr10;
    [contentView addSubview:dd10];
    
    
}


-(void)circlesteelcaculate
{
    if ([dd4.textField.text isEqualToString:@"Ф5.5"]){
        circlesteel.value = 0.186 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф6"]){
        circlesteel.value = 0.222 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф6.5"]){
        circlesteel.value = 0.26 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф7"]){
        circlesteel.value = 0.302 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф8"]){
        circlesteel.value = 0.395 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф9"]){
        circlesteel.value = 0.499 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф10"]){
        circlesteel.value = 0.617 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф11"]){
        circlesteel.value = 0.746 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф12"]){
        circlesteel.value = 0.888 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф13"]){
        circlesteel.value = 1.04 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф14"]){
        circlesteel.value = 1.21 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф15"]){
        circlesteel.value = 1.39 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф16"]){
        circlesteel.value = 1.58 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф17"]){
        circlesteel.value = 1.78 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф18"]){
        circlesteel.value = 2 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф19"]){
        circlesteel.value = 2.23 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф20"]){
        circlesteel.value = 2.47 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф21"]){
        circlesteel.value = 2.72 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф22"]){
        circlesteel.value = 2.98 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф23"]){
        circlesteel.value = 3.26 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф24"]){
        circlesteel.value = 3.55 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф25"]){
        circlesteel.value = 3.85 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф26"]){
        circlesteel.value = 4.17 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф27"]){
        circlesteel.value = 4.49 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф28"]){
        circlesteel.value = 4.83 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф29"]){
        circlesteel.value = 5.18 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф30"]){
        circlesteel.value = 5.55 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф31"]){
        circlesteel.value = 5.92 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф32"]){
        circlesteel.value = 6.31 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф33"]){
        circlesteel.value = 6.71 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф34"]){
        circlesteel.value = 7.13 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф35"]){
        circlesteel.value = 7.55 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф36"]){
        circlesteel.value = 7.99 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф38"]){
        circlesteel.value = 8.9 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф40"]){
        circlesteel.value = 9.86 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф42"]){
        circlesteel.value = 10.9 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф45"]){
        circlesteel.value = 12.5 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф48"]){
        circlesteel.value = 14.2 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф50"]){
        circlesteel.value = 15.4 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф53"]){
        circlesteel.value = 17.3 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф55"]){
        circlesteel.value = 18.6 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф56"]){
        circlesteel.value = 19.3 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф58"]){
        circlesteel.value = 20.7 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф60"]){
        circlesteel.value = 22.2 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф63"]){
        circlesteel.value = 24.5 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф65"]){
        circlesteel.value = 26 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"*Ф68"]){
        circlesteel.value = 28.5 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф70"]){
        circlesteel.value = 30.2 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф75"]){
        circlesteel.value = 34.7 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф80"]){
        circlesteel.value = 39.5 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф85"]){
        circlesteel.value = 44.5 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф90"]){
        circlesteel.value = 49.9 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф95"]){
        circlesteel.value = 55.6 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф100"]){
        circlesteel.value = 61.7 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф105"]){
        circlesteel.value = 68 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф110"]){
        circlesteel.value = 74.6 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф115"]){
        circlesteel.value = 81.5 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф120"]){
        circlesteel.value = 88.8 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф125"]){
        circlesteel.value = 96.3 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф130"]){
        circlesteel.value = 104 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф140"]){
        circlesteel.value = 121 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф150"]){
        circlesteel.value = 139 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф160"]){
        circlesteel.value = 158 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф170"]){
        circlesteel.value = 178 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф180"]){
        circlesteel.value = 200 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф190"]){
        circlesteel.value = 223 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф200"]){
        circlesteel.value = 247 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф220"]){
        circlesteel.value = 298 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Ф250"]){
        circlesteel.value = 385 * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
        
    }else{
        circlesteel.value = (0.00617 * circlesteeldiamter.value * circlesteeldiamter.value) * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
    }
}

-(void)rectanglepipecaculate
{
    if ([dd2.textField.text isEqualToString:@"25*1.20"]){
        rectanglepipe.value = 0.9 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"25*1.50"]){
        rectanglepipe.value = 1.11 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"25*1.75"]){
        rectanglepipe.value = 1.28 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"25*2.00"]){
        rectanglepipe.value = 1.44 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"30*2.50"]){
        rectanglepipe.value = 2.16 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"30*3.00"]){
        rectanglepipe.value = 2.54 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"40*2.50"]){
        rectanglepipe.value = 2.94 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"40*3.00"]){
        rectanglepipe.value = 3.49 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"40*4.00"]){
        rectanglepipe.value = 4.52 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"50*2.50"]){
        rectanglepipe.value = 3.73 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"50*3.00"]){
        rectanglepipe.value = 4.43 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"50*4.00"]){
        rectanglepipe.value = 5.78 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"60*2.50"]){
        rectanglepipe.value = 4.51 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"60*3.00"]){
        rectanglepipe.value = 5.37 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"60*4.00"]){
        rectanglepipe.value = 7.03 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"60*5.00"]){
        rectanglepipe.value = 8.64 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"70*3.00"]){
        rectanglepipe.value = 6.31 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"70*4.00"]){
        rectanglepipe.value = 8.29 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"70*5.00"]){
        rectanglepipe.value = 10.21 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"80*3.00"]){
        rectanglepipe.value = 7.25 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"80*4.00"]){
        rectanglepipe.value = 9.55 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"80*5.00"]){
        rectanglepipe.value = 11.78 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"90*3.00"]){
        rectanglepipe.value = 8.2 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"90*4.00"]){
        rectanglepipe.value = 10.8 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"90*5.00"]){
        rectanglepipe.value = 13.35 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"90*6.00"]){
        rectanglepipe.value = 15.83 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"100*4.00"]){
        rectanglepipe.value = 12.06 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"100*5.00"]){
        rectanglepipe.value = 14.92 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"100*6.00"]){
        rectanglepipe.value = 17.71 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"120*4.00"]){
        rectanglepipe.value = 14.57 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"120*5.00"]){
        rectanglepipe.value = 18.05 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"120*6.00"]){
        rectanglepipe.value = 21.48 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"120*8.00"]){
        rectanglepipe.value = 28.13 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"140*4.00"]){
        rectanglepipe.value = 17.08 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"140*5.00"]){
        rectanglepipe.value = 21.2 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"140*6.00"]){
        rectanglepipe.value = 25.25 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"140*8.00"]){
        rectanglepipe.value = 33.16 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"160*4.00"]){
        rectanglepipe.value = 19.59 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"160*5.00"]){
        rectanglepipe.value = 24.34 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"160*6.00"]){
        rectanglepipe.value = 29.01 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd2.textField.text isEqualToString:@"160*8.00"]){
        rectanglepipe.value = 38.18 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"50*25*1.20"]){
        rectanglepipe.value = 1.37 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"50*25*1.20"]){
        rectanglepipe.value = 1.37 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"50*25*1.50"]){
        rectanglepipe.value = 1.7 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"50*30*2.50"]){
        rectanglepipe.value = 2.94 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"50*30*3.00"]){
        rectanglepipe.value = 3.49 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"50*30*4.00"]){
        rectanglepipe.value = 4.52 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"60*30*2.50"]){
        rectanglepipe.value = 3.34 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"60*30*3.00"]){
        rectanglepipe.value = 3.96 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"60*30*4.00"]){
        rectanglepipe.value = 5.15 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"60*40*2.50"]){
        rectanglepipe.value = 3.73 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"60*40*3.00"]){
        rectanglepipe.value = 4.43 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"60*40*4.00"]){
        rectanglepipe.value = 5.78 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"70*50*3.00"]){
        rectanglepipe.value = 5.37 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"70*50*4.00"]){
        rectanglepipe.value = 7.03 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"70*50*5.00"]){
        rectanglepipe.value = 8.64 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"80*40*2.50"]){
        rectanglepipe.value = 4.51 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"80*40*3.00"]){
        rectanglepipe.value = 5.37 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"80*40*4.00"]){
        rectanglepipe.value = 7.03 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"80*40*5.00"]){
        rectanglepipe.value = 8.64 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"80*60*3.00"]){
        rectanglepipe.value = 6.31 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"80*60*4.00"]){
        rectanglepipe.value = 8.29 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"80*60*5.00"]){
        rectanglepipe.value = 10.21 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*40*3.00"]){
        rectanglepipe.value = 5.84 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*40*4.00"]){
        rectanglepipe.value = 7.66 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*40*5.00"]){
        rectanglepipe.value = 9.42 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*50*3.00"]){
        rectanglepipe.value = 6.31 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*50*4.00"]){
        rectanglepipe.value = 8.29 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*50*5.00"]){
        rectanglepipe.value = 10.21 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*60*3.00"]){
        rectanglepipe.value = 6.78 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*60*4.00"]){
        rectanglepipe.value = 8.92 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"90*60*5.00"]){
        rectanglepipe.value = 10.99 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*60*3.00"]){
        rectanglepipe.value = 8.2 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*60*4.00"]){
        rectanglepipe.value = 10.8 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*60*5.00"]){
        rectanglepipe.value = 13.35 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*60*6.00"]){
        rectanglepipe.value = 15.83 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*80*3.00"]){
        rectanglepipe.value = 9.14 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*80*4.00"]){
        rectanglepipe.value = 12.06 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*80*5.00"]){
        rectanglepipe.value = 14.92 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"120*80*6.00"]){
        rectanglepipe.value = 17.71 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"140*80*4.00"]){
        rectanglepipe.value = 13.31 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"140*80*5.00"]){
        rectanglepipe.value = 16.48 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"140*80*6.00"]){
        rectanglepipe.value = 19.59 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"150*100*4.00"]){
        rectanglepipe.value = 15.2 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"150*100*5.00"]){
        rectanglepipe.value = 18.84 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"150*100*6.00"]){
        rectanglepipe.value = 22.42 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"150*100*8.00"]){
        rectanglepipe.value = 29.39 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"160*80*4.00"]){
        rectanglepipe.value = 14.57 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"160*80*5.00"]){
        rectanglepipe.value = 18.05 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"160*80*6.00"]){
        rectanglepipe.value = 21.48 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"160*80*8.00"]){
        rectanglepipe.value = 28.13 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"180*100*4.00"]){
        rectanglepipe.value = 17.08 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"180*100*5.00"]){
        rectanglepipe.value = 21.2 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"180*100*6.00"]){
        rectanglepipe.value = 25.25 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"180*100*8.00"]){
        rectanglepipe.value = 33.16 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"200*100*4.00"]){
        rectanglepipe.value = 18.34 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"200*100*5.00"]){
        rectanglepipe.value = 22.77 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"200*100*6.00"]){
        rectanglepipe.value = 27.13 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"200*100*8.00"]){
        rectanglepipe.value = 35.67 * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
    }else{
        rectanglepipe.value = ((rectanglepipelong.value + rectanglepipeshort.value - 2 * rectanglepipethick.value) * rectanglepipethick.value * 0.0157) * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
    }
}

-(void)hsteelsymmetrycaculate
{
    if ([dd1.textField.text isEqualToString:@"HW 100*100*6*8"]){
        hsteelsymmetry.value = 17.2 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 125*125*6.5*9"]){
        hsteelsymmetry.value = 23.8 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 150*150*7*10"]){
        hsteelsymmetry.value = 31.9 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 175*175*7.5*11"]){
        hsteelsymmetry.value = 40.3 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 200*200*8*12"]){
        hsteelsymmetry.value = 50.5 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #200*204*12*12"]){
        hsteelsymmetry.value = 56.7 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 250*250*9*14"]){
        hsteelsymmetry.value = 72.4 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #250*255*14*14"]){
        hsteelsymmetry.value = 82.2 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #294*302*12*12"]){
        hsteelsymmetry.value = 85 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 300*300*10*15"]){
        hsteelsymmetry.value = 94.5 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 300*305*15*15"]){
        hsteelsymmetry.value = 106 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #344*348*10*16"]){
        hsteelsymmetry.value = 115 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 350*350*12*19"]){
        hsteelsymmetry.value = 137 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #388*402*15*15"]){
        hsteelsymmetry.value = 141 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #394*398*11*18"]){
        hsteelsymmetry.value = 147 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 400*400*13*21"]){
        hsteelsymmetry.value = 172 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #400*408*21*21"]){
        hsteelsymmetry.value = 197 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 414*405*18*28"]){
        hsteelsymmetry.value = 233 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #428*407*20*35"]){
        hsteelsymmetry.value = 284 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #458*417*30*50"]){
        hsteelsymmetry.value = 415 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 498*432*45*70"]){
        hsteelsymmetry.value = 605 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 148*100*6*9"]){
        hsteelsymmetry.value = 21.4 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 194*150*6*9"]){
        hsteelsymmetry.value = 31.2 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 244*175*7*11"]){
        hsteelsymmetry.value = 44.1 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 294*200*8*12"]){
        hsteelsymmetry.value = 57.3 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 340*250*9*14"]){
        hsteelsymmetry.value = 79.7 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 390*300*10*16"]){
        hsteelsymmetry.value = 107 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 440*300*11*18"]){
        hsteelsymmetry.value = 124 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 482*300*11*15"]){
        hsteelsymmetry.value = 115 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 488*300*11*18"]){
        hsteelsymmetry.value = 129 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 582*300*12*17"]){
        hsteelsymmetry.value = 137 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 588*300*12*20"]){
        hsteelsymmetry.value = 151 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM #594*302*14*23"]){
        hsteelsymmetry.value = 175 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 100*50*5*7"]){
        hsteelsymmetry.value = 9.45 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 125*60*6*8"]){
        hsteelsymmetry.value = 13.3 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 150*75*5*7"]){
        hsteelsymmetry.value = 14.3 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 175*90*5*8"]){
        hsteelsymmetry.value = 18.2 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 198*99*4.5*7"]){
        hsteelsymmetry.value = 18.5 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 200*100*5.5*8"]){
        hsteelsymmetry.value = 21.7 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 248*124*5*8"]){
        hsteelsymmetry.value = 25.8 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 250*125*6*9"]){
        hsteelsymmetry.value = 29.7 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 298*149*5.5*8"]){
        hsteelsymmetry.value = 32.6 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 300*150*6.5*9"]){
        hsteelsymmetry.value = 37.3 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 347*174*6*9"]){
        hsteelsymmetry.value = 41.8 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 350*175*7*11"]){
        hsteelsymmetry.value = 50 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #400*150*8*13"]){
        hsteelsymmetry.value = 55.8 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 396*199*7*11"]){
        hsteelsymmetry.value = 56.7 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 400*200*8*13"]){
        hsteelsymmetry.value = 66 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #450*150*9*14"]){
        hsteelsymmetry.value = 66.5 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 446*199*8*12"]){
        hsteelsymmetry.value = 66.7 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 450*200*9*14"]){
        hsteelsymmetry.value = 76.5 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #500*150*10*16"]){
        hsteelsymmetry.value = 77.1 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 496*199*9*14"]){
        hsteelsymmetry.value = 79.5 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 500*200*10*16"]){
        hsteelsymmetry.value = 89.6 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #506*201*11*19"]){
        hsteelsymmetry.value = 103 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 596*199*10*15"]){
        hsteelsymmetry.value = 95.1 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 600*200*11*17"]){
        hsteelsymmetry.value = 106 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #606*201*12*20"]){
        hsteelsymmetry.value = 120 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #692*300*13*20"]){
        hsteelsymmetry.value = 166 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 700*300*13*24"]){
        hsteelsymmetry.value = 185 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 200*204*12*12"]){
        hsteelsymmetry.value = 56.7 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 244*252*11*11"]){
        hsteelsymmetry.value = 64.4 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 250*255*14*14"]){
        hsteelsymmetry.value = 82.2 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 294*302*12*12"]){
        hsteelsymmetry.value = 85 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 300*300*10*15"]){
        hsteelsymmetry.value = 94.5 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 300*305*15*15"]){
        hsteelsymmetry.value = 106 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 338*351*13*13"]){
        hsteelsymmetry.value = 106 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 344*354*16*16"]){
        hsteelsymmetry.value = 131 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 350*350*12*19"]){
        hsteelsymmetry.value = 137 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 350*357*19*19"]){
        hsteelsymmetry.value = 156 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 388*402*15*15"]){
        hsteelsymmetry.value = 141 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 394*405*18*18"]){
        hsteelsymmetry.value = 169 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 400*400*13*21"]){
        hsteelsymmetry.value = 172 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 400*408*21*21"]){
        hsteelsymmetry.value = 197 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 414*405*18*28"]){
        hsteelsymmetry.value = 233 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 428*407*20*35"]){
        hsteelsymmetry.value = 284 * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);
    }
}
-(void)anglescaculate
{
    if ([dd9.textField.text isEqualToString:@"L 20*3"]){
        angles.value = 0.89 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 20*4"]){
        angles.value = 1.14 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 25*3"]){
        angles.value = 1.12 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 25*4"]){
        angles.value = 1.46 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 30*3"]){
        angles.value = 1.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 30*4"]){
        angles.value = 1.79 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 36*3"]){
        angles.value = 1.65 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 36*4"]){
        angles.value = 2.16 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 36*5"]){
        angles.value = 2.65 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 40*3"]){
        angles.value = 1.85 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 40*4"]){
        angles.value = 2.42 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 40*5"]){
        angles.value = 2.98 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 45*3"]){
        angles.value = 2.09 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 45*4"]){
        angles.value = 2.74 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 45*5"]){
        angles.value = 3.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 45*6"]){
        angles.value = 3.98 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 50*3"]){
        angles.value = 2.33 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 50*4"]){
        angles.value = 3.06 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 50*5"]){
        angles.value = 3.77 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 50*6"]){
        angles.value = 4.46 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 56*3"]){
        angles.value = 2.62 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 56*4"]){
        angles.value = 3.45 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 56*5"]){
        angles.value = 4.25 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 56*8"]){
        angles.value = 6.57 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 63*4"]){
        angles.value = 3.91 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 63*5"]){
        angles.value = 4.82 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 63*6"]){
        angles.value = 5.72 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 63*8"]){
        angles.value = 7.47 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 63*10"]){
        angles.value = 9.15 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 70*4"]){
        angles.value = 4.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 70*5"]){
        angles.value = 5.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 70*6"]){
        angles.value = 6.41 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 70*7"]){
        angles.value = 7.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 70*8"]){
        angles.value = 8.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 75*5"]){
        angles.value = 5.82 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 75*6"]){
        angles.value = 6.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 75*7"]){
        angles.value = 7.98 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 75*8"]){
        angles.value = 9.03 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 75*10"]){
        angles.value = 11.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 80*5"]){
        angles.value = 6.21 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 80*6"]){
        angles.value = 7.38 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 80*7"]){
        angles.value = 8.52 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 80*8"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 80*10"]){
        angles.value = 11.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 90*6"]){
        angles.value = 8.35 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 90*7"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 90*8"]){
        angles.value = 10.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 90*10"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 90*12"]){
        angles.value = 15.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 100*6"]){
        angles.value = 9.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 100*7"]){
        angles.value = 10.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 100*8"]){
        angles.value = 12.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 100*10"]){
        angles.value = 15.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 100*12"]){
        angles.value = 17.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 100*14"]){
        angles.value = 20.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 100*16"]){
        angles.value = 23.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 110*7"]){
        angles.value = 11.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 110*8"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 110*10"]){
        angles.value = 16.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 110*12"]){
        angles.value = 19.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 110*14"]){
        angles.value = 22.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 125*8"]){
        angles.value = 15.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 125*10"]){
        angles.value = 19.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 125*12"]){
        angles.value = 22.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 125*14"]){
        angles.value = 26.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 140*10"]){
        angles.value = 21.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 140*12"]){
        angles.value = 25.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 140*14"]){
        angles.value = 29.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 140*16"]){
        angles.value = 33.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 160*10"]){
        angles.value = 24.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 160*12"]){
        angles.value = 29.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 160*14"]){
        angles.value = 34 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 160*16"]){
        angles.value = 38.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 180*12"]){
        angles.value = 33.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 180*14"]){
        angles.value = 38.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 180*16"]){
        angles.value = 43.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 180*18"]){
        angles.value = 48.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 200*14"]){
        angles.value = 42.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 200*16"]){
        angles.value = 48.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 200*18"]){
        angles.value = 54.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 200*20"]){
        angles.value = 60.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd9.textField.text isEqualToString:@"L 200*24"]){
        angles.value = 71.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 25*10*3"]){
        angles.value = 0.91 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 25*10*4"]){
        angles.value = 1.18 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 32*20*3"]){
        angles.value = 1.17 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 32*20*4"]){
        angles.value = 1.52 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 40*25*3"]){
        angles.value = 1.48 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 40*25*4"]){
        angles.value = 1.94 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 45*28*3"]){
        angles.value = 1.69 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 45*28*4"]){
        angles.value = 2.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 50*32*3"]){
        angles.value = 1.91 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 50*32*4"]){
        angles.value = 2.49 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 56*36*3"]){
        angles.value = 2.15 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 56*36*4"]){
        angles.value = 2.82 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 56*36*5"]){
        angles.value = 3.47 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*4"]){
        angles.value = 3.18 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*5"]){
        angles.value = 3.92 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*6"]){
        angles.value = 4.64 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*7"]){
        angles.value = 5.34 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*4"]){
        angles.value = 3.57 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*5"]){
        angles.value = 4.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*6"]){
        angles.value = 5.22 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*7"]){
        angles.value = 6.01 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*5"]){
        angles.value = 4.81 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*6"]){
        angles.value = 5.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*8"]){
        angles.value = 7.43 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*10"]){
        angles.value = 9.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*5"]){
        angles.value = 5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*6"]){
        angles.value = 5.93 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*7"]){
        angles.value = 6.85 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*8"]){
        angles.value = 7.74 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*5"]){
        angles.value = 5.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*6"]){
        angles.value = 6.72 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*7"]){
        angles.value = 7.76 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*8"]){
        angles.value = 8.78 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*6"]){
        angles.value = 7.55 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*7"]){
        angles.value = 8.72 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*8"]){
        angles.value = 9.88 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*10"]){
        angles.value = 12.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*6"]){
        angles.value = 8.35 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*7"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*8"]){
        angles.value = 10.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*10"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*6"]){
        angles.value = 8.35 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*7"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*8"]){
        angles.value = 10.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*10"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*7"]){
        angles.value = 11.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*8"]){
        angles.value = 12.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*10"]){
        angles.value = 15.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*12"]){
        angles.value = 18.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*8"]){
        angles.value = 14.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*10"]){
        angles.value = 17.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*12"]){
        angles.value = 20.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*14"]){
        angles.value = 23.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*10"]){
        angles.value = 19.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*12"]){
        angles.value = 23.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*14"]){
        angles.value = 27.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*16"]){
        angles.value = 30.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*10"]){
        angles.value = 22.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*12"]){
        angles.value = 26.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*14"]){
        angles.value = 30.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*16"]){
        angles.value = 34.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*12"]){
        angles.value = 29.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*14"]){
        angles.value = 34.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*16"]){
        angles.value = 39 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*18"]){
        angles.value = 43.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else{
        angles.value = (0.00785 * anglethick.value * (angleside1.value + angleside2.value - anglethick.value)) * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
    }
}
-(void)csteelcaculate
{
    if ([dd5.textField.text isEqualToString:@""]) {
        csteel.value = (0.00785 * csteelthick.value * (csteelh.value + 2 * csteelb.value + 2 * csteelc.value)) * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else{
        
        if ([dd5.textField.text isEqualToString:@"C120*50*20*3.0"]){
            csteel.value = 5.57 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C140*50*20*2.0"]){
            csteel.value = 4.14 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C140*50*20*2.5"]){
            csteel.value = 5.09 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C160*60*20*2.0"]){
            csteel.value = 4.76 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C160*60*20*2.2"]){
            csteel.value = 5.21 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C160*60*20*2.5"]){
            csteel.value = 5.87 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C160*60*20*3.0"]){
            csteel.value = 6.98 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C180*70*20*2.0"]){
            csteel.value = 5.39 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C180*70*20*2.2"]){
            csteel.value = 5.9 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C180*70*20*2.5"]){
            csteel.value = 6.66 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C180*70*20*3"]){
            csteel.value = 7.92 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C200*70*20*2.0"]){
            csteel.value = 5.71 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C200*70*20*2.2"]){
            csteel.value = 6.25 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C200*70*20*2.5"]){
            csteel.value = 7.05 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C200*70*20*3.0"]){
            csteel.value = 8.4 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C220*75*20*2.0"]){
            csteel.value = 6.18 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C220*75*20*2.2"]){
            csteel.value = 6.77 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C220*75*20*2.5"]){
            csteel.value = 7.64 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C220*75*20*3.0"]){
            csteel.value = 8.86 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C250*75*20*2.0"]){
            csteel.value = 6.62 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C250*75*20*2.2"]){
            csteel.value = 7.27 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }else if([dd5.textField.text isEqualToString:@"C250*75*20*2.5"]){
            csteel.value = 8.23 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
            
        }
    }
}

-(void)zsteelcaculate
{
    if ([dd8.textField.text isEqualToString:@"Z140*50*20*2.0"]){
        zsteel.value = 4.233 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z140*50*20*2.2"]){
        zsteel.value = 4.638 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z140*50*20*2.5"]){
        zsteel.value = 5.24 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z160*60*20*2.0"]){
        zsteel.value = 4.861 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z160*60*20*2.2"]){
        zsteel.value = 5.329 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z160*60*20*2.5"]){
        zsteel.value = 6.025 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z180*70*20*2.0"]){
        zsteel.value = 5.489 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z180*70*20*2.2"]){
        zsteel.value = 6.02 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z180*70*20*2.5"]){
        zsteel.value = 6.81 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z200*70*20*2.0"]){
        zsteel.value = 5.803 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z200*70*20*2.2"]){
        zsteel.value = 6.305 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z200*70*20*2.5"]){
        zsteel.value = 7.203 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z220*75*20*2.0"]){
        zsteel.value = 6.274 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z220*75*20*2.2"]){
        zsteel.value = 6.884 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z220*75*20*2.5"]){
        zsteel.value = 7.792 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z250*75*20*2.0"]){
        zsteel.value = 6.745 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z250*75*20*2.2"]){
        zsteel.value = 7.402 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd8.textField.text isEqualToString:@"Z250*75*20*2.5"]){
        zsteel.value = 8.28 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else{
        zsteel.value = (0.00785 * zsteelthick.value * (zsteelh.value + 2 * zsteelb.value + 2 * zsteelc.value)) * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
    }
    
}

-(void)girdercaculate
{
    if ([dd6.textField.text isEqualToString:@"工10"]){
        girder.value = 11.2 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工12.6"]){
        girder.value = 14.2 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工14"]){
        girder.value = 16.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工16"]){
        girder.value = 20.5 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工18"]){
        girder.value = 24.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工20a"]){
        girder.value = 27.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工20b"]){
        girder.value = 31.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工22a"]){
        girder.value = 33 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工22b"]){
        girder.value = 36.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工25a"]){
        girder.value = 38.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工25b"]){
        girder.value = 42 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工28a"]){
        girder.value = 43.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工28b"]){
        girder.value = 47.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工32a"]){
        girder.value = 52.7 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工32b"]){
        girder.value = 57.7 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工32c"]){
        girder.value = 62.8 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工36a"]){
        girder.value = 59.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工36b"]){
        girder.value = 65.6 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工36c"]){
        girder.value = 71.2 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工40a"]){
        girder.value = 67.6 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工40b"]){
        girder.value = 73.8 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工40c"]){
        girder.value = 80.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工45a"]){
        girder.value = 80.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工45b"]){
        girder.value = 87.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工45c"]){
        girder.value = 94.5 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工50a"]){
        girder.value = 93.6 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工50b"]){
        girder.value = 101 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工50c"]){
        girder.value = 109 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工56a"]){
        girder.value = 106 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工56b"]){
        girder.value = 115 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工56c"]){
        girder.value = 124 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工63a"]){
        girder.value = 122 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工63b"]){
        girder.value = 131 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd6.textField.text isEqualToString:@"工63c"]){
        girder.value = 141 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    }
}
-(void)channelcaculate
{
    if ([dd7.textField.text isEqualToString:@"〔5"]){
        channel.value = 5.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔6.3"]){
        channel.value = 6.6 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔8"]){
        channel.value = 8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔10"]){
        channel.value = 10 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔12.6"]){
        channel.value = 12.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔14a"]){
        channel.value = 14.5 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔14b"]){
        channel.value = 16.7 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔16a"]){
        channel.value = 17.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔16b"]){
        channel.value = 19.7 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔18a"]){
        channel.value = 20.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔18b"]){
        channel.value = 23 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔20a"]){
        channel.value = 22.6 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔20b"]){
        channel.value = 25.8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔22a"]){
        channel.value = 25 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔22b"]){
        channel.value = 28.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔25a"]){
        channel.value = 27.5 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔25b"]){
        channel.value = 31.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔25c"]){
        channel.value = 35.3 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔28a"]){
        channel.value = 31.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔28b"]){
        channel.value = 35.8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔28c"]){
        channel.value = 40.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔32a"]){
        channel.value = 38.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔32b"]){
        channel.value = 43.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔32c"]){
        channel.value = 48.3 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔36a"]){
        channel.value = 47.8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔36b"]){
        channel.value = 53.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔36c"]){
        channel.value = 59.1 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔40a"]){
        channel.value = 58.9 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔40b"]){
        channel.value = 65.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd7.textField.text isEqualToString:@"〔40c"]){
        channel.value = 71.5 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
    }
}

-(void) circleselect
{
    
    if ([dd4.textField.text isEqualToString:@"Ф5.5"]){
        circlesteelkg.value = 0.186;
        
    }else if([dd4.textField.text isEqualToString:@"Ф6"]){
        circlesteelkg.value = 0.222;
        
    }else if([dd4.textField.text isEqualToString:@"Ф6.5"]){
        circlesteelkg.value = 0.26;
        
    }else if([dd4.textField.text isEqualToString:@"Ф7"]){
        circlesteelkg.value = 0.302;
        
    }else if([dd4.textField.text isEqualToString:@"Ф8"]){
        circlesteelkg.value = 0.395;
        
    }else if([dd4.textField.text isEqualToString:@"Ф9"]){
        circlesteelkg.value = 0.499;
        
    }else if([dd4.textField.text isEqualToString:@"Ф10"]){
        circlesteelkg.value = 0.617;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф11"]){
        circlesteelkg.value = 0.746;
        
    }else if([dd4.textField.text isEqualToString:@"Ф12"]){
        circlesteelkg.value = 0.888;
        
    }else if([dd4.textField.text isEqualToString:@"Ф13"]){
        circlesteelkg.value = 1.04;
        
    }else if([dd4.textField.text isEqualToString:@"Ф14"]){
        circlesteelkg.value = 1.21;
        
    }else if([dd4.textField.text isEqualToString:@"Ф15"]){
        circlesteelkg.value = 1.39;
        
    }else if([dd4.textField.text isEqualToString:@"Ф16"]){
        circlesteelkg.value = 1.58;
        
    }else if([dd4.textField.text isEqualToString:@"Ф17"]){
        circlesteelkg.value = 1.78;
        
    }else if([dd4.textField.text isEqualToString:@"Ф18"]){
        circlesteelkg.value = 2;
        
    }else if([dd4.textField.text isEqualToString:@"Ф19"]){
        circlesteelkg.value = 2.23;
        
    }else if([dd4.textField.text isEqualToString:@"Ф20"]){
        circlesteelkg.value = 2.47;
        
    }else if([dd4.textField.text isEqualToString:@"Ф21"]){
        circlesteelkg.value = 2.72;
        
    }else if([dd4.textField.text isEqualToString:@"Ф22"]){
        circlesteelkg.value = 2.98;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф23"]){
        circlesteelkg.value = 3.26;
        
    }else if([dd4.textField.text isEqualToString:@"Ф24"]){
        circlesteelkg.value = 3.55;
        
    }else if([dd4.textField.text isEqualToString:@"Ф25"]){
        circlesteelkg.value = 3.85;
        
    }else if([dd4.textField.text isEqualToString:@"Ф26"]){
        circlesteelkg.value = 4.17;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф27"]){
        circlesteelkg.value = 4.49;
        
    }else if([dd4.textField.text isEqualToString:@"Ф28"]){
        circlesteelkg.value = 4.83;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф29"]){
        circlesteelkg.value = 5.18;
        
    }else if([dd4.textField.text isEqualToString:@"Ф30"]){
        circlesteelkg.value = 5.55;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф31"]){
        circlesteelkg.value = 5.92;
        
    }else if([dd4.textField.text isEqualToString:@"Ф32"]){
        circlesteelkg.value = 6.31;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф33"]){
        circlesteelkg.value = 6.71;
        
    }else if([dd4.textField.text isEqualToString:@"Ф34"]){
        circlesteelkg.value = 7.13;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф35"]){
        circlesteelkg.value = 7.55;
        
    }else if([dd4.textField.text isEqualToString:@"Ф36"]){
        circlesteelkg.value = 7.99;
        
    }else if([dd4.textField.text isEqualToString:@"Ф38"]){
        circlesteelkg.value = 8.9;
        
    }else if([dd4.textField.text isEqualToString:@"Ф40"]){
        circlesteelkg.value = 9.86;
        
    }else if([dd4.textField.text isEqualToString:@"Ф42"]){
        circlesteelkg.value = 10.9;
        
    }else if([dd4.textField.text isEqualToString:@"Ф45"]){
        circlesteelkg.value = 12.5;
        
    }else if([dd4.textField.text isEqualToString:@"Ф48"]){
        circlesteelkg.value = 14.2;
        
    }else if([dd4.textField.text isEqualToString:@"Ф50"]){
        circlesteelkg.value = 15.4;
        
    }else if([dd4.textField.text isEqualToString:@"Ф53"]){
        circlesteelkg.value = 17.3;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф55"]){
        circlesteelkg.value = 18.6;
        
    }else if([dd4.textField.text isEqualToString:@"Ф56"]){
        circlesteelkg.value = 19.3;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф58"]){
        circlesteelkg.value = 20.7;
        
    }else if([dd4.textField.text isEqualToString:@"Ф60"]){
        circlesteelkg.value = 22.2;
        
    }else if([dd4.textField.text isEqualToString:@"Ф63"]){
        circlesteelkg.value = 24.5;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф65"]){
        circlesteelkg.value = 26;
        
    }else if([dd4.textField.text isEqualToString:@"*Ф68"]){
        circlesteelkg.value = 28.5;
        
    }else if([dd4.textField.text isEqualToString:@"Ф70"]){
        circlesteelkg.value = 30.2;
        
    }else if([dd4.textField.text isEqualToString:@"Ф75"]){
        circlesteelkg.value = 34.7;
        
    }else if([dd4.textField.text isEqualToString:@"Ф80"]){
        circlesteelkg.value = 39.5;
        
    }else if([dd4.textField.text isEqualToString:@"Ф85"]){
        circlesteelkg.value = 44.5;
        
    }else if([dd4.textField.text isEqualToString:@"Ф90"]){
        circlesteelkg.value = 49.9;
        
    }else if([dd4.textField.text isEqualToString:@"Ф95"]){
        circlesteelkg.value = 55.6;
        
    }else if([dd4.textField.text isEqualToString:@"Ф100"]){
        circlesteelkg.value = 61.7;
        
    }else if([dd4.textField.text isEqualToString:@"Ф105"]){
        circlesteelkg.value = 68;
        
    }else if([dd4.textField.text isEqualToString:@"Ф110"]){
        circlesteelkg.value = 74.6;
        
    }else if([dd4.textField.text isEqualToString:@"Ф115"]){
        circlesteelkg.value = 81.5;
        
    }else if([dd4.textField.text isEqualToString:@"Ф120"]){
        circlesteelkg.value = 88.8;
        
    }else if([dd4.textField.text isEqualToString:@"Ф125"]){
        circlesteelkg.value = 96.3;
        
    }else if([dd4.textField.text isEqualToString:@"Ф130"]){
        circlesteelkg.value = 104;
        
    }else if([dd4.textField.text isEqualToString:@"Ф140"]){
        circlesteelkg.value = 121;
        
    }else if([dd4.textField.text isEqualToString:@"Ф150"]){
        circlesteelkg.value = 139;
        
    }else if([dd4.textField.text isEqualToString:@"Ф160"]){
        circlesteelkg.value = 158;
        
    }else if([dd4.textField.text isEqualToString:@"Ф170"]){
        circlesteelkg.value = 178;
        
    }else if([dd4.textField.text isEqualToString:@"Ф180"]){
        circlesteelkg.value = 200;
        
    }else if([dd4.textField.text isEqualToString:@"Ф190"]){
        circlesteelkg.value = 223;
        
    }else if([dd4.textField.text isEqualToString:@"Ф200"]){
        circlesteelkg.value = 247;
        
    }else if([dd4.textField.text isEqualToString:@"Ф220"]){
        circlesteelkg.value = 298;
        
    }else if([dd4.textField.text isEqualToString:@"Ф250"]){
        circlesteelkg.value = 385;
    }
}
-(void)hsteelsymmetryselect
{
    
    if ([dd1.textField.text isEqualToString:@"HW 100*100*6*8"]){
        hsteelsymmetrykg.value = 17.2;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 125*125*6.5*9"]){
        hsteelsymmetrykg.value = 23.8;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 150*150*7*10"]){
        hsteelsymmetrykg.value = 31.9;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 175*175*7.5*11"]){
        hsteelsymmetrykg.value = 40.3;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 200*200*8*12"]){
        hsteelsymmetrykg.value = 50.5;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #200*204*12*12"]){
        hsteelsymmetrykg.value = 56.7;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 250*250*9*14"]){
        hsteelsymmetrykg.value = 72.4;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #250*255*14*14"]){
        hsteelsymmetrykg.value = 82.2;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #294*302*12*12"]){
        hsteelsymmetrykg.value = 85;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 300*300*10*15"]){
        hsteelsymmetrykg.value = 94.5;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 300*305*15*15"]){
        hsteelsymmetrykg.value = 106;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #344*348*10*16"]){
        hsteelsymmetrykg.value = 115;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 350*350*12*19"]){
        hsteelsymmetrykg.value = 137;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #388*402*15*15"]){
        hsteelsymmetrykg.value = 141;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #394*398*11*18"]){
        hsteelsymmetrykg.value = 147;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 400*400*13*21"]){
        hsteelsymmetrykg.value = 172;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #400*408*21*21"]){
        hsteelsymmetrykg.value = 197;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 414*405*18*28"]){
        hsteelsymmetrykg.value = 233;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #428*407*20*35"]){
        hsteelsymmetrykg.value = 284;
        
    }else if ([dd1.textField.text isEqualToString:@"HW #458*417*30*50"]){
        hsteelsymmetrykg.value = 415;
        
    }else if ([dd1.textField.text isEqualToString:@"HW 498*432*45*70"]){
        hsteelsymmetrykg.value = 605;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 148*100*6*9"]){
        hsteelsymmetrykg.value = 21.4;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 194*150*6*9"]){
        hsteelsymmetrykg.value = 31.2;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 244*175*7*11"]){
        hsteelsymmetrykg.value = 44.1;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 294*200*8*12"]){
        hsteelsymmetrykg.value = 57.3;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 340*250*9*14"]){
        hsteelsymmetrykg.value = 79.7;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 390*300*10*16"]){
        hsteelsymmetrykg.value = 107;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 440*300*11*18"]){
        hsteelsymmetrykg.value = 124;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 482*300*11*15"]){
        hsteelsymmetrykg.value = 115;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 488*300*11*18"]){
        hsteelsymmetrykg.value = 129;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 582*300*12*17"]){
        hsteelsymmetrykg.value = 137;
        
    }else if ([dd1.textField.text isEqualToString:@"HM 588*300*12*20"]){
        hsteelsymmetrykg.value = 151;
        
    }else if ([dd1.textField.text isEqualToString:@"HM #594*302*14*23"]){
        hsteelsymmetrykg.value = 175;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 100*50*5*7"]){
        hsteelsymmetrykg.value = 9.45;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 125*60*6*8"]){
        hsteelsymmetrykg.value = 13.3;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 150*75*5*7"]){
        hsteelsymmetrykg.value = 14.3;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 175*90*5*8"]){
        hsteelsymmetrykg.value = 18.2;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 198*99*4.5*7"]){
        hsteelsymmetrykg.value = 18.5;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 200*100*5.5*8"]){
        hsteelsymmetrykg.value = 21.7;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 248*124*5*8"]){
        hsteelsymmetrykg.value = 25.8;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 250*125*6*9"]){
        hsteelsymmetrykg.value = 29.7;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 298*149*5.5*8"]){
        hsteelsymmetrykg.value = 32.6;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 300*150*6.5*9"]){
        hsteelsymmetrykg.value = 37.3;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 347*174*6*9"]){
        hsteelsymmetrykg.value = 41.8;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 350*175*7*11"]){
        hsteelsymmetrykg.value = 50;
        
    }else if ([dd1.textField.text isEqualToString:@"HN #400*150*8*13"]){
        hsteelsymmetrykg.value = 55.8;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 396*199*7*11"]){
        hsteelsymmetrykg.value = 56.7;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 400*200*8*13"]){
        hsteelsymmetrykg.value = 66;
        
    }else if ([dd1.textField.text isEqualToString:@"HN #450*150*9*14"]){
        hsteelsymmetrykg.value = 66.5;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 446*199*8*12"]){
        hsteelsymmetrykg.value = 66.7;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 450*200*9*14"]){
        hsteelsymmetrykg.value = 76.5;
        
    }else if ([dd1.textField.text isEqualToString:@"HN #500*150*10*16"]){
        hsteelsymmetrykg.value = 77.1;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 496*199*9*14"]){
        hsteelsymmetrykg.value = 79.5;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 500*200*10*16"]){
        hsteelsymmetrykg.value = 89.6;
        
    }else if ([dd1.textField.text isEqualToString:@"HN #506*201*11*19"]){
        hsteelsymmetrykg.value = 103;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 596*199*10*15"]){
        hsteelsymmetrykg.value = 95.1;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 600*200*11*17"]){
        hsteelsymmetrykg.value = 106;
        
    }else if ([dd1.textField.text isEqualToString:@"HN #606*201*12*20"]){
        hsteelsymmetrykg.value = 120;
        
    }else if ([dd1.textField.text isEqualToString:@"HN #692*300*13*20"]){
        hsteelsymmetrykg.value = 166;
        
    }else if ([dd1.textField.text isEqualToString:@"HN 700*300*13*24"]){
        hsteelsymmetrykg.value = 185;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 200*204*12*12"]){
        hsteelsymmetrykg.value = 56.7;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 244*252*11*11"]){
        hsteelsymmetrykg.value = 64.4;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 250*255*14*14"]){
        hsteelsymmetrykg.value = 82.2;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 294*302*12*12"]){
        hsteelsymmetrykg.value = 85;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 300*300*10*15"]){
        hsteelsymmetrykg.value = 94.5;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 300*305*15*15"]){
        hsteelsymmetrykg.value = 106;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 338*351*13*13"]){
        hsteelsymmetrykg.value = 106;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 344*354*16*16"]){
        hsteelsymmetrykg.value = 131;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 350*350*12*19"]){
        hsteelsymmetrykg.value = 137;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 350*357*19*19"]){
        hsteelsymmetrykg.value = 156;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 388*402*15*15"]){
        hsteelsymmetrykg.value = 141;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 394*405*18*18"]){
        hsteelsymmetrykg.value = 169;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 400*400*13*21"]){
        hsteelsymmetrykg.value = 172;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 400*408*21*21"]){
        hsteelsymmetrykg.value = 197;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 414*405*18*28"]){
        hsteelsymmetrykg.value = 233;
        
    }else if ([dd1.textField.text isEqualToString:@"HP 428*407*20*35"]){
        hsteelsymmetrykg.value = 284;
    }
    
}

-(void)rectanglepipeselect
{
    
    if ([dd2.textField.text isEqualToString:@"25*1.20"]){
        rectanglepipekg.value = 0.9;
        
    }else if([dd2.textField.text isEqualToString:@"25*1.50"]){
        rectanglepipekg.value = 1.11;
        
    }else if([dd2.textField.text isEqualToString:@"25*1.75"]){
        rectanglepipekg.value = 1.28;
        
    }else if([dd2.textField.text isEqualToString:@"25*2.00"]){
        rectanglepipekg.value = 1.44;
        
    }else if([dd2.textField.text isEqualToString:@"30*2.50"]){
        rectanglepipekg.value = 2.16;
        
    }else if([dd2.textField.text isEqualToString:@"30*3.00"]){
        rectanglepipekg.value = 2.54;
        
    }else if([dd2.textField.text isEqualToString:@"40*2.50"]){
        rectanglepipekg.value = 2.94;
        
    }else if([dd2.textField.text isEqualToString:@"40*3.00"]){
        rectanglepipekg.value = 3.49;
        
    }else if([dd2.textField.text isEqualToString:@"40*4.00"]){
        rectanglepipekg.value = 4.52;
        
    }else if([dd2.textField.text isEqualToString:@"50*2.50"]){
        rectanglepipekg.value = 3.73;
        
    }else if([dd2.textField.text isEqualToString:@"50*3.00"]){
        rectanglepipekg.value = 4.43;
        
    }else if([dd2.textField.text isEqualToString:@"50*4.00"]){
        rectanglepipekg.value = 5.78;
        
    }else if([dd2.textField.text isEqualToString:@"60*2.50"]){
        rectanglepipekg.value = 4.51;
        
    }else if([dd2.textField.text isEqualToString:@"60*3.00"]){
        rectanglepipekg.value = 5.37;
        
    }else if([dd2.textField.text isEqualToString:@"60*4.00"]){
        rectanglepipekg.value = 7.03;
        
    }else if([dd2.textField.text isEqualToString:@"60*5.00"]){
        rectanglepipekg.value = 8.64;
        
    }else if([dd2.textField.text isEqualToString:@"70*3.00"]){
        rectanglepipekg.value = 6.31;
        
    }else if([dd2.textField.text isEqualToString:@"70*4.00"]){
        rectanglepipekg.value = 8.29;
        
    }else if([dd2.textField.text isEqualToString:@"70*5.00"]){
        rectanglepipekg.value = 10.21;
        
    }else if([dd2.textField.text isEqualToString:@"80*3.00"]){
        rectanglepipekg.value = 7.25;
        
    }else if([dd2.textField.text isEqualToString:@"80*4.00"]){
        rectanglepipekg.value = 9.55;
        
    }else if([dd2.textField.text isEqualToString:@"80*5.00"]){
        rectanglepipekg.value = 11.78;
        
    }else if([dd2.textField.text isEqualToString:@"90*3.00"]){
        rectanglepipekg.value = 8.2;
        
    }else if([dd2.textField.text isEqualToString:@"90*4.00"]){
        rectanglepipekg.value = 10.8;
        
    }else if([dd2.textField.text isEqualToString:@"90*5.00"]){
        rectanglepipekg.value = 13.35;
        
    }else if([dd2.textField.text isEqualToString:@"90*6.00"]){
        rectanglepipekg.value = 15.83;
        
    }else if([dd2.textField.text isEqualToString:@"100*4.00"]){
        rectanglepipekg.value = 12.06;
        
    }else if([dd2.textField.text isEqualToString:@"100*5.00"]){
        rectanglepipekg.value = 14.92;
        
    }else if([dd2.textField.text isEqualToString:@"100*6.00"]){
        rectanglepipekg.value = 17.71;
        
    }else if([dd2.textField.text isEqualToString:@"120*4.00"]){
        rectanglepipekg.value = 14.57;
        
    }else if([dd2.textField.text isEqualToString:@"120*5.00"]){
        rectanglepipekg.value = 18.05;
        
    }else if([dd2.textField.text isEqualToString:@"120*6.00"]){
        rectanglepipekg.value = 21.48;
        
    }else if([dd2.textField.text isEqualToString:@"120*8.00"]){
        rectanglepipekg.value = 28.13;
        
    }else if([dd2.textField.text isEqualToString:@"140*4.00"]){
        rectanglepipekg.value = 17.08;
        
    }else if([dd2.textField.text isEqualToString:@"140*5.00"]){
        rectanglepipekg.value = 21.2;
        
    }else if([dd2.textField.text isEqualToString:@"140*6.00"]){
        rectanglepipekg.value = 25.25;
        
    }else if([dd2.textField.text isEqualToString:@"140*8.00"]){
        rectanglepipekg.value = 33.16;
        
    }else if([dd2.textField.text isEqualToString:@"160*4.00"]){
        rectanglepipekg.value = 19.59;
        
    }else if([dd2.textField.text isEqualToString:@"160*5.00"]){
        rectanglepipekg.value = 24.34;
        
    }else if([dd2.textField.text isEqualToString:@"160*6.00"]){
        rectanglepipekg.value = 29.01;
        
    }else if([dd2.textField.text isEqualToString:@"160*8.00"]){
        rectanglepipekg.value = 38.18;
        
    }else if([dd3.textField.text isEqualToString:@"50*25*1.20"]){
        rectanglepipekg.value = 1.37;
        
    }else if([dd3.textField.text isEqualToString:@"50*25*1.20"]){
        rectanglepipekg.value = 1.37;
        
    }else if([dd3.textField.text isEqualToString:@"50*25*1.50"]){
        rectanglepipekg.value = 1.7;
        
    }else if([dd3.textField.text isEqualToString:@"50*30*2.50"]){
        rectanglepipekg.value = 2.94;
        
    }else if([dd3.textField.text isEqualToString:@"50*30*3.00"]){
        rectanglepipekg.value = 3.49;
        
    }else if([dd3.textField.text isEqualToString:@"50*30*4.00"]){
        rectanglepipekg.value = 4.52;
        
    }else if([dd3.textField.text isEqualToString:@"60*30*2.50"]){
        rectanglepipekg.value = 3.34;
        
    }else if([dd3.textField.text isEqualToString:@"60*30*3.00"]){
        rectanglepipekg.value = 3.96;
        
    }else if([dd3.textField.text isEqualToString:@"60*30*4.00"]){
        rectanglepipekg.value = 5.15;
        
    }else if([dd3.textField.text isEqualToString:@"60*40*2.50"]){
        rectanglepipekg.value = 3.73;
        
    }else if([dd3.textField.text isEqualToString:@"60*40*3.00"]){
        rectanglepipekg.value = 4.43;
        
    }else if([dd3.textField.text isEqualToString:@"60*40*4.00"]){
        rectanglepipekg.value = 5.78;
        
    }else if([dd3.textField.text isEqualToString:@"70*50*3.00"]){
        rectanglepipekg.value = 5.37;
        
    }else if([dd3.textField.text isEqualToString:@"70*50*4.00"]){
        rectanglepipekg.value = 7.03;
        
    }else if([dd3.textField.text isEqualToString:@"70*50*5.00"]){
        rectanglepipekg.value = 8.64;
        
    }else if([dd3.textField.text isEqualToString:@"80*40*2.50"]){
        rectanglepipekg.value = 4.51;
        
    }else if([dd3.textField.text isEqualToString:@"80*40*3.00"]){
        rectanglepipekg.value = 5.37;
        
    }else if([dd3.textField.text isEqualToString:@"80*40*4.00"]){
        rectanglepipekg.value = 7.03;
        
    }else if([dd3.textField.text isEqualToString:@"80*40*5.00"]){
        rectanglepipekg.value = 8.64;
        
    }else if([dd3.textField.text isEqualToString:@"80*60*3.00"]){
        rectanglepipekg.value = 6.31;
        
    }else if([dd3.textField.text isEqualToString:@"80*60*4.00"]){
        rectanglepipekg.value = 8.29;
        
    }else if([dd3.textField.text isEqualToString:@"80*60*5.00"]){
        rectanglepipekg.value = 10.21;
        
    }else if([dd3.textField.text isEqualToString:@"90*40*3.00"]){
        rectanglepipekg.value = 5.84;
        
    }else if([dd3.textField.text isEqualToString:@"90*40*4.00"]){
        rectanglepipekg.value = 7.66;
        
    }else if([dd3.textField.text isEqualToString:@"90*40*5.00"]){
        rectanglepipekg.value = 9.42;
        
    }else if([dd3.textField.text isEqualToString:@"90*50*3.00"]){
        rectanglepipekg.value = 6.31;
        
    }else if([dd3.textField.text isEqualToString:@"90*50*4.00"]){
        rectanglepipekg.value = 8.29;
        
    }else if([dd3.textField.text isEqualToString:@"90*50*5.00"]){
        rectanglepipekg.value = 10.21;
        
    }else if([dd3.textField.text isEqualToString:@"90*60*3.00"]){
        rectanglepipekg.value = 6.78;
        
    }else if([dd3.textField.text isEqualToString:@"90*60*4.00"]){
        rectanglepipekg.value = 8.92;
        
    }else if([dd3.textField.text isEqualToString:@"90*60*5.00"]){
        rectanglepipekg.value = 10.99;
        
    }else if([dd3.textField.text isEqualToString:@"120*60*3.00"]){
        rectanglepipekg.value = 8.2;
        
    }else if([dd3.textField.text isEqualToString:@"120*60*4.00"]){
        rectanglepipekg.value = 10.8;
        
    }else if([dd3.textField.text isEqualToString:@"120*60*5.00"]){
        rectanglepipekg.value = 13.35;
        
    }else if([dd3.textField.text isEqualToString:@"120*60*6.00"]){
        rectanglepipekg.value = 15.83;
        
    }else if([dd3.textField.text isEqualToString:@"120*80*3.00"]){
        rectanglepipekg.value = 9.14;
        
    }else if([dd3.textField.text isEqualToString:@"120*80*4.00"]){
        rectanglepipekg.value = 12.06;
        
    }else if([dd3.textField.text isEqualToString:@"120*80*5.00"]){
        rectanglepipekg.value = 14.92;
        
    }else if([dd3.textField.text isEqualToString:@"120*80*6.00"]){
        rectanglepipekg.value = 17.71;
        
    }else if([dd3.textField.text isEqualToString:@"140*80*4.00"]){
        rectanglepipekg.value = 13.31;
        
    }else if([dd3.textField.text isEqualToString:@"140*80*5.00"]){
        rectanglepipekg.value = 16.48;
        
    }else if([dd3.textField.text isEqualToString:@"140*80*6.00"]){
        rectanglepipekg.value = 19.59;
        
    }else if([dd3.textField.text isEqualToString:@"150*100*4.00"]){
        rectanglepipekg.value = 15.2;
        
    }else if([dd3.textField.text isEqualToString:@"150*100*5.00"]){
        rectanglepipekg.value = 18.84;
        
    }else if([dd3.textField.text isEqualToString:@"150*100*6.00"]){
        rectanglepipekg.value = 22.42;
        
    }else if([dd3.textField.text isEqualToString:@"150*100*8.00"]){
        rectanglepipekg.value = 29.39;
        
    }else if([dd3.textField.text isEqualToString:@"160*80*4.00"]){
        rectanglepipekg.value = 14.57;
        
    }else if([dd3.textField.text isEqualToString:@"160*80*5.00"]){
        rectanglepipekg.value = 18.05;
        
    }else if([dd3.textField.text isEqualToString:@"160*80*6.00"]){
        rectanglepipekg.value = 21.48;
        
    }else if([dd3.textField.text isEqualToString:@"160*80*8.00"]){
        rectanglepipekg.value = 28.13;
        
    }else if([dd3.textField.text isEqualToString:@"180*100*4.00"]){
        rectanglepipekg.value = 17.08;
        
    }else if([dd3.textField.text isEqualToString:@"180*100*5.00"]){
        rectanglepipekg.value = 21.2;
        
    }else if([dd3.textField.text isEqualToString:@"180*100*6.00"]){
        rectanglepipekg.value = 25.25;
        
    }else if([dd3.textField.text isEqualToString:@"180*100*8.00"]){
        rectanglepipekg.value = 33.16;
        
    }else if([dd3.textField.text isEqualToString:@"200*100*4.00"]){
        rectanglepipekg.value = 18.34;
        
    }else if([dd3.textField.text isEqualToString:@"200*100*5.00"]){
        rectanglepipekg.value = 22.77;
        
    }else if([dd3.textField.text isEqualToString:@"200*100*6.00"]){
        rectanglepipekg.value = 27.13;
        
    }else if([dd3.textField.text isEqualToString:@"200*100*8.00"]){
        rectanglepipekg.value = 35.67;
    }
}
-(void)angleselect
{
    
    if ([dd9.textField.text isEqualToString:@"L 20*3"]){
        anglekg.value = 0.89;
        
    }else if([dd9.textField.text isEqualToString:@"L 20*4"]){
        anglekg.value = 1.14;
        
    }else if([dd9.textField.text isEqualToString:@"L 25*3"]){
        anglekg.value = 1.12;
        
    }else if([dd9.textField.text isEqualToString:@"L 25*4"]){
        anglekg.value = 1.46;
        
    }else if([dd9.textField.text isEqualToString:@"L 30*3"]){
        anglekg.value = 1.37;
        
    }else if([dd9.textField.text isEqualToString:@"L 30*4"]){
        anglekg.value = 1.79;
        
    }else if([dd9.textField.text isEqualToString:@"L 36*3"]){
        anglekg.value = 1.65;
        
    }else if([dd9.textField.text isEqualToString:@"L 36*4"]){
        anglekg.value = 2.16;
        
    }else if([dd9.textField.text isEqualToString:@"L 36*5"]){
        anglekg.value = 2.65;
        
    }else if([dd9.textField.text isEqualToString:@"L 40*3"]){
        anglekg.value = 1.85;
        
    }else if([dd9.textField.text isEqualToString:@"L 40*4"]){
        anglekg.value = 2.42;
        
    }else if([dd9.textField.text isEqualToString:@"L 40*5"]){
        anglekg.value = 2.98;
        
    }else if([dd9.textField.text isEqualToString:@"L 45*3"]){
        anglekg.value = 2.09;
        
    }else if([dd9.textField.text isEqualToString:@"L 45*4"]){
        anglekg.value = 2.74;
        
    }else if([dd9.textField.text isEqualToString:@"L 45*5"]){
        anglekg.value = 3.37;
        
    }else if([dd9.textField.text isEqualToString:@"L 45*6"]){
        anglekg.value = 3.98;
        
    }else if([dd9.textField.text isEqualToString:@"L 50*3"]){
        anglekg.value = 2.33;
        
    }else if([dd9.textField.text isEqualToString:@"L 50*4"]){
        anglekg.value = 3.06;
        
    }else if([dd9.textField.text isEqualToString:@"L 50*5"]){
        anglekg.value = 3.77;
        
    }else if([dd9.textField.text isEqualToString:@"L 50*6"]){
        anglekg.value = 4.46;
        
    }else if([dd9.textField.text isEqualToString:@"L 56*3"]){
        anglekg.value = 2.62;
        
    }else if([dd9.textField.text isEqualToString:@"L 56*4"]){
        anglekg.value = 3.45;
        
    }else if([dd9.textField.text isEqualToString:@"L 56*5"]){
        anglekg.value = 4.25;
        
    }else if([dd9.textField.text isEqualToString:@"L 56*8"]){
        anglekg.value = 6.57;
        
    }else if([dd9.textField.text isEqualToString:@"L 63*4"]){
        anglekg.value = 3.91;
        
    }else if([dd9.textField.text isEqualToString:@"L 63*5"]){
        anglekg.value = 4.82;
        
    }else if([dd9.textField.text isEqualToString:@"L 63*6"]){
        anglekg.value = 5.72;
        
    }else if([dd9.textField.text isEqualToString:@"L 63*8"]){
        anglekg.value = 7.47;
        
    }else if([dd9.textField.text isEqualToString:@"L 63*10"]){
        anglekg.value = 9.15;
        
    }else if([dd9.textField.text isEqualToString:@"L 70*4"]){
        anglekg.value = 4.37;
        
    }else if([dd9.textField.text isEqualToString:@"L 70*5"]){
        anglekg.value = 5.4;
        
    }else if([dd9.textField.text isEqualToString:@"L 70*6"]){
        anglekg.value = 6.41;
        
    }else if([dd9.textField.text isEqualToString:@"L 70*7"]){
        anglekg.value = 7.4;
        
    }else if([dd9.textField.text isEqualToString:@"L 70*8"]){
        anglekg.value = 8.37;
        
    }else if([dd9.textField.text isEqualToString:@"L 75*5"]){
        anglekg.value = 5.82;
        
    }else if([dd9.textField.text isEqualToString:@"L 75*6"]){
        anglekg.value = 6.9;
        
    }else if([dd9.textField.text isEqualToString:@"L 75*7"]){
        anglekg.value = 7.98;
        
    }else if([dd9.textField.text isEqualToString:@"L 75*8"]){
        anglekg.value = 9.03;
        
    }else if([dd9.textField.text isEqualToString:@"L 75*10"]){
        anglekg.value = 11.1;
        
    }else if([dd9.textField.text isEqualToString:@"L 80*5"]){
        anglekg.value = 6.21;
        
    }else if([dd9.textField.text isEqualToString:@"L 80*6"]){
        anglekg.value = 7.38;
        
    }else if([dd9.textField.text isEqualToString:@"L 80*7"]){
        anglekg.value = 8.52;
        
    }else if([dd9.textField.text isEqualToString:@"L 80*8"]){
        anglekg.value = 9.66;
        
    }else if([dd9.textField.text isEqualToString:@"L 80*10"]){
        anglekg.value = 11.9;
        
    }else if([dd9.textField.text isEqualToString:@"L 90*6"]){
        anglekg.value = 8.35;
        
    }else if([dd9.textField.text isEqualToString:@"L 90*7"]){
        anglekg.value = 9.66;
        
    }else if([dd9.textField.text isEqualToString:@"L 90*8"]){
        anglekg.value = 10.9;
        
    }else if([dd9.textField.text isEqualToString:@"L 90*10"]){
        anglekg.value = 13.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 90*12"]){
        anglekg.value = 15.9;
        
    }else if([dd9.textField.text isEqualToString:@"L 100*6"]){
        anglekg.value = 9.37;
        
    }else if([dd9.textField.text isEqualToString:@"L 100*7"]){
        anglekg.value = 10.8;
        
    }else if([dd9.textField.text isEqualToString:@"L 100*8"]){
        anglekg.value = 12.3;
        
    }else if([dd9.textField.text isEqualToString:@"L 100*10"]){
        anglekg.value = 15.1;
        
    }else if([dd9.textField.text isEqualToString:@"L 100*12"]){
        anglekg.value = 17.9;
        
    }else if([dd9.textField.text isEqualToString:@"L 100*14"]){
        anglekg.value = 20.6;
        
    }else if([dd9.textField.text isEqualToString:@"L 100*16"]){
        anglekg.value = 23.3;
        
    }else if([dd9.textField.text isEqualToString:@"L 110*7"]){
        anglekg.value = 11.9;
        
    }else if([dd9.textField.text isEqualToString:@"L 110*8"]){
        anglekg.value = 13.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 110*10"]){
        anglekg.value = 16.7;
        
    }else if([dd9.textField.text isEqualToString:@"L 110*12"]){
        anglekg.value = 19.8;
        
    }else if([dd9.textField.text isEqualToString:@"L 110*14"]){
        anglekg.value = 22.8;
        
    }else if([dd9.textField.text isEqualToString:@"L 125*8"]){
        anglekg.value = 15.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 125*10"]){
        anglekg.value = 19.1;
        
    }else if([dd9.textField.text isEqualToString:@"L 125*12"]){
        anglekg.value = 22.7;
        
    }else if([dd9.textField.text isEqualToString:@"L 125*14"]){
        anglekg.value = 26.2;
        
    }else if([dd9.textField.text isEqualToString:@"L 140*10"]){
        anglekg.value = 21.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 140*12"]){
        anglekg.value = 25.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 140*14"]){
        anglekg.value = 29.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 140*16"]){
        anglekg.value = 33.4;
        
    }else if([dd9.textField.text isEqualToString:@"L 160*10"]){
        anglekg.value = 24.7;
        
    }else if([dd9.textField.text isEqualToString:@"L 160*12"]){
        anglekg.value = 29.4;
        
    }else if([dd9.textField.text isEqualToString:@"L 160*14"]){
        anglekg.value = 34;
        
    }else if([dd9.textField.text isEqualToString:@"L 160*16"]){
        anglekg.value = 38.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 180*12"]){
        anglekg.value = 33.2;
        
    }else if([dd9.textField.text isEqualToString:@"L 180*14"]){
        anglekg.value = 38.4;
        
    }else if([dd9.textField.text isEqualToString:@"L 180*16"]){
        anglekg.value = 43.5;
        
    }else if([dd9.textField.text isEqualToString:@"L 180*18"]){
        anglekg.value = 48.6;
        
    }else if([dd9.textField.text isEqualToString:@"L 200*14"]){
        anglekg.value = 42.9;
        
    }else if([dd9.textField.text isEqualToString:@"L 200*16"]){
        anglekg.value = 48.7;
        
    }else if([dd9.textField.text isEqualToString:@"L 200*18"]){
        anglekg.value = 54.4;
        
    }else if([dd9.textField.text isEqualToString:@"L 200*20"]){
        anglekg.value = 60.1;
        
    }else if([dd9.textField.text isEqualToString:@"L 200*24"]){
        anglekg.value = 71.2;
        
    }else if([dd10.textField.text isEqualToString:@"L 25*10*3"]){
        anglekg.value = 0.91;
        
    }else if([dd10.textField.text isEqualToString:@"L 25*10*4"]){
        anglekg.value = 1.18;
        
    }else if([dd10.textField.text isEqualToString:@"L 32*20*3"]){
        anglekg.value = 1.17;
        
    }else if([dd10.textField.text isEqualToString:@"L 32*20*4"]){
        anglekg.value = 1.52;
        
    }else if([dd10.textField.text isEqualToString:@"L 40*25*3"]){
        anglekg.value = 1.48;
        
    }else if([dd10.textField.text isEqualToString:@"L 40*25*4"]){
        anglekg.value = 1.94;
        
    }else if([dd10.textField.text isEqualToString:@"L 45*28*3"]){
        anglekg.value = 1.69;
        
    }else if([dd10.textField.text isEqualToString:@"L 45*28*4"]){
        anglekg.value = 2.2;
        
    }else if([dd10.textField.text isEqualToString:@"L 50*32*3"]){
        anglekg.value = 1.91;
        
    }else if([dd10.textField.text isEqualToString:@"L 50*32*4"]){
        anglekg.value = 2.49;
        
    }else if([dd10.textField.text isEqualToString:@"L 56*36*3"]){
        anglekg.value = 2.15;
        
    }else if([dd10.textField.text isEqualToString:@"L 56*36*4"]){
        anglekg.value = 2.82;
        
    }else if([dd10.textField.text isEqualToString:@"L 56*36*5"]){
        anglekg.value = 3.47;
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*4"]){
        anglekg.value = 3.18;
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*5"]){
        anglekg.value = 3.92;
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*6"]){
        anglekg.value = 4.64;
        
    }else if([dd10.textField.text isEqualToString:@"L 63*40*7"]){
        anglekg.value = 5.34;
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*4"]){
        anglekg.value = 3.57;
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*5"]){
        anglekg.value = 4.4;
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*6"]){
        anglekg.value = 5.22;
        
    }else if([dd10.textField.text isEqualToString:@"L 70*45*7"]){
        anglekg.value = 6.01;
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*5"]){
        anglekg.value = 4.81;
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*6"]){
        anglekg.value = 5.7;
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*8"]){
        anglekg.value = 7.43;
        
    }else if([dd10.textField.text isEqualToString:@"L 75*50*10"]){
        anglekg.value = 9.1;
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*5"]){
        anglekg.value = 5;
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*6"]){
        anglekg.value = 5.93;
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*7"]){
        anglekg.value = 6.85;
        
    }else if([dd10.textField.text isEqualToString:@"L 80*50*8"]){
        anglekg.value = 7.74;
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*5"]){
        anglekg.value = 5.66;
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*6"]){
        anglekg.value = 6.72;
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*7"]){
        anglekg.value = 7.76;
        
    }else if([dd10.textField.text isEqualToString:@"L 90*56*8"]){
        anglekg.value = 8.78;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*6"]){
        anglekg.value = 7.55;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*7"]){
        anglekg.value = 8.72;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*8"]){
        anglekg.value = 9.88;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*63*10"]){
        anglekg.value = 12.1;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*6"]){
        anglekg.value = 8.35;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*7"]){
        anglekg.value = 9.66;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*8"]){
        anglekg.value = 10.9;
        
    }else if([dd10.textField.text isEqualToString:@"L 100*80*10"]){
        anglekg.value = 13.5;
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*6"]){
        anglekg.value = 8.35;
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*7"]){
        anglekg.value = 9.66;
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*8"]){
        anglekg.value = 10.9;
        
    }else if([dd10.textField.text isEqualToString:@"L 110*70*10"]){
        anglekg.value = 13.5;
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*7"]){
        anglekg.value = 11.1;
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*8"]){
        anglekg.value = 12.6;
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*10"]){
        anglekg.value = 15.5;
        
    }else if([dd10.textField.text isEqualToString:@"L 125*80*12"]){
        anglekg.value = 18.3;
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*8"]){
        anglekg.value = 14.2;
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*10"]){
        anglekg.value = 17.5;
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*12"]){
        anglekg.value = 20.7;
        
    }else if([dd10.textField.text isEqualToString:@"L 140*90*14"]){
        anglekg.value = 23.9;
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*10"]){
        anglekg.value = 19.9;
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*12"]){
        anglekg.value = 23.6;
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*14"]){
        anglekg.value = 27.2;
        
    }else if([dd10.textField.text isEqualToString:@"L 160*100*16"]){
        anglekg.value = 30.8;
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*10"]){
        anglekg.value = 22.3;
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*12"]){
        anglekg.value = 26.5;
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*14"]){
        anglekg.value = 30.6;
        
    }else if([dd10.textField.text isEqualToString:@"L 180*110*16"]){
        anglekg.value = 34.6;
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*12"]){
        anglekg.value = 29.8;
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*14"]){
        anglekg.value = 34.4;
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*16"]){
        anglekg.value = 39;
        
    }else if([dd10.textField.text isEqualToString:@"L 200*125*18"]){
        anglekg.value = 43.6;
    }
}
-(void)csteelselect
{
    
    if ([dd5.textField.text isEqualToString:@"C120*50*20*3.0"]){
        csteelkg.value = 5.57;
        
    }else if([dd5.textField.text isEqualToString:@"C140*50*20*2.0"]){
        csteelkg.value = 4.14;
        
    }else if([dd5.textField.text isEqualToString:@"C140*50*20*2.5"]){
        csteelkg.value = 5.09;
        
    }else if([dd5.textField.text isEqualToString:@"C160*60*20*2.0"]){
        csteelkg.value = 4.76;
        
    }else if([dd5.textField.text isEqualToString:@"C160*60*20*2.2"]){
        csteelkg.value = 5.21;
        
    }else if([dd5.textField.text isEqualToString:@"C160*60*20*2.5"]){
        csteelkg.value = 5.87;
        
    }else if([dd5.textField.text isEqualToString:@"C160*60*20*3.0"]){
        csteelkg.value = 6.98;
        
    }else if([dd5.textField.text isEqualToString:@"C180*70*20*2.0"]){
        csteelkg.value = 5.39;
        
    }else if([dd5.textField.text isEqualToString:@"C180*70*20*2.2"]){
        csteelkg.value = 5.9;
        
    }else if([dd5.textField.text isEqualToString:@"C180*70*20*2.5"]){
        csteelkg.value = 6.66;
        
    }else if([dd5.textField.text isEqualToString:@"C180*70*20*3"]){
        csteelkg.value = 7.92;
        
    }else if([dd5.textField.text isEqualToString:@"C200*70*20*2.0"]){
        csteelkg.value = 5.71;
        
    }else if([dd5.textField.text isEqualToString:@"C200*70*20*2.2"]){
        csteelkg.value = 6.25;
        
    }else if([dd5.textField.text isEqualToString:@"C200*70*20*2.5"]){
        csteelkg.value = 7.05;
        
    }else if([dd5.textField.text isEqualToString:@"C200*70*20*3.0"]){
        csteelkg.value = 8.4;
        
    }else if([dd5.textField.text isEqualToString:@"C220*75*20*2.0"]){
        csteelkg.value = 6.18;
        
    }else if([dd5.textField.text isEqualToString:@"C220*75*20*2.2"]){
        csteelkg.value = 6.77;
        
    }else if([dd5.textField.text isEqualToString:@"C220*75*20*2.5"]){
        csteelkg.value = 7.64;
        
    }else if([dd5.textField.text isEqualToString:@"C220*75*20*3.0"]){
        csteelkg.value = 8.86;
        
    }else if([dd5.textField.text isEqualToString:@"C250*75*20*2.0"]){
        csteelkg.value = 6.62;
        
    }else if([dd5.textField.text isEqualToString:@"C250*75*20*2.2"]){
        csteelkg.value = 7.27;
        
    }else if([dd5.textField.text isEqualToString:@"C250*75*20*2.5"]){
        csteelkg.value = 8.23;
        
    }
}
-(void)zsteelselect
{
    
    if ([dd8.textField.text isEqualToString:@"Z140*50*20*2.0"]){
        zsteelkg.value = 4.233;
        
    }else if([dd8.textField.text isEqualToString:@"Z140*50*20*2.2"]){
        zsteelkg.value = 4.638;
        
    }else if([dd8.textField.text isEqualToString:@"Z140*50*20*2.5"]){
        zsteelkg.value = 5.24;
        
    }else if([dd8.textField.text isEqualToString:@"Z160*60*20*2.0"]){
        zsteelkg.value = 4.861;
        
    }else if([dd8.textField.text isEqualToString:@"Z160*60*20*2.2"]){
        zsteelkg.value = 5.329;
        
    }else if([dd8.textField.text isEqualToString:@"Z160*60*20*2.5"]){
        zsteelkg.value = 6.025;
        
    }else if([dd8.textField.text isEqualToString:@"Z180*70*20*2.0"]){
        zsteelkg.value = 5.489;
        
    }else if([dd8.textField.text isEqualToString:@"Z180*70*20*2.2"]){
        zsteelkg.value = 6.02;
        
    }else if([dd8.textField.text isEqualToString:@"Z180*70*20*2.5"]){
        zsteelkg.value = 6.81;
        
    }else if([dd8.textField.text isEqualToString:@"Z200*70*20*2.0"]){
        zsteelkg.value = 5.803;
        
    }else if([dd8.textField.text isEqualToString:@"Z200*70*20*2.2"]){
        zsteelkg.value = 6.305;
        
    }else if([dd8.textField.text isEqualToString:@"Z200*70*20*2.5"]){
        zsteelkg.value = 7.203;
        
    }else if([dd8.textField.text isEqualToString:@"Z220*75*20*2.0"]){
        zsteelkg.value = 6.274;
        
    }else if([dd8.textField.text isEqualToString:@"Z220*75*20*2.2"]){
        zsteelkg.value = 6.884;
        
    }else if([dd8.textField.text isEqualToString:@"Z220*75*20*2.5"]){
        zsteelkg.value = 7.792;
        
    }else if([dd8.textField.text isEqualToString:@"Z250*75*20*2.0"]){
        zsteelkg.value = 6.745;
        
    }else if([dd8.textField.text isEqualToString:@"Z250*75*20*2.2"]){
        zsteelkg.value = 7.402;
        
    }else if([dd8.textField.text isEqualToString:@"Z250*75*20*2.5"]){
        zsteelkg.value = 8.28;
        
    }
}
-(void)girderselect
{
    if ([dd6.textField.text isEqualToString:@"工10"]){
        girderkg.value = 11.2;
        
    }else if ([dd6.textField.text isEqualToString:@"工12.6"]){
        girderkg.value = 14.2;
        
    }else if ([dd6.textField.text isEqualToString:@"工14"]){
        girderkg.value = 16.9;
        
    }else if ([dd6.textField.text isEqualToString:@"工16"]){
        girderkg.value = 20.5;
        
    }else if ([dd6.textField.text isEqualToString:@"工18"]){
        girderkg.value = 24.1;
        
    }else if ([dd6.textField.text isEqualToString:@"工20a"]){
        girderkg.value = 27.9;
        
    }else if ([dd6.textField.text isEqualToString:@"工20b"]){
        girderkg.value = 31.1;
        
    }else if ([dd6.textField.text isEqualToString:@"工22a"]){
        girderkg.value = 33;
        
    }else if ([dd6.textField.text isEqualToString:@"工22b"]){
        girderkg.value = 36.4;
        
    }else if ([dd6.textField.text isEqualToString:@"工25a"]){
        girderkg.value = 38.1;
        
    }else if ([dd6.textField.text isEqualToString:@"工25b"]){
        girderkg.value = 42;
        
    }else if ([dd6.textField.text isEqualToString:@"工28a"]){
        girderkg.value = 43.4;
        
    }else if ([dd6.textField.text isEqualToString:@"工28b"]){
        girderkg.value = 47.9;
        
    }else if ([dd6.textField.text isEqualToString:@"工32a"]){
        girderkg.value = 52.7;
        
    }else if ([dd6.textField.text isEqualToString:@"工32b"]){
        girderkg.value = 57.7;
        
    }else if ([dd6.textField.text isEqualToString:@"工32c"]){
        girderkg.value = 62.8;
        
    }else if ([dd6.textField.text isEqualToString:@"工36a"]){
        girderkg.value = 59.9;
        
    }else if ([dd6.textField.text isEqualToString:@"工36b"]){
        girderkg.value = 65.6;
        
    }else if ([dd6.textField.text isEqualToString:@"工36c"]){
        girderkg.value = 71.2;
        
    }else if ([dd6.textField.text isEqualToString:@"工40a"]){
        girderkg.value = 67.6;
        
    }else if ([dd6.textField.text isEqualToString:@"工40b"]){
        girderkg.value = 73.8;
        
    }else if ([dd6.textField.text isEqualToString:@"工40c"]){
        girderkg.value = 80.1;
        
    }else if ([dd6.textField.text isEqualToString:@"工45a"]){
        girderkg.value = 80.4;
        
    }else if ([dd6.textField.text isEqualToString:@"工45b"]){
        girderkg.value = 87.4;
        
    }else if ([dd6.textField.text isEqualToString:@"工45c"]){
        girderkg.value = 94.5;
        
    }else if ([dd6.textField.text isEqualToString:@"工50a"]){
        girderkg.value = 93.6;
        
    }else if ([dd6.textField.text isEqualToString:@"工50b"]){
        girderkg.value = 101;
        
    }else if ([dd6.textField.text isEqualToString:@"工50c"]){
        girderkg.value = 109;
        
    }else if ([dd6.textField.text isEqualToString:@"工56a"]){
        girderkg.value = 106;
        
    }else if ([dd6.textField.text isEqualToString:@"工56b"]){
        girderkg.value = 115;
        
    }else if ([dd6.textField.text isEqualToString:@"工56c"]){
        girderkg.value = 124;
        
    }else if ([dd6.textField.text isEqualToString:@"工63a"]){
        girderkg.value = 122;
        
    }else if ([dd6.textField.text isEqualToString:@"工63b"]){
        girderkg.value = 131;
        
    }else if ([dd6.textField.text isEqualToString:@"工63c"]){
        girderkg.value = 141;
    }
}

-(void)channelselect
{
    
    if ([dd7.textField.text isEqualToString:@"〔5"]){
        channelkg.value = 5.4;
        
    }else if([dd7.textField.text isEqualToString:@"〔6.3"]){
        channelkg.value = 6.6;
        
    }else if([dd7.textField.text isEqualToString:@"〔8"]){
        channelkg.value = 8;
        
    }else if([dd7.textField.text isEqualToString:@"〔10"]){
        channelkg.value = 10;
        
    }else if([dd7.textField.text isEqualToString:@"〔12.6"]){
        channelkg.value = 12.4;
        
    }else if([dd7.textField.text isEqualToString:@"〔14a"]){
        channelkg.value = 14.5;
        
    }else if([dd7.textField.text isEqualToString:@"〔14b"]){
        channelkg.value = 16.7;
        
    }else if([dd7.textField.text isEqualToString:@"〔16a"]){
        channelkg.value = 17.2;
        
    }else if([dd7.textField.text isEqualToString:@"〔16b"]){
        channelkg.value = 19.7;
        
    }else if([dd7.textField.text isEqualToString:@"〔18a"]){
        channelkg.value = 20.2;
        
    }else if([dd7.textField.text isEqualToString:@"〔18b"]){
        channelkg.value = 23;
        
    }else if([dd7.textField.text isEqualToString:@"〔20a"]){
        channelkg.value = 22.6;
        
    }else if([dd7.textField.text isEqualToString:@"〔20b"]){
        channelkg.value = 25.8;
        
    }else if([dd7.textField.text isEqualToString:@"〔22a"]){
        channelkg.value = 25;
        
    }else if([dd7.textField.text isEqualToString:@"〔22b"]){
        channelkg.value = 28.4;
        
    }else if([dd7.textField.text isEqualToString:@"〔25a"]){
        channelkg.value = 27.5;
        
    }else if([dd7.textField.text isEqualToString:@"〔25b"]){
        channelkg.value = 31.4;
        
    }else if([dd7.textField.text isEqualToString:@"〔25c"]){
        channelkg.value = 35.3;
        
    }else if([dd7.textField.text isEqualToString:@"〔28a"]){
        channelkg.value = 31.4;
        
    }else if([dd7.textField.text isEqualToString:@"〔28b"]){
        channelkg.value = 35.8;
        
    }else if([dd7.textField.text isEqualToString:@"〔28c"]){
        channelkg.value = 40.2;
        
    }else if([dd7.textField.text isEqualToString:@"〔32a"]){
        channelkg.value = 38.2;
        
    }else if([dd7.textField.text isEqualToString:@"〔32b"]){
        channelkg.value = 43.2;
        
    }else if([dd7.textField.text isEqualToString:@"〔32c"]){
        channelkg.value = 48.3;
        
    }else if([dd7.textField.text isEqualToString:@"〔36a"]){
        channelkg.value = 47.8;
        
    }else if([dd7.textField.text isEqualToString:@"〔36b"]){
        channelkg.value = 53.4;
        
    }else if([dd7.textField.text isEqualToString:@"〔36c"]){
        channelkg.value = 59.1;
        
    }else if([dd7.textField.text isEqualToString:@"〔40a"]){
        channelkg.value = 58.9;
        
    }else if([dd7.textField.text isEqualToString:@"〔40b"]){
        channelkg.value = 65.2;
        
    }else if([dd7.textField.text isEqualToString:@"〔40c"]){
        channelkg.value = 71.5;
    }
    
}


@end
