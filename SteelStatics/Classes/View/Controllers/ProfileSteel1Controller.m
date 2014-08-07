#import "AppInterface.h"
#import "ProfileSteel1Controller.h"

@interface ProfileSteel1Controller ()
@property DropDown1 *dd1;
@property DropDown1 *dd2;
@property DropDown1 *dd3;
@property DropDown1 *dd4;
@end
@implementation ProfileSteel1Controller
@synthesize dd1,dd2,dd3,dd4;
//矩形管 caculate field
@synthesize rectanglepipelong,rectanglepipethick,rectanglepipeshort,rectanglepipepcs,rectanglepipem,rectanglepipeloss;
//H型鋼 對稱caculate field
@synthesize hsteelm,hsteelpcs,hsteelloss;
//H型鋼 不對稱caculate field
@synthesize hsteel2h,hsteel2b1,hsteel2b2,hsteel2loss,hsteel2m,hsteel2pcs,hsteel2t1,hsteel2t2,hsteel2tw;
//圓管 caculate field
@synthesize circlepipediamter,circlepipeloss,circlepipem,circlepipepcs,circlepipethick;
//圓鋼 caculate field
@synthesize circlesteeldiamter,circlesteelloss,circlesteelm,circlesteelpcs;
//result field
@synthesize rectanglepipe,circlesteel,circlepipe,hsteel,hsteel2;
//rectanglepipe label
@synthesize rectanglepipelonglabel,rectanglepipeshortlabel,rectanglepipelosslabel,rectanglepipemlabel,rectanglepipepcslabel,rectanglepipethicklabel,r1,r2,r3,r4;
//circlesteel label
@synthesize circlesteeldiamterlabel,circlesteellosslabel,circlesteelmlabel,circlesteelpcslabel,c1;
#pragma mark - Override Methods

-(void) autoUpdateResuls
{
    circlepipe.value = (0.02466 * circlepipethick.value * (circlepipediamter.value - circlepipethick.value)) * circlepipem.value * circlepipepcs.value * (circlepipeloss.value / 100 + 1);
    hsteel2.value = (((hsteel2h.value - hsteel2t1.value - hsteel2t2.value)*hsteel2tw.value*0.00785)+(hsteel2b1.value*hsteel2t1.value*0.00785)+(hsteel2b2.value*hsteel2t2.value*0.00785))*hsteel2m.value*hsteel2pcs.value*(hsteel2loss.value / 100+1);
    [self Circlesteel];
    [self Hsteel1];
    [self Rectanglepipe];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self Creat];
    [self addbutton];
}

