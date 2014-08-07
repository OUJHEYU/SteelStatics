#import "AppInterface.h"
#import "ProfileSteel2Controller.h"
@interface ProfileSteel2Controller ()

@property DropDown1 *dd1;
@property DropDown1 *dd2;
@property DropDown1 *dd3;
@property DropDown1 *dd4;
@property DropDown1 *dd5;
@property DropDown1 *dd6;
@end

@implementation ProfileSteel2Controller
@synthesize dd1,dd2,dd3,dd4,dd5,dd6;

//C型鋼 caculate field
@synthesize csteelh,csteelb,csteelc,csteelthick,csteelm,csteelpcs,csteelloss;
//Z型鋼 caculate field
@synthesize zsteelh,zsteelb,zsteelc,zsteelthick,zsteelm,zsteelpcs,zsteelloss;
//角鋼 caculate field
@synthesize angleside1,angleside2,anglethick,anglem,anglepcs,angleloss;
//工字鋼 caculate field
@synthesize girderloss,girderpcs,girderm;
//槽鋼 caculate field
@synthesize channelloss,channelpcs,channelm;
//result field
@synthesize channel,girder,angles,csteel,zsteel;
//C label
@synthesize csteellosslabel,csteelthicklabel,csteelpcslabel,csteelhlabel,csteelmlabel,csteelblabel,csteelclabel,x4,x3,x2,x1;
//Z label
@synthesize zsteellosslabel,zsteelthicklabel,zsteelpcslabel,zsteelhlabel,zsteelmlabel,zsteelblabel,zsteelclabel,z4,z3,z2,z1;
//Angles label
@synthesize angleslosslabel,anglesmlabel,anglespcslabel,anglesside1label,anglesside2label,anglesthicklabel,a1,a2,a3;

