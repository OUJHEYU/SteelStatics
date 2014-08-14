#import "AppInterface.h"
#import "RolledSteelController.h"

@interface RolledSteelController ()
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

@implementation RolledSteelController
{
    NSDictionary* values1Dictionary ;
    NSDictionary* values2Dictionary ;
}
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
    
    values1Dictionary = [self getJson: @"Values1"];
    values2Dictionary = [self getJson: @"Values2"];
    
    hsteelsymmetrykg.attributeKey = @"hsteelsymmetrykg";
    dd1.textField.attributeKey = @"dd1";
    
    rectanglepipekg.attributeKey = @"rectanglepipekg";
    dd2.textField.attributeKey = @"dd2";
    dd3.textField.attributeKey = @"dd3";
    
    circlesteelkg.attributeKey = @"circlesteelkg";
    dd4.textField.attributeKey = @"dd4";
    
    csteelkg.attributeKey = @"csteelkg";
    dd5.textField.attributeKey = @"dd5";
    
    girderkg.attributeKey = @"girderkg";
    dd6.textField.attributeKey = @"dd6";
    
    channelkg.attributeKey = @"channelkg";
    dd7.textField.attributeKey = @"dd7";
    
    zsteelkg.attributeKey = @"zsteelkg";
    dd8.textField.attributeKey = @"dd8";
    
    anglekg.attributeKey = @"anglekg";
    dd9.textField.attributeKey = @"dd9";
    dd10.textField.attributeKey = @"dd10";
}

-(NSDictionary*) getJson:(NSString*)fileName
{
    NSString* jsonPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData* valuesData = [NSData dataWithContentsOfFile:jsonPath];
    NSError* error = nil;
    NSDictionary* result = [NSJSONSerialization JSONObjectWithData: valuesData options:NSJSONReadingAllowFragments error:&error];
    
    return result;
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
    RolledSteelController* weakSelf1 = self;
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
    RolledSteelController* weakSelf2 = self;
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
    RolledSteelController* weakSelf3 = self;
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
    RolledSteelController* weakSelf4 = self;
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
    RolledSteelController* weakSelf5 = self;
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
    RolledSteelController* weakSelf6 = self;
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
    RolledSteelController* weakSelf7 = self;
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
    RolledSteelController* weakSelf8 = self;
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
    RolledSteelController* weakSelf9 = self;
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
    RolledSteelController* weakSelf10 = self;
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
    if ([dd4.textField.text isEqualToString:@""]){
        circlesteel.value = (0.00617 * circlesteeldiamter.value * circlesteeldiamter.value) * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
    }else{
        circlesteel.value = circlesteelkg.value * circlesteelm.value * circlesteelpcs.value * (circlesteelloss.value / 100 + 1);
    }
}

-(void)rectanglepipecaculate
{
    if ([dd2.textField.text isEqualToString:@""]){
        rectanglepipe.value = ((rectanglepipelong.value + rectanglepipeshort.value - 2 * rectanglepipethick.value) * rectanglepipethick.value * 0.0157) * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
    }else{
        rectanglepipe.value = rectanglepipekg.value * rectanglepipem.value * rectanglepipepcs.value * (rectanglepipeloss.value / 100 + 1);
    }
}

-(void)hsteelsymmetrycaculate
{
    hsteelsymmetry.value = hsteelsymmetrykg.value * hsteelsymmetrym.value * hsteelsymmetrypcs.value * (hsteelsymmetryloss.value / 100 +1);

}
-(void)anglescaculate
{
    if ([dd9.textField.text isEqualToString:@""]&&[dd10.textField.text isEqualToString:@""]){
        angles.value = (0.00785 * anglethick.value * (angleside1.value + angleside2.value - anglethick.value)) * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
    }else{
        angles.value = anglekg.value * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
    }
}
-(void)csteelcaculate
{
    if ([dd5.textField.text isEqualToString:@""]) {
        csteel.value = (0.00785 * csteelthick.value * (csteelh.value + 2 * csteelb.value + 2 * csteelc.value)) * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else{
        csteel.value = csteelkg.value * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
    }
}

-(void)zsteelcaculate
{
    if ([dd8.textField.text isEqualToString:@""]){
        zsteel.value = (0.00785 * zsteelthick.value * (zsteelh.value + 2 * zsteelb.value + 2 * zsteelc.value)) * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
    }else{
        zsteel.value = 4.233 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
    }
    
}

-(void)girdercaculate
{
    girder.value = girderkg.value * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
}
-(void)channelcaculate
{
    channel.value = channelkg.value * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
}

-(void) circleselect
{
    NSDictionary* ddDictionary = values2Dictionary[@"circlesteelkg"];
    
    BaseTextField* oneTextField =dd4.textField;
    
    double value = 0;

    value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    
    circlesteelkg.value = value;
}
-(void)hsteelsymmetryselect
{
    NSDictionary* ddDictionary = values2Dictionary[@"hsteelsymmetrykg"];
    
    BaseTextField* oneTextField =dd1.textField;
    
    double value = 0;
    
    value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    
    hsteelsymmetrykg.value = value;
    
}

-(void)rectanglepipeselect
{
    
    NSDictionary* ddDictionary = values1Dictionary[@"rectanglepipekg"];
    
    BaseTextField* oneTextField =dd2.textField;
    BaseTextField* twoTextField =dd3.textField;
    
    double value = 0;
    if (![oneTextField.text isEqualToString: @""]) {
        value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    } else {
        value = [ddDictionary[twoTextField.attributeKey][twoTextField.text] doubleValue];
    }
    rectanglepipekg.value = value;
}
-(void)angleselect
{
    
    NSDictionary* ddDictionary = values1Dictionary[@"anglekg"];
    
    BaseTextField* oneTextField =dd9.textField;
    BaseTextField* twoTextField =dd10.textField;
    
    double value = 0;
    if (![oneTextField.text isEqualToString: @""]) {
        value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    } else {
        value = [ddDictionary[twoTextField.attributeKey][twoTextField.text] doubleValue];
    }
    anglekg.value = value;
    
}

-(void)csteelselect
{
    NSDictionary* ddDictionary = values2Dictionary[@"csteelkg"];
    
    BaseTextField* oneTextField =dd5.textField;
    
    double value = 0;
    
    value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    
    csteelkg.value = value;
}
-(void)zsteelselect
{
    NSDictionary* ddDictionary = values2Dictionary[@"zsteelkg"];
    
    BaseTextField* oneTextField =dd8.textField;
    
    double value = 0;
    
    value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    
    zsteelkg.value = value;
}
-(void)girderselect
{
    
    NSDictionary* ddDictionary = values2Dictionary[@"girderkg"];
    
    BaseTextField* oneTextField =dd6.textField;
    
    double value = 0;
    
    value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    
    girderkg.value = value;
}

-(void)channelselect
{
    NSDictionary* ddDictionary = values2Dictionary[@"channelkg"];
    
    BaseTextField* oneTextField =dd7.textField;
    
    double value = 0;
    
    value = [ddDictionary[oneTextField.attributeKey][oneTextField.text] doubleValue];
    
    channelkg.value = value;
}
@end