-(void)Creat
{
    dd1 = [[DropDown1 alloc] initWithFrame:CGRectMake(350, 70, 170, 31)];
    dd1.textField.placeholder = @"標準H型鋼型號";
    ProfileSteel1Controller* weakSelf = self;
    dd1.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        weakSelf.hsteelloss.text = nil;
        weakSelf.hsteel.text = nil;
        weakSelf.hsteelm.text = nil;
        weakSelf.hsteelpcs.text = nil;
    };;
    NSArray* arr1=[[NSArray alloc]initWithObjects:@"HW 100*100*6*8",@"HW 125*125*6.5*9",@"HW 150*150*7*10",@"HW 175*175*7.5*11",@"HW 200*200*8*12",@"HW #200*204*12*12",@"HW 250*250*9*14",@"HW #250*255*14*14",@"HW #294*302*12*12",@"HW 300*300*10*15",@"HW 300*305*15*15",@"HW #344*348*10*16",@"HW 350*350*12*19",@"HW #388*402*15*15",@"HW #394*398*11*18",@"HW 400*400*13*21",@"HW #400*408*21*21",@"HW 414*405*18*28",@"HW #428*407*20*35",@"HW #458*417*30*50",@"HW 498*432*45*70",@"HM 148*100*6*9",@"HM 194*150*6*9",@"HM 244*175*7*11",@"HM 294*200*8*12",@"HM 340*250*9*14",@"HM 390*300*10*16",@"HM 440*300*11*18",@"HM 482*300*11*15",@"HM 488*300*11*18",@"HM 582*300*12*17",@"HM 588*300*12*20",@"HM #594*302*14*23",@"HN 100*50*5*7",@"HN 125*60*6*8",@"HN 150*75*5*7",@"HN 175*90*5*8",@"HN 198*99*4.5*7",@"HN 200*100*5.5*8",@"HN 248*124*5*8",@"HN 250*125*6*9",@"HN 298*149*5.5*8",@"HN 300*150*6.5*9",@"HN 347*174*6*9",@"HN 350*175*7*11",@"HN #400*150*8*13",@"HN 396*199*7*11",@"HN 400*200*8*13",@"HN #450*150*9*14",@"HN 446*199*8*12",@"HN 450*200*9*14",@"HN #500*150*10*16",@"HN 496*199*9*14",@"HN 500*200*10*16",@"HN #506*201*11*19",@"HN 596*199*10*15",@"HN 600*200*11*17",@"HN #606*201*12*20",@"HN #692*300*13*20",@"HN 700*300*13*24",@"HP 200*204*12*12",@"HP 244*252*11*11",@"HP 250*255*14*14",@"HP 294*302*12*12",@"HP 300*300*10*15",@"HP 300*305*15*15",@"HP 338*351*13*13",@"HP 344*354*16*16",@"HP 350*350*12*19",@"HP 350*357*19*19",@"HP 388*402*15*15",@"HP 394*405*18*18",@"HP 400*400*13*21",@"HP 400*408*21*21",@"HP 414*405*18*28",@"HP 428*407*20*35",nil];
    dd1.tableArray = arr1;
    [self.view addSubview:dd1];
    
    
    dd2 = [[DropDown1 alloc] initWithFrame:CGRectMake(260, 424, 140, 31)];
    dd2.textField.placeholder = @"等邊矩形管型號";
    ProfileSteel1Controller* weakSelf2 = self;
    dd2.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        if (![dd2.textField.text  isEqualToString: @""])
        {
            dd3.textField.enabled = NO;
            dd3.tv.hidden = YES;
        }
        weakSelf2.rectanglepipelong.hidden = YES;
        weakSelf2.rectanglepipeshort.hidden = YES;
        weakSelf2.rectanglepipethick.hidden = YES;
        weakSelf2.rectanglepipelonglabel.hidden = YES;
        weakSelf2.rectanglepipeshortlabel.hidden = YES;
        weakSelf2.rectanglepipethicklabel.hidden = YES;
        weakSelf2.r1.hidden = YES;
        weakSelf2.r2.hidden = YES;
        weakSelf2.r3.hidden = YES;
        weakSelf2.rectanglepipe.text = nil;
        weakSelf2.rectanglepipeloss.text = nil;
        weakSelf2.rectanglepipem.text = nil;
        weakSelf2.rectanglepipepcs.text = nil;
        weakSelf2.r4.frame = CGRectMake(248, 474, 16, 21);
        weakSelf2.rectanglepipem.frame = CGRectMake(182, 499, 55, 31);
        weakSelf2.rectanglepipepcs.frame = CGRectMake(262, 499, 55, 31);
        weakSelf2.rectanglepipeloss.frame = CGRectMake(341, 499, 55, 31);
        weakSelf2.rectanglepipemlabel.frame = CGRectMake(183, 470, 52, 21);
        weakSelf2.rectanglepipepcslabel.frame = CGRectMake(275, 470, 52, 21);
        weakSelf2.rectanglepipelosslabel.frame = CGRectMake(354, 470, 52, 21);
    };;
    NSArray* arr2=[[NSArray alloc]initWithObjects:@"25*1.20",@"25*1.50",@"25*1.75",@"25*2.00",@"30*2.50",@"30*3.00",@"40*2.50",@"40*3.00",@"40*4.00",@"50*2.50",@"50*3.00",@"50*4.00",@"60*2.50",@"60*3.00",@"60*4.00",@"60*5.00",@"70*3.00",@"70*4.00",@"70*5.00",@"80*3.00",@"80*4.00",@"80*5.00",@"90*3.00",@"90*4.00",@"90*5.00",@"90*6.00",@"100*4.00",@"100*5.00",@"100*6.00",@"120*4.00",@"120*5.00",@"120*6.00",@"120*8.00",@"140*4.00",@"140*5.00",@"140*6.00",@"140*8.00",@"160*4.00",@"160*5.00",@"160*6.00",@"160*8.00",nil];
    dd2.tableArray = arr2;
    [self.view addSubview:dd2];
    
    dd3 = [[DropDown1 alloc] initWithFrame:CGRectMake(420, 424, 140, 31)];
    dd3.textField.placeholder = @"不等邊矩形管型號";
    ProfileSteel1Controller* weakSelf3 = self;
    dd3.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        if (![dd3.textField.text  isEqualToString: @""])
        {
            dd2.textField.enabled = NO;
            dd2.tv.hidden = YES;
        }
        weakSelf3.rectanglepipelong.hidden = YES;
        weakSelf3.rectanglepipeshort.hidden = YES;
        weakSelf3.rectanglepipethick.hidden = YES;
        weakSelf3.rectanglepipelonglabel.hidden = YES;
        weakSelf3.rectanglepipeshortlabel.hidden = YES;
        weakSelf3.rectanglepipethicklabel.hidden = YES;
        weakSelf.r1.hidden = YES;
        weakSelf3.r2.hidden = YES;
        weakSelf3.r3.hidden = YES;
        weakSelf3.rectanglepipe.text = nil;
        weakSelf3.rectanglepipeloss.text = nil;
        weakSelf3.rectanglepipem.text = nil;
        weakSelf3.rectanglepipepcs.text = nil;
        weakSelf3.r4.frame = CGRectMake(248, 474, 16, 21);
        weakSelf3.rectanglepipem.frame = CGRectMake(182, 499, 55, 31);
        weakSelf3.rectanglepipepcs.frame = CGRectMake(262, 499, 55, 31);
        weakSelf3.rectanglepipeloss.frame = CGRectMake(341, 499, 55, 31);
        weakSelf3.rectanglepipemlabel.frame = CGRectMake(183, 470, 52, 21);
        weakSelf3.rectanglepipepcslabel.frame = CGRectMake(275, 470, 52, 21);
        weakSelf3.rectanglepipelosslabel.frame = CGRectMake(354, 470, 52, 21);
    };;
    NSArray* arr3=[[NSArray alloc]initWithObjects:@"50*25*1.20",@"50*25*1.50",@"50*30*2.50",@"50*30*3.00",@"50*30*4.00",@"60*30*2.50",@"60*30*3.00",@"60*30*4.00",@"60*40*2.50",@"60*40*3.00",@"60*40*4.00",@"70*50*3.00",@"70*50*4.00",@"70*50*5.00",@"80*40*2.50",@"80*40*3.00",@"80*40*4.00",@"80*40*5.00",@"80*60*3.00",@"80*60*4.00",@"80*60*5.00",@"90*40*3.00",@"90*40*4.00",@"90*40*5.00",@"90*50*3.00",@"90*50*4.00",@"90*50*5.00",@"90*60*3.00",@"90*60*4.00",@"90*60*5.00",@"100*50*3.00",@"100*50*4.00",@"100*50*5.00",@"120*60*3.00",@"120*60*4.00",@"120*60*5.00",@"120*60*6.00",@"120*80*3.00",@"120*80*3.00",@"120*80*5.00",@"120*80*6.00",@"140*80*4.00",@"140*80*5.00",@"140*80*6.00",@"150*100*4.00",@"150*100*5.00",@"150*100*6.00",@"150*100*8.00",@"160*80*4.00",@"160*80*5.00",@"160*80*6.00",@"160*80*8.00",@"180*100*4.00",@"180*100*5.00",@"180*100*6.00",@"180*100*8.00",@"200*100*4.00",@"200*100*5.00",@"200*100*6.00",@"200*100*8.00",nil];
    dd3.tableArray = arr3;
    [self.view addSubview:dd3];
    
    
    dd4 = [[DropDown1 alloc] initWithFrame:CGRectMake(260, 779, 140, 31)];
    dd4.textField.placeholder = @"圓鋼型號";
    ProfileSteel1Controller* weakSelf4 = self;
    dd4.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        weakSelf4.circlesteeldiamter.hidden = YES;
        weakSelf4.circlesteeldiamterlabel.hidden = YES;
        weakSelf4.c1.hidden = YES;
        weakSelf4.circlesteel.text = nil;
        weakSelf4.circlesteelloss.text = nil;
        weakSelf4.circlesteelm.text = nil;
        weakSelf4.circlesteelpcs.text = nil;
        weakSelf4.circlesteelm.frame = CGRectMake(200, 850, 55, 31);
        weakSelf4.circlesteelpcs.frame = CGRectMake(288, 850, 55, 31);
        weakSelf4.circlesteelloss.frame = CGRectMake(377, 850, 55, 31);
        weakSelf4.circlesteelmlabel.frame = CGRectMake(202, 821, 52, 21);
        weakSelf4.circlesteelpcslabel.frame = CGRectMake(301, 821, 34, 21);
        weakSelf4.circlesteellosslabel.frame = CGRectMake(390, 821, 34, 21);
    };;
    NSArray* arr4=[[NSArray alloc]initWithObjects:@"Ф5.5",@"Ф6",@"Ф6.5",@"Ф7",@"Ф8",@"Ф9",@"Ф10",@"*Ф11",@"Ф12",@"Ф13",@"Ф14",@"Ф15",@"Ф16",@"Ф17",@"Ф18",@"Ф19",@"Ф20",@"Ф21",@"Ф22",@"*Ф23",@"Ф24",@"Ф25",@"Ф26",@"*Ф27",@"Ф28",@"*Ф29",@"Ф30",@"*Ф31",@"Ф32",@"*Ф33",@"Ф34",@"*Ф35",@"Ф36",@"Ф38",@"Ф40",@"Ф42",@"Ф45",@"Ф48",@"Ф50",@"Ф53",@"*Ф55",@"Ф56",@"*Ф58",@"Ф60",@"Ф63",@"*Ф65",@"*Ф68",@"Ф70",@"Ф75",@"Ф80",@"Ф85",@"Ф90",@"Ф95",@"Ф100",@"Ф105",@"Ф110",@"Ф115",@"Ф120",@"Ф125",@"Ф130",@"Ф140",@"Ф150",@"Ф160",@"Ф170",@"Ф180",@"Ф190",@"Ф200",@"Ф220",@"Ф250",nil];
    dd4.tableArray = arr4;
    [self.view addSubview:dd4];
}
-(void)Circlesteel
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