#pragma mark - Override Methods
-(void) autoUpdateResuls
{
    [self Angles];
    [self Csteel];
    [self Zsteel];
    [self Girder];
    [self Channel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Creat];
    [self addbutton];
}
- (IBAction)csteelclear {
    x1.hidden = NO;
    x2.hidden = NO;
    x3.hidden = NO;
    x4.hidden = NO;
    csteelh.hidden = NO;
    csteelb.hidden = NO;
    csteelc.hidden = NO;
    csteelthick.hidden = NO;
    csteelclabel.hidden = NO;
    csteelblabel.hidden = NO;
    csteelhlabel.hidden = NO;
    csteelthicklabel.hidden = NO;

    csteel.text = nil;
    csteelh.text = nil;
    csteelb.text = nil;
    csteelc.text = nil;
    csteelthick.text = nil;
    csteelm.text = nil;
    csteelpcs.text = nil;
    csteelloss.text = nil;
    dd1.textField.text = @"";
    dd1.tv.hidden = YES;
    [csteelh becomeFirstResponder];
    [csteelh resignFirstResponder];
    csteelm.frame = CGRectMake(430, 140, 55, 31);
    csteelpcs.frame = CGRectMake(493, 140, 55, 31);
    csteelloss.frame = CGRectMake(555, 140, 55, 31);
    csteelmlabel.frame = CGRectMake(433, 111, 52, 21);
    csteelpcslabel.frame = CGRectMake(506, 111, 34, 21);
    csteellosslabel.frame = CGRectMake(568, 111, 34, 21);
    
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
- (IBAction)zsteelclear {
    z1.hidden = NO;
    z2.hidden = NO;
    z3.hidden = NO;
    z4.hidden = NO;
    zsteelh.hidden = NO;
    zsteelb.hidden = NO;
    zsteelc.hidden = NO;
    zsteelthick.hidden = NO;
    zsteelclabel.hidden = NO;
    zsteelblabel.hidden = NO;
    zsteelhlabel.hidden = NO;
    zsteelthicklabel.hidden = NO;
    
    zsteel.text = nil;
    zsteelh.text = nil;
    zsteelb.text = nil;
    zsteelc.text = nil;
    zsteelthick.text = nil;
    zsteelm.text = nil;
    zsteelpcs.text = nil;
    zsteelloss.text = nil;
    dd4.textField.text = @"";
    dd4.tv.hidden = YES;
    [csteelh becomeFirstResponder];
    [csteelh resignFirstResponder];
    zsteelm.frame = CGRectMake(433, 317, 55, 31);
    zsteelpcs.frame = CGRectMake(496, 317, 55, 31);
    zsteelloss.frame = CGRectMake(558, 317, 55, 31);
    zsteelmlabel.frame = CGRectMake(436, 288, 52, 21);
    zsteelpcslabel.frame = CGRectMake(508, 288, 34, 21);
    zsteellosslabel.frame = CGRectMake(570, 288, 34, 21);
    
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
- (IBAction)girderclear {
    girder.text = nil;
    girderloss.text = nil;
    girderm.text = nil;
    girderpcs.text = nil;
    dd2.textField.text = @"";
    dd2.tv.hidden = YES;
    
    [csteelm becomeFirstResponder];
    [csteelm resignFirstResponder];
    
    CGRect sf = self.dd2.frame;
    sf.size.height = 30;
    self.dd2.frame = sf;
    CGRect frame = dd2.tv.frame;
    frame.size.height = 0;
    dd2.tv.frame = frame;
    dd2.tv.tag = 1;
    DropDown1*drop;
    [drop dropdown];
    
}
- (IBAction)channelclear {
    channel.text = nil;
    channelloss.text = nil;
    channelm.text = nil;
    channelpcs.text = nil;
    dd3.textField.text = @"";
    dd3.tv.hidden = YES;
    
    [csteelm becomeFirstResponder];
    [csteelm resignFirstResponder];
    
    CGRect sf = self.dd3.frame;
    sf.size.height = 30;
    self.dd3.frame = sf;
    CGRect frame = dd3.tv.frame;
    frame.size.height = 0;
    dd3.tv.frame = frame;
    dd3.tv.tag = 1;
    DropDown1*drop;
    [drop dropdown];
    
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
    a3.hidden = NO;
    
    angleloss.text = nil;
    anglem.text = nil;
    anglepcs.text = nil;
    angles.text = nil;
    angleside1.text = nil;
    angleside2.text = nil;
    anglethick.text = nil;
    dd5.textField.text = @"";
    dd5.tv.hidden = YES;
    dd6.textField.text = @"";
    dd6.tv.hidden = YES;
    [csteelh becomeFirstResponder];
    [csteelh resignFirstResponder];
    anglem.frame = CGRectMake(419, 855, 55, 31);
    anglepcs.frame = CGRectMake(497, 855, 55, 31);
    angleloss.frame = CGRectMake(576, 855, 55, 31);
    anglesmlabel.frame = CGRectMake(422, 826, 52, 21);
    anglespcslabel.frame = CGRectMake(509, 826, 34, 21);
    angleslosslabel.frame = CGRectMake(587, 826, 34, 21);

    dd6.textField.enabled = YES;
    dd5.textField.enabled = YES;

    CGRect sf5 = self.dd5.frame;
    CGRect sf6 = self.dd6.frame;
    sf5.size.height = 30;
    sf6.size.height = 30;
    self.dd5.frame = sf5;
    self.dd6.frame = sf6;
    CGRect frame5 = dd5.tv.frame;
    CGRect frame6 = dd6.tv.frame;
    frame5.size.height = 0;
    frame6.size.height = 0;
    dd5.tv.frame = frame5;
    dd6.tv.frame = frame6;
    dd5.tv.tag = 1;
    dd6.tv.tag = 1;
    DropDown1*drop;
    [drop dropdown];
    
}

-(void)Creat
{
    dd1 = [[DropDown1 alloc] initWithFrame:CGRectMake(260, 70, 140, 31)];
    dd1.textField.placeholder = @"C型鋼型號";
    ProfileSteel2Controller* weakSelf = self;
    dd1.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        weakSelf.x1.hidden = YES;
        weakSelf.x2.hidden = YES;
        weakSelf.x3.hidden = YES;
        weakSelf.x4.hidden = YES;
        weakSelf.csteelh.hidden = YES;
        weakSelf.csteelb.hidden = YES;
        weakSelf.csteelc.hidden = YES;
        weakSelf.csteelthick.hidden = YES;
        weakSelf.csteelclabel.hidden = YES;
        weakSelf.csteelblabel.hidden = YES;
        weakSelf.csteelhlabel.hidden = YES;
        weakSelf.csteelthicklabel.hidden = YES;
        
        weakSelf.csteelm.frame = CGRectMake(177, 140, 55, 31);
        weakSelf.csteelpcs.frame = CGRectMake(239, 140, 55, 31);
        weakSelf.csteelloss.frame = CGRectMake(301, 140, 55, 31);
        weakSelf.csteelmlabel.frame = CGRectMake(178, 111, 52, 21);
        weakSelf.csteelpcslabel.frame = CGRectMake(252, 111, 34, 21);
        weakSelf.csteellosslabel.frame = CGRectMake(312, 111, 34, 21);

        weakSelf.csteelm.text = nil;
        weakSelf.csteelpcs.text = nil;
        weakSelf.csteelloss.text = nil;
        weakSelf.csteel.text = nil;
    };;
    NSArray* arr1=[[NSArray alloc]initWithObjects:@"C120*50*20*3.0",@"C140*50*20*2.0",@"C140*50*20*2.5",@"C160*60*20*2.0",@"C160*60*20*2.2",@"C160*60*20*2.5",@"C160*60*20*3.0",@"C180*70*20*2.0",@"C180*70*20*2.2",@"C180*70*20*2.5",@"C180*70*20*3.0",@"C200*70*20*2.0",@"C200*70*20*2.2",@"C200*70*20*2.5",@"C200*70*20*3.0",@"C220*75*20*2.0",@"C220*75*20*2.2",@"C220*75*20*2.5",@"C220*75*20*3.0",@"C250*75*20*2.0",@"C250*75*20*2.2",@"C250*75*20*2.5",nil];
    dd1.tableArray = arr1;
    [self.view addSubview:dd1];
    
    
    dd2 = [[DropDown1 alloc] initWithFrame:CGRectMake(260, 422, 140, 31)];
    dd2.textField.placeholder = @"工字鋼型號";
    ProfileSteel2Controller* weakSelf3 = self;
    dd2.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        weakSelf3.girder.text = nil;
        weakSelf3.girderloss.text = nil;
        weakSelf3.girderpcs.text = nil;
        weakSelf3.girderm.text = nil;
    };;
    NSArray* arr2=[[NSArray alloc]initWithObjects:@"工10",@"工12.6",@"工14",@"工16",@"工18",@"工20a",@"工20b",@"工22a",@"工22b",@"工25a",@"工25b",@"工28a",@"工28b",@"工32a",@"工32b",@"工32c",@"工36a",@"工36b",@"工36c",@"工40a",@"工40b",@"工40c",@"工45a",@"工45b",@"工45c",@"工50a",@"工50b",@"工50c",@"工56a",@"工56b",@"工56c",@"工63a",@"工63b",@"工63c",nil];
    dd2.tableArray = arr2;
    [self.view addSubview:dd2];
    
    
    dd3 = [[DropDown1 alloc] initWithFrame:CGRectMake(260, 600, 140, 31)];
    dd3.textField.placeholder = @"槽鋼型號";
    ProfileSteel2Controller* weakSelf4 = self;
    dd3.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        weakSelf4.channel.text = nil;
        weakSelf4.channelloss.text = nil;
        weakSelf4.channelpcs.text = nil;
        weakSelf4.channelm.text = nil;
    };;
    NSArray* arr3=[[NSArray alloc]initWithObjects:@"〔5",@"〔6.3",@"〔8",@"〔10",@"〔12.6",@"〔14a",@"〔14b",@"〔16a",@"〔16b",@"〔18a",@"〔18b",@"〔20a",@"〔20b",@"〔22a",@"〔22b",@"〔25a",@"〔25b",@"〔25c",@"〔28a",@"〔28b",@"〔28c",@"〔32a",@"〔32b",@"〔32c",@"〔36a",@"〔36b",@"〔36c",@"〔30a",@"〔40b",@"〔40c",nil];
    dd3.tableArray = arr3;
    [self.view addSubview:dd3];
    
    
    dd4 = [[DropDown1 alloc] initWithFrame:CGRectMake(260, 247, 140, 31)];
    dd4.textField.placeholder = @"Z型鋼型號";
    ProfileSteel2Controller* weakSelf2 = self;
    dd4.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        weakSelf2.z1.hidden = YES;
        weakSelf2.z2.hidden = YES;
        weakSelf2.z3.hidden = YES;
        weakSelf2.z4.hidden = YES;
        weakSelf2.zsteelh.hidden = YES;
        weakSelf2.zsteelb.hidden = YES;
        weakSelf2.zsteelc.hidden = YES;
        weakSelf2.zsteelthick.hidden = YES;
        weakSelf2.zsteelclabel.hidden = YES;
        weakSelf2.zsteelblabel.hidden = YES;
        weakSelf2.zsteelhlabel.hidden = YES;
        weakSelf2.zsteelthicklabel.hidden = YES;
        
        weakSelf2.zsteelm.text = nil;
        weakSelf2.zsteelloss.text = nil;
        weakSelf2.zsteelpcs.text = nil;
        weakSelf2.zsteel.text = nil;
        
        weakSelf2.zsteelm.frame = CGRectMake(180, 317, 55, 31);
        weakSelf2.zsteelpcs.frame = CGRectMake(242, 317, 55, 31);
        weakSelf2.zsteelloss.frame = CGRectMake(304, 317, 55, 31);
        weakSelf2.zsteelmlabel.frame = CGRectMake(181, 288, 52, 21);
        weakSelf2.zsteelpcslabel.frame = CGRectMake(255, 288, 34, 21);
        weakSelf2.zsteellosslabel.frame = CGRectMake(315, 288, 34, 21);
    };;
    NSArray* arr4=[[NSArray alloc]initWithObjects:@"Z140*50*20*2.0",@"Z140*50*20*2.2",@"Z140*50*20*2.5",@"Z160*60*20*2.0",@"Z160*60*20*2.2",@"Z160*60*20*2.5",@"Z180*70*20*2.0",@"Z180*70*20*2.2",@"Z180*70*20*2.5",@"Z200*70*20*2.0",@"Z200*70*20*2.2",@"Z200*70*20*2.5",@"Z220*75*20*2.0",@"Z220*75*20*2.2",@"Z220*75*20*2.5",@"Z250*75*20*2.0",@"Z250*75*20*2.2",@"Z250*75*20*2.5",nil];
    dd4.tableArray = arr4;
    [self.view addSubview:dd4];
    
    
    dd5 = [[DropDown1 alloc] initWithFrame:CGRectMake(260, 782, 140, 31)];
    dd5.textField.placeholder = @"等邊角鋼型號";
    ProfileSteel2Controller* weakSelf5 = self;
    dd5.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        if (![dd5.textField.text  isEqualToString: @""])
        {
            dd6.textField.enabled = NO;
            dd6.tv.hidden = YES;
        }
        weakSelf5.angleside1.hidden = YES;
        weakSelf5.angleside2.hidden = YES;
        weakSelf5.anglethick.hidden = YES;
        weakSelf5.anglesside1label.hidden = YES;
        weakSelf5.anglesside2label.hidden = YES;
        weakSelf5.anglesthicklabel.hidden = YES;
        weakSelf5.a1.hidden = YES;
        weakSelf5.a2.hidden = YES;
        weakSelf5.a3.hidden = YES;
        
        weakSelf5.angleloss.text = nil;
        weakSelf5.angles.text = nil;
        weakSelf5.anglem.text = nil;
        weakSelf5.anglepcs.text = nil;
        
        weakSelf5.anglem.frame = CGRectMake(179, 855, 55, 31);
        weakSelf5. anglepcs.frame = CGRectMake(259, 855, 55, 31);
        weakSelf5.angleloss.frame = CGRectMake(338, 855, 55, 31);
        weakSelf5.anglesmlabel.frame = CGRectMake(180, 826, 52, 21);
        weakSelf5. anglespcslabel.frame = CGRectMake(272, 826, 34, 21);
        weakSelf5. angleslosslabel.frame = CGRectMake(352, 826, 34, 21);
    };;
    
    NSArray* arr5=[[NSArray alloc]initWithObjects:@"L 20*3",@"L 20*4",@"L 25*3",@"L 25*4",@"L 30*3",@"L 30*4",@"L 36*3",@"L 36*4",@"L 36*5",@"L 40*3",@"L 40*4",@"L 40*5",@"L 45*3",@"L 45*4",@"L 45*5",@"L 45*6",@"L 50*3",@"L 50*4",@"L 50*5",@"L 50*6",@"L 56*3",@"L 56*4",@"L 56*5",@"L 56*8",@"L 63*4",@"L 63*5",@"L 63*6",@"L 63*8",@"L 63*10",@"L 70*4",@"L 70*5",@"L 70*6",@"L 70*7",@"L 70*8",@"L 75*5",@"L 75*6",@"L 75*7",@"L 75*8",@"L 75*10",@"L 80*5",@"L 80*6",@"L 80*7",@"L 80*8",@"L 80*10",@"L 90*6",@"L 90*7",@"L 90*8",@"L 90*10",@"L 90*12",@"L 100*6",@"L 100*7",@"L 100*8",@"L 100*10",@"L 100*12",@"L 100*14",@"L 100*16",@"L 110*7",@"L 110*8",@"L 110*10",@"L 110*12",@"L 110*14",@"L 125*8",@"L 125*10",@"L 125*12",@"L 125*14",@"L 140*10",@"L 140*12",@"L 140*14",@"L 140*16",@"L 160*10",@"L 160*12",@"L 160*14",@"L 160*16",@"L 180*12",@"L 180*14",@"L 180*16",@"L 180*18",@"L 200*14",@"L 200*16",@"L 200*18",@"L 200*20",@"L 200*24",nil];
    dd5.tableArray = arr5;
    [self.view addSubview:dd5];
    
    
    dd6 = [[DropDown1 alloc] initWithFrame:CGRectMake(430, 782, 140, 31)];
    dd6.textField.placeholder = @"不等邊角鋼型號";
    ProfileSteel2Controller* weakSelf6 = self;
    dd6.didSelectIndexAction = ^void(DropDown1* view , NSIndexPath* indexPath)
    {
        if (![dd6.textField.text  isEqualToString: @""])
        {
            dd5.textField.enabled = NO;
            dd5.tv.hidden = YES;
        }
        weakSelf6.angleside1.hidden = YES;
        weakSelf6.angleside2.hidden = YES;
        weakSelf6.anglethick.hidden = YES;
        weakSelf6.anglesside1label.hidden = YES;
        weakSelf6.anglesside2label.hidden = YES;
        weakSelf6.anglesthicklabel.hidden = YES;
        weakSelf6.a1.hidden = YES;
        weakSelf6.a2.hidden = YES;
        weakSelf6.a3.hidden = YES;
        
        weakSelf6.angleloss.text = nil;
        weakSelf6.angles.text = nil;
        weakSelf6.anglem.text = nil;
        weakSelf6.anglepcs.text = nil;
        
        weakSelf6.anglem.frame = CGRectMake(179, 855, 55, 31);
        weakSelf6. anglepcs.frame = CGRectMake(259, 855, 55, 31);
        weakSelf6.angleloss.frame = CGRectMake(338, 855, 55, 31);
        weakSelf6.anglesmlabel.frame = CGRectMake(180, 826, 52, 21);
        weakSelf6. anglespcslabel.frame = CGRectMake(272, 826, 34, 21);
        weakSelf6. angleslosslabel.frame = CGRectMake(352, 826, 34, 21);
    };;
    
    NSArray* arr6=[[NSArray alloc]initWithObjects:@"L 25*10*3",@"L 25*10*4",@"L 32*20*3",@"L 32*20*4",@"L 40*25*3",@"L 40*25*4",@"L 45*28*3",@"L 45*28*4",@"L 50*32*3",@"L 50*32*4",@"L 56*36*3",@"L 56*36*4",@"L 56*36*5",@"L 63*40*4",@"L 63*40*5",@"L 63*40*6",@"L 63*40*7",@"L 70*45*4",@"L 70*45*5",@"L 70*45*6",@"L 70*45*7",@"L 75*50*5",@"L 75*50*6",@"L 75*50*8",@"L 75*50*10",@"L 80*50*5",@"L 80*50*6",@"L 80*50*7",@"L 80*50*8",@"L 90*56*5",@"L 90*56*6",@"L 90*56*7",@"L 90*56*8",@"L 100*63*6",@"L 100*63*7",@"L 100*63*8",@"L 100*63*10",@"L 100*80*6",@"L 100*80*7",@"L 100*80*8",@"L 100*80*10",@"L 110*70*6",@"L 110*70*7",@"L 110*70*8",@"L 110*70*10",@"L 125*80*7",@"L 125*80*8",@"L 125*80*10",@"L 125*80*12",@"L 140*90*8",@"L 140*90*10",@"L 140*90*12",@"L 140*90*14",@"L 160*100*10",@"L 160*100*12",@"L 160*100*14",@"L 160*100*16",@"L 180*110*10",@"L 180*110*12",@"L 180*110*14",@"L 180*110*16",@"L 200*125*12",@"L 200*125*14",@"L 200*125*16",@"L 200*125*18",nil];
    dd6.tableArray = arr6;
    [self.view addSubview:dd6];
}

