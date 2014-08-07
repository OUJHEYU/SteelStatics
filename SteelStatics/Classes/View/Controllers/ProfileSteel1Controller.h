#import "BaseController.h"
@class CaculateTextField;
@class  BaseTextField;
@class DropDown1;
@interface ProfileSteel1Controller : BaseController

//H型鋼對稱 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteelloss;
//H型鋼不對稱 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2h;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2b1;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2b2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2tw;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2t1;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2t2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2m;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2pcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *hsteel2loss;
//矩形管 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipelong;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipeshort;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipethick;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipem;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *rectanglepipeloss;
//圓管 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipediamter;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipethick;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipem;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipeloss;
//圓鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteeldiamter;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelloss;
// result field
@property (weak, nonatomic) IBOutlet BaseTextField *circlesteel;
@property (weak, nonatomic) IBOutlet BaseTextField *circlepipe;
@property (weak, nonatomic) IBOutlet BaseTextField *hsteel2;
@property (weak, nonatomic) IBOutlet BaseTextField *hsteel;
@property (weak, nonatomic) IBOutlet BaseTextField *rectanglepipe;
//矩形管 Label
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipelonglabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipeshortlabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipethicklabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipemlabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipepcslabel;
@property (weak, nonatomic) IBOutlet UILabel *rectanglepipelosslabel;
@property (weak, nonatomic) IBOutlet UILabel *r1;
@property (weak, nonatomic) IBOutlet UILabel *r2;
@property (weak, nonatomic) IBOutlet UILabel *r3;
@property (weak, nonatomic) IBOutlet UILabel *r4;
//圓鋼 Label
@property (weak, nonatomic) IBOutlet UILabel *circlesteeldiamterlabel;
@property (weak, nonatomic) IBOutlet UILabel *circlesteelmlabel;
@property (weak, nonatomic) IBOutlet UILabel *circlesteelpcslabel;
@property (weak, nonatomic) IBOutlet UILabel *circlesteellosslabel;
@property (weak, nonatomic) IBOutlet UILabel *c1;


@end
