#import "BaseController.h"
@class CaculateTextField;
@class  BaseTextField;
@class DropDown1;
@interface ProfileSteel2Controller : BaseController

// result field
@property (weak, nonatomic) IBOutlet BaseTextField *csteel;
@property (weak, nonatomic) IBOutlet BaseTextField *angles;
@property (weak, nonatomic) IBOutlet BaseTextField *girder;
@property (weak, nonatomic) IBOutlet BaseTextField *channel;
@property (weak, nonatomic) IBOutlet BaseTextField *zsteel;
//C型鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelh;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelb;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelc;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelthick;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *csteelloss;
//Z型鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelh;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelb;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelc;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelthick;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *zsteelloss;
//角鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *angleside1;
@property (weak, nonatomic) IBOutlet CaculateTextField *angleside2;
@property (weak, nonatomic) IBOutlet CaculateTextField *anglethick;
@property (weak, nonatomic) IBOutlet CaculateTextField *anglem;
@property (weak, nonatomic) IBOutlet CaculateTextField *anglepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *angleloss;
//工字鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *girderpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *girderloss;
@property (weak, nonatomic) IBOutlet CaculateTextField *girderm;
//槽鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *channelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *channelloss;
@property (weak, nonatomic) IBOutlet CaculateTextField *channelm;
//C Label
@property (weak, nonatomic) IBOutlet UILabel *csteelhlabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelblabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelclabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelthicklabel;
@property (weak, nonatomic) IBOutlet UILabel *x1;
@property (weak, nonatomic) IBOutlet UILabel *x2;
@property (weak, nonatomic) IBOutlet UILabel *x3;
@property (weak, nonatomic) IBOutlet UILabel *x4;
@property (weak, nonatomic) IBOutlet UILabel *csteelmlabel;
@property (weak, nonatomic) IBOutlet UILabel *csteelpcslabel;
@property (weak, nonatomic) IBOutlet UILabel *csteellosslabel;
//Z Label
@property (weak, nonatomic) IBOutlet UILabel *zsteelhlabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelblabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelclabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelthicklabel;
@property (weak, nonatomic) IBOutlet UILabel *z1;
@property (weak, nonatomic) IBOutlet UILabel *z2;
@property (weak, nonatomic) IBOutlet UILabel *z3;
@property (weak, nonatomic) IBOutlet UILabel *z4;
@property (weak, nonatomic) IBOutlet UILabel *zsteelmlabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteelpcslabel;
@property (weak, nonatomic) IBOutlet UILabel *zsteellosslabel;
//Angles Label
@property (weak, nonatomic) IBOutlet UILabel *anglesside1label;
@property (weak, nonatomic) IBOutlet UILabel *anglesside2label;
@property (weak, nonatomic) IBOutlet UILabel *anglesthicklabel;
@property (weak, nonatomic) IBOutlet UILabel *anglesmlabel;
@property (weak, nonatomic) IBOutlet UILabel *anglespcslabel;
@property (weak, nonatomic) IBOutlet UILabel *angleslosslabel;
@property (weak, nonatomic) IBOutlet UILabel *a1;
@property (weak, nonatomic) IBOutlet UILabel *a2;
@property (weak, nonatomic) IBOutlet UILabel *a3;


@end