-(void)Rectanglepipe
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

-(void)Hsteel1
{
    if ([dd1.textField.text isEqualToString:@"HW 100*100*6*8"]){
        hsteel.value = 17.2 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 125*125*6.5*9"]){
        hsteel.value = 23.8 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 150*150*7*10"]){
        hsteel.value = 31.9 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW 175*175*7.5*11"]){
        hsteel.value = 40.3 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW 200*200*8*12"]){
        hsteel.value = 50.5 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW #200*204*12*12"]){
        hsteel.value = 56.7 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW 250*250*9*14"]){
        hsteel.value = 72.4 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW #250*255*14*14"]){
        hsteel.value = 82.2 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW #294*302*12*12"]){
        hsteel.value = 85 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW 300*300*10*15"]){
        hsteel.value = 94.5 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    
    }else if ([dd1.textField.text isEqualToString:@"HW 300*305*15*15"]){
        hsteel.value = 106 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW #344*348*10*16"]){
        hsteel.value = 115 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HW 350*350*12*19"]){
        hsteel.value = 137 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW #388*402*15*15"]){
        hsteel.value = 141 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW #394*398*11*18"]){
        hsteel.value = 147 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW 400*400*13*21"]){
        hsteel.value = 172 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW #400*408*21*21"]){
        hsteel.value = 197 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW 414*405*18*28"]){
        hsteel.value = 233 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW #428*407*20*35"]){
        hsteel.value = 284 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW #458*417*30*50"]){
        hsteel.value = 415 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HW 498*432*45*70"]){
        hsteel.value = 605 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HM 148*100*6*9"]){
        hsteel.value = 21.4 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HM 194*150*6*9"]){
        hsteel.value = 31.2 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
      
    }else if ([dd1.textField.text isEqualToString:@"HM 244*175*7*11"]){
        hsteel.value = 44.1 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 294*200*8*12"]){
        hsteel.value = 57.3 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 340*250*9*14"]){
        hsteel.value = 79.7 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 390*300*10*16"]){
        hsteel.value = 107 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 440*300*11*18"]){
        hsteel.value = 124 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 482*300*11*15"]){
        hsteel.value = 115 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 488*300*11*18"]){
        hsteel.value = 129 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 582*300*12*17"]){
        hsteel.value = 137 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM 588*300*12*20"]){
        hsteel.value = 151 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HM #594*302*14*23"]){
        hsteel.value = 175 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 100*50*5*7"]){
        hsteel.value = 9.45 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 125*60*6*8"]){
        hsteel.value = 13.3 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 150*75*5*7"]){
        hsteel.value = 14.3 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 175*90*5*8"]){
        hsteel.value = 18.2 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 198*99*4.5*7"]){
        hsteel.value = 18.5 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 200*100*5.5*8"]){
        hsteel.value = 21.7 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 248*124*5*8"]){
        hsteel.value = 25.8 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 250*125*6*9"]){
        hsteel.value = 29.7 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 298*149*5.5*8"]){
        hsteel.value = 32.6 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 300*150*6.5*9"]){
        hsteel.value = 37.3 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 347*174*6*9"]){
        hsteel.value = 41.8 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 350*175*7*11"]){
        hsteel.value = 50 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #400*150*8*13"]){
        hsteel.value = 55.8 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 396*199*7*11"]){
        hsteel.value = 56.7 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 400*200*8*13"]){
        hsteel.value = 66 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #450*150*9*14"]){
        hsteel.value = 66.5 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 446*199*8*12"]){
        hsteel.value = 66.7 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 450*200*9*14"]){
        hsteel.value = 76.5 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #500*150*10*16"]){
        hsteel.value = 77.1 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 496*199*9*14"]){
        hsteel.value = 79.5 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 500*200*10*16"]){
        hsteel.value = 89.6 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #506*201*11*19"]){
        hsteel.value = 103 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 596*199*10*15"]){
        hsteel.value = 95.1 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 600*200*11*17"]){
        hsteel.value = 106 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #606*201*12*20"]){
        hsteel.value = 120 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN #692*300*13*20"]){
        hsteel.value = 166 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HN 700*300*13*24"]){
        hsteel.value = 185 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 200*204*12*12"]){
        hsteel.value = 56.7 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 244*252*11*11"]){
        hsteel.value = 64.4 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 250*255*14*14"]){
        hsteel.value = 82.2 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 294*302*12*12"]){
        hsteel.value = 85 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 300*300*10*15"]){
        hsteel.value = 94.5 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 300*305*15*15"]){
        hsteel.value = 106 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 338*351*13*13"]){
        hsteel.value = 106 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 344*354*16*16"]){
        hsteel.value = 131 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 350*350*12*19"]){
        hsteel.value = 137 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 350*357*19*19"]){
        hsteel.value = 156 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 388*402*15*15"]){
        hsteel.value = 141 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 394*405*18*18"]){
        hsteel.value = 169 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 400*400*13*21"]){
        hsteel.value = 172 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 400*408*21*21"]){
        hsteel.value = 197 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 414*405*18*28"]){
        hsteel.value = 233 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
        
    }else if ([dd1.textField.text isEqualToString:@"HP 428*407*20*35"]){
        hsteel.value = 284 * hsteelm.value * hsteelpcs.value * (hsteelloss.value / 100 +1);
    }
}
- (IBAction)hsteelclear {
    hsteel.text = nil;
    hsteelm.text = nil;
    hsteelpcs.text = nil;
    hsteelloss.text = nil;
    dd1.textField.text = @"";
    dd1.tv.hidden = YES;
    
    [hsteelm becomeFirstResponder];
    [hsteelm resignFirstResponder];
    
    CGRect sf = self.dd1.frame;
    sf.size.height = 30;
    self.dd1.frame = sf;
    CGRect frame = dd1.tv.frame;
    frame.size.height = 0;
    dd1.tv.frame = frame;
    dd1.tv.tag = 1;
    DropDown1*drop;
    [drop dropdown];
    
}
- (IBAction)hsteel2clear {
    hsteel2.text = nil;
    hsteel2h.text = nil;
    hsteel2b1.text = nil;
    hsteel2b2.text = nil;
    hsteel2t1.text = nil;
    hsteel2tw.text = nil;
    hsteel2m.text = nil;
    hsteel2pcs.text = nil;
    hsteel2loss.text = nil;
    hsteel2t2.text = nil;
    
    [hsteelm becomeFirstResponder];
    [hsteelm resignFirstResponder];
}
- (IBAction)rectanglepipeclear {
    rectanglepipelong.hidden = NO;
    rectanglepipeshort.hidden = NO;
    rectanglepipethick.hidden = NO;
    rectanglepipelonglabel.hidden = NO;
    rectanglepipeshortlabel.hidden = NO;
    rectanglepipethicklabel.hidden = NO;
    r1.hidden = NO;
    r2.hidden = NO;
    r3.hidden = NO;
    
    rectanglepipe.text = nil;
    rectanglepipelong.text = nil;
    rectanglepipeshort.text = nil;
    rectanglepipethick.text = nil;
    rectanglepipem.text = nil;
    rectanglepipepcs.text = nil;
    rectanglepipeloss.text = nil;
    dd2.textField.text = @"";
    dd3.textField.text = @"";
    dd2.tv.hidden = YES;
    dd3.tv.hidden = YES;
    [hsteelm becomeFirstResponder];
    [hsteelm resignFirstResponder];
    r4.frame = CGRectMake(564, 474, 16, 21);
    rectanglepipem.frame = CGRectMake(422, 499, 55, 31);
    rectanglepipepcs.frame = CGRectMake(500, 499, 55, 31);
    rectanglepipeloss.frame = CGRectMake(577, 499, 55, 31);
    rectanglepipemlabel.frame = CGRectMake(425, 470, 52, 21);
    rectanglepipepcslabel.frame = CGRectMake(512, 470, 34, 21);
    rectanglepipelosslabel.frame = CGRectMake(588, 470, 34, 21);
    
    dd3.textField.enabled = YES;
    dd2.textField.enabled = YES;
    
    CGRect sf2 = self.dd2.frame;
    CGRect sf3 = self.dd3.frame;
    sf2.size.height = 30;
    sf3.size.height = 30;
    self.dd2.frame = sf2;
    self.dd3.frame = sf3;
    CGRect frame2 = dd2.tv.frame;
    CGRect frame3 = dd3.tv.frame;
    frame2.size.height = 0;
    frame3.size.height = 0;
    dd2.tv.frame = frame2;
    dd3.tv.frame = frame3;
    dd3.tv.tag = 1;
    dd2.tv.tag = 1;
    DropDown1*drop;
    [drop dropdown];
}
- (IBAction)circlepipeclear {
    circlepipe.text = nil;
    circlepipediamter.text = nil;
    circlepipethick.text = nil;
    circlepipem.text = nil;
    circlepipepcs.text = nil;
    circlepipeloss.text = nil;
    
    [hsteelm becomeFirstResponder];
    [hsteelm resignFirstResponder];
}
- (IBAction)circlsteelclear {
    circlesteel.text = nil;
    circlesteeldiamter.text = nil;
    circlesteelloss.text = nil;
    circlesteelm.text = nil;
    circlesteelpcs.text = nil;
    circlesteeldiamter.hidden = NO;
    circlesteeldiamterlabel.hidden = NO;
    c1.hidden = NO;
    dd4.tv.hidden = YES;
    dd4.textField.text = @"";
    [hsteelm becomeFirstResponder];
    [hsteelm resignFirstResponder];
    circlesteelm.frame = CGRectMake(288, 850, 55, 31);
    circlesteelpcs.frame = CGRectMake(377, 850, 55, 31);
    circlesteelloss.frame = CGRectMake(462, 850, 55, 31);
    circlesteelmlabel.frame = CGRectMake(289, 821, 52, 21);
    circlesteelpcslabel.frame = CGRectMake(389, 821, 34, 21);
    circlesteellosslabel.frame = CGRectMake(475, 821, 34, 21);
    
    CGRect sf = self.dd4.frame;
    sf.size.height = 30;
    self.dd4.frame = sf;
    CGRect frame = dd4.tv.frame;
    frame.size.height = 0;
    dd4.tv.frame = frame;
    dd4.tv.tag = 1;
    DropDown1*drop;
    [drop dropdown];
}