-(void)Angles
{
//    angles.value = (0.00785 * anglethick.value * (angleside1.value + angleside2.value - anglethick.value)) * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
    
    if ([dd5.textField.text isEqualToString:@"L 20*3"]){
        angles.value = 0.89 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 20*4"]){
        angles.value = 1.14 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 25*3"]){
        angles.value = 1.12 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 25*4"]){
        angles.value = 1.46 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 30*3"]){
        angles.value = 1.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 30*4"]){
        angles.value = 1.79 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 36*3"]){
        angles.value = 1.65 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 36*4"]){
        angles.value = 2.16 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 36*5"]){
        angles.value = 2.65 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 40*3"]){
        angles.value = 1.85 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 40*4"]){
        angles.value = 2.42 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 40*5"]){
        angles.value = 2.98 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 45*3"]){
        angles.value = 2.09 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 45*4"]){
        angles.value = 2.74 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 45*5"]){
        angles.value = 3.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 45*6"]){
        angles.value = 3.98 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 50*3"]){
        angles.value = 2.33 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 50*4"]){
        angles.value = 3.06 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 50*5"]){
        angles.value = 3.77 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 50*6"]){
        angles.value = 4.46 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 56*3"]){
        angles.value = 2.62 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 56*4"]){
        angles.value = 3.45 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 56*5"]){
        angles.value = 4.25 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 56*8"]){
        angles.value = 6.57 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 63*4"]){
        angles.value = 3.91 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 63*5"]){
        angles.value = 4.82 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 63*6"]){
        angles.value = 5.72 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 63*8"]){
        angles.value = 7.47 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 63*10"]){
        angles.value = 9.15 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 70*4"]){
        angles.value = 4.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 70*5"]){
        angles.value = 5.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 70*6"]){
        angles.value = 6.41 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 70*7"]){
        angles.value = 7.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 70*8"]){
        angles.value = 8.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 75*5"]){
        angles.value = 5.82 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 75*6"]){
        angles.value = 6.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 75*7"]){
        angles.value = 7.98 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 75*8"]){
        angles.value = 9.03 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 75*10"]){
        angles.value = 11.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 80*5"]){
        angles.value = 6.21 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 80*6"]){
        angles.value = 7.38 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 80*7"]){
        angles.value = 8.52 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 80*8"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 80*10"]){
        angles.value = 11.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 90*6"]){
        angles.value = 8.35 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 90*7"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 90*8"]){
        angles.value = 10.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 90*10"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 90*12"]){
        angles.value = 15.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 100*6"]){
        angles.value = 9.37 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 100*7"]){
        angles.value = 10.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 100*8"]){
        angles.value = 12.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 100*10"]){
        angles.value = 15.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 100*12"]){
        angles.value = 17.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 100*14"]){
        angles.value = 20.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 100*16"]){
        angles.value = 23.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 110*7"]){
        angles.value = 11.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 110*8"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 110*10"]){
        angles.value = 16.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 110*12"]){
        angles.value = 19.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 110*14"]){
        angles.value = 22.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 125*8"]){
        angles.value = 15.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 125*10"]){
        angles.value = 19.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 125*12"]){
        angles.value = 22.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 125*14"]){
        angles.value = 26.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 140*10"]){
        angles.value = 21.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 140*12"]){
        angles.value = 25.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 140*14"]){
        angles.value = 29.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 140*16"]){
        angles.value = 33.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 160*10"]){
        angles.value = 24.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 160*12"]){
        angles.value = 29.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 160*14"]){
        angles.value = 34 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 160*16"]){
        angles.value = 38.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 180*12"]){
        angles.value = 33.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 180*14"]){
        angles.value = 38.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 180*16"]){
        angles.value = 43.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 180*18"]){
        angles.value = 48.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 200*14"]){
        angles.value = 42.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 200*16"]){
        angles.value = 48.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 200*18"]){
        angles.value = 54.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 200*20"]){
        angles.value = 60.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd5.textField.text isEqualToString:@"L 200*24"]){
        angles.value = 71.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 25*10*3"]){
        angles.value = 0.91 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 25*10*4"]){
        angles.value = 1.18 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 32*20*3"]){
        angles.value = 1.17 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 32*20*4"]){
        angles.value = 1.52 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 40*25*3"]){
        angles.value = 1.48 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 40*25*4"]){
        angles.value = 1.94 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 45*28*3"]){
        angles.value = 1.69 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 45*28*4"]){
        angles.value = 2.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 50*32*3"]){
        angles.value = 1.91 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 50*32*4"]){
        angles.value = 2.49 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 56*36*3"]){
        angles.value = 2.15 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 56*36*4"]){
        angles.value = 2.82 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 56*36*5"]){
        angles.value = 3.47 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 63*40*4"]){
        angles.value = 3.18 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 63*40*5"]){
        angles.value = 3.92 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 63*40*6"]){
        angles.value = 4.64 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 63*40*7"]){
        angles.value = 5.34 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 70*45*4"]){
        angles.value = 3.57 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 70*45*5"]){
        angles.value = 4.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 70*45*6"]){
        angles.value = 5.22 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 70*45*7"]){
        angles.value = 6.01 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 75*50*5"]){
        angles.value = 4.81 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 75*50*6"]){
        angles.value = 5.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 75*50*8"]){
        angles.value = 7.43 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 75*50*10"]){
        angles.value = 9.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 80*50*5"]){
        angles.value = 5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 80*50*6"]){
        angles.value = 5.93 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 80*50*7"]){
        angles.value = 6.85 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 80*50*8"]){
        angles.value = 7.74 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 90*56*5"]){
        angles.value = 5.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 90*56*6"]){
        angles.value = 6.72 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 90*56*7"]){
        angles.value = 7.76 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 90*56*8"]){
        angles.value = 8.78 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*63*6"]){
        angles.value = 7.55 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*63*7"]){
        angles.value = 8.72 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*63*8"]){
        angles.value = 9.88 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*63*10"]){
        angles.value = 12.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*80*6"]){
        angles.value = 8.35 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*80*7"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*80*8"]){
        angles.value = 10.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 100*80*10"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 110*70*6"]){
        angles.value = 8.35 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 110*70*7"]){
        angles.value = 9.66 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 110*70*8"]){
        angles.value = 10.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 110*70*10"]){
        angles.value = 13.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 125*80*7"]){
        angles.value = 11.1 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 125*80*8"]){
        angles.value = 12.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 125*80*10"]){
        angles.value = 15.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 125*80*12"]){
        angles.value = 18.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 140*90*8"]){
        angles.value = 14.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 140*90*10"]){
        angles.value = 17.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 140*90*12"]){
        angles.value = 20.7 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 140*90*14"]){
        angles.value = 23.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 160*100*10"]){
        angles.value = 19.9 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 160*100*12"]){
        angles.value = 23.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 160*100*14"]){
        angles.value = 27.2 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 160*100*16"]){
        angles.value = 30.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 180*110*10"]){
        angles.value = 22.3 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 180*110*12"]){
        angles.value = 26.5 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 180*110*14"]){
        angles.value = 30.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 180*110*16"]){
        angles.value = 34.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 200*125*12"]){
        angles.value = 29.8 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 200*125*14"]){
        angles.value = 34.4 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 200*125*16"]){
        angles.value = 39 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }else if([dd6.textField.text isEqualToString:@"L 200*125*18"]){
        angles.value = 43.6 * anglem.value * anglepcs.value * (angleloss.value / 100 + 1);
        
    }
}

-(void)Csteel
{
    if ([dd1.textField.text isEqualToString:@""]) {
    csteel.value = (0.00785 * csteelthick.value * (csteelh.value + 2 * csteelb.value + 2 * csteelc.value)) * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else{
        
    if ([dd1.textField.text isEqualToString:@"C120*50*20*3.0"]){
        csteel.value = 5.57 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
    
    }else if([dd1.textField.text isEqualToString:@"C140*50*20*2.0"]){
        csteel.value = 4.14 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C140*50*20*2.5"]){
        csteel.value = 5.09 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C160*60*20*2.0"]){
        csteel.value = 4.76 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C160*60*20*2.2"]){
        csteel.value = 5.21 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C160*60*20*2.5"]){
        csteel.value = 5.87 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C160*60*20*3.0"]){
        csteel.value = 6.98 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C180*70*20*2.0"]){
        csteel.value = 5.39 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C180*70*20*2.2"]){
        csteel.value = 5.9 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C180*70*20*2.5"]){
        csteel.value = 6.66 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C180*70*20*3"]){
        csteel.value = 7.92 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C200*70*20*2.0"]){
        csteel.value = 5.71 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C200*70*20*2.2"]){
        csteel.value = 6.25 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C200*70*20*2.5"]){
        csteel.value = 7.05 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C200*70*20*3.0"]){
        csteel.value = 8.4 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C220*75*20*2.0"]){
        csteel.value = 6.18 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C220*75*20*2.2"]){
        csteel.value = 6.77 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C220*75*20*2.5"]){
        csteel.value = 7.64 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C220*75*20*3.0"]){
        csteel.value = 8.86 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C250*75*20*2.0"]){
        csteel.value = 6.62 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C250*75*20*2.2"]){
        csteel.value = 7.27 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
    }else if([dd1.textField.text isEqualToString:@"C250*75*20*2.5"]){
        csteel.value = 8.23 * csteelm.value * csteelpcs.value * (csteelloss.value / 100 + 1);
        
        }
    }
}

-(void)Zsteel
{
    if ([dd4.textField.text isEqualToString:@"Z140*50*20*2.0"]){
        zsteel.value = 4.233 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
    
    }else if([dd4.textField.text isEqualToString:@"Z140*50*20*2.2"]){
        zsteel.value = 4.638 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z140*50*20*2.5"]){
        zsteel.value = 5.24 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z160*60*20*2.0"]){
        zsteel.value = 4.861 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z160*60*20*2.2"]){
        zsteel.value = 5.329 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
    
    }else if([dd4.textField.text isEqualToString:@"Z160*60*20*2.5"]){
        zsteel.value = 6.025 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z180*70*20*2.0"]){
        zsteel.value = 5.489 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z180*70*20*2.2"]){
        zsteel.value = 6.02 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z180*70*20*2.5"]){
        zsteel.value = 6.81 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);

    }else if([dd4.textField.text isEqualToString:@"Z200*70*20*2.0"]){
        zsteel.value = 5.803 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z200*70*20*2.2"]){
        zsteel.value = 6.305 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z200*70*20*2.5"]){
        zsteel.value = 7.203 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z220*75*20*2.0"]){
        zsteel.value = 6.274 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z220*75*20*2.2"]){
        zsteel.value = 6.884 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z220*75*20*2.5"]){
        zsteel.value = 7.792 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);

    }else if([dd4.textField.text isEqualToString:@"Z250*75*20*2.0"]){
        zsteel.value = 6.745 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z250*75*20*2.2"]){
        zsteel.value = 7.402 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else if([dd4.textField.text isEqualToString:@"Z250*75*20*2.5"]){
        zsteel.value = 8.28 * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
        
    }else{
        zsteel.value = (0.00785 * zsteelthick.value * (zsteelh.value + 2 * zsteelb.value + 2 * zsteelc.value)) * zsteelm.value * zsteelpcs.value * (zsteelloss.value / 100 + 1);
    }
    
}
-(void)Girder
{
    if ([dd2.textField.text isEqualToString:@"工10"]){
        girder.value = 11.2 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工12.6"]){
        girder.value = 14.2 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工14"]){
        girder.value = 16.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工16"]){
        girder.value = 20.5 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工18"]){
        girder.value = 24.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工20a"]){
        girder.value = 27.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工20b"]){
        girder.value = 31.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工22a"]){
        girder.value = 33 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工22b"]){
        girder.value = 36.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工25a"]){
        girder.value = 38.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工25b"]){
        girder.value = 42 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工28a"]){
        girder.value = 43.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工28b"]){
        girder.value = 47.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
        
    }else if ([dd2.textField.text isEqualToString:@"工32a"]){
        girder.value = 52.7 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工32b"]){
        girder.value = 57.7 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工32c"]){
        girder.value = 62.8 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工36a"]){
        girder.value = 59.9 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工36b"]){
        girder.value = 65.6 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工36c"]){
        girder.value = 71.2 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工40a"]){
        girder.value = 67.6 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工40b"]){
        girder.value = 73.8 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工40c"]){
        girder.value = 80.1 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工45a"]){
        girder.value = 80.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工45b"]){
        girder.value = 87.4 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工45c"]){
        girder.value = 94.5 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工50a"]){
        girder.value = 93.6 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工50b"]){
        girder.value = 101 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工50c"]){
        girder.value = 109 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工56a"]){
        girder.value = 106 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工56b"]){
        girder.value = 115 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工56c"]){
        girder.value = 124 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    
    }else if ([dd2.textField.text isEqualToString:@"工63a"]){
        girder.value = 122 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);

    }else if ([dd2.textField.text isEqualToString:@"工63b"]){
        girder.value = 131 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);

    }else if ([dd2.textField.text isEqualToString:@"工63c"]){
        girder.value = 141 * girderm.value * girderpcs.value * (girderloss.value / 100 + 1);
    }
}
-(void)Channel
{
    if ([dd3.textField.text isEqualToString:@"〔5"]){
        channel.value = 5.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔6.3"]){
        channel.value = 6.6 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔8"]){
        channel.value = 8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔10"]){
        channel.value = 10 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔12.6"]){
        channel.value = 12.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔14a"]){
        channel.value = 14.5 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔14b"]){
        channel.value = 16.7 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔16a"]){
        channel.value = 17.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔16b"]){
        channel.value = 19.7 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔18a"]){
        channel.value = 20.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔18b"]){
        channel.value = 23 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔20a"]){
        channel.value = 22.6 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔20b"]){
        channel.value = 25.8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔22a"]){
        channel.value = 25 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔22b"]){
        channel.value = 28.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔25a"]){
        channel.value = 27.5 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔25b"]){
        channel.value = 31.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔25c"]){
        channel.value = 35.3 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔28a"]){
        channel.value = 31.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔28b"]){
        channel.value = 35.8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔28c"]){
        channel.value = 40.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔32a"]){
        channel.value = 38.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔32b"]){
        channel.value = 43.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔32c"]){
        channel.value = 48.3 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔36a"]){
        channel.value = 47.8 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔36b"]){
        channel.value = 53.4 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔36c"]){
        channel.value = 59.1 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔40a"]){
        channel.value = 58.9 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔40b"]){
        channel.value = 65.2 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
        
    }else if([dd3.textField.text isEqualToString:@"〔40c"]){
        channel.value = 71.5 * channelm.value * channelpcs.value * (channelpcs.value / 100 + 1);
    }
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
    dd5.tv.hidden = YES;
    dd6.tv.hidden = YES;
    dd1.tv.tag = 1;
    dd2.tv.tag = 1;
    dd3.tv.tag = 1;
    dd4.tv.tag = 1;
    dd5.tv.tag = 1;
    dd6.tv.tag = 1;
    CGRect sf1 = self.dd1.frame;
    CGRect sf2 = self.dd2.frame;
    CGRect sf3 = self.dd3.frame;
    CGRect sf4 = self.dd4.frame;
    CGRect sf5 = self.dd5.frame;
    CGRect sf6 = self.dd6.frame;
    sf1.size.height = 30;
    sf2.size.height = 30;
    sf3.size.height = 30;
    sf4.size.height = 30;
    sf5.size.height = 30;
    sf6.size.height = 30;
    self.dd1.frame = sf1;
    self.dd2.frame = sf2;
    self.dd3.frame = sf3;
    self.dd4.frame = sf4;
    self.dd5.frame = sf5;
    self.dd6.frame = sf6;
    CGRect frame1 = dd1.tv.frame;
    CGRect frame2 = dd2.tv.frame;
    CGRect frame3 = dd3.tv.frame;
    CGRect frame4 = dd4.tv.frame;
    CGRect frame5 = dd5.tv.frame;
    CGRect frame6 = dd6.tv.frame;
    frame1.size.height = 0;
    frame2.size.height = 0;
    frame3.size.height = 0;
    frame4.size.height = 0;
    frame5.size.height = 0;
    frame6.size.height = 0;
    dd1.tv.frame = frame1;
    dd2.tv.frame = frame2;
    dd3.tv.frame = frame3;
    dd4.tv.frame = frame4;
    dd5.tv.frame = frame5;
    dd6.tv.frame = frame6;
    
    DropDown1*drop;
    [drop dropdown];
}

@end