-(IBAction)addbutton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 768, 1024);
    [button setTitle:@"" forState: UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view sendSubviewToBack: button];
}
-(void)buttonClicked
{
    [self.view endEditing:YES];
    dd1.tv.hidden = YES;
    dd2.tv.hidden = YES;
    dd3.tv.hidden = YES;
    dd4.tv.hidden = YES;
    dd1.tv.tag = 1;
    dd2.tv.tag = 1;
    dd3.tv.tag = 1;
    dd4.tv.tag = 1;
    CGRect sf1 = self.dd1.frame;
    CGRect sf2 = self.dd2.frame;
    CGRect sf3 = self.dd3.frame;
    CGRect sf4 = self.dd4.frame;
    sf1.size.height = 30;
    sf2.size.height = 30;
    sf3.size.height = 30;
    sf4.size.height = 30;
    self.dd1.frame = sf1;
    self.dd2.frame = sf2;
    self.dd3.frame = sf3;
    self.dd4.frame = sf4;
    CGRect frame1 = dd1.tv.frame;
    CGRect frame2 = dd2.tv.frame;
    CGRect frame3 = dd3.tv.frame;
    CGRect frame4 = dd4.tv.frame;
    frame1.size.height = 0;
    frame2.size.height = 0;
    frame3.size.height = 0;
    frame4.size.height = 0;
    dd1.tv.frame = frame1;
    dd2.tv.frame = frame2;
    dd3.tv.frame = frame3;
    dd4.tv.frame = frame4;
    
    DropDown1*drop;
    [drop dropdown];
}
@end
