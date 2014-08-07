#import "BaseController.h"
@class CaculateTextField;
@class  BaseTextField;
@interface RolledSteelController : BaseController
//鋼柱 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *pillarh1;
@property (weak, nonatomic) IBOutlet CaculateTextField *pillarh2;
@property (weak, nonatomic) IBOutlet CaculateTextField *pillarb;
@property (weak, nonatomic) IBOutlet CaculateTextField *pillart1;
@property (weak, nonatomic) IBOutlet CaculateTextField *pillart2;
@property (weak, nonatomic) IBOutlet CaculateTextField *pillarm;
@property (weak, nonatomic) IBOutlet CaculateTextField *pillarpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *pillarloss;
//鋼樑 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeh1;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeh2;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeb;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridget1;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridget2;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgewater;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgem;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *bridgeloss;
//天車樑caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadmidl;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadw;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadtopl;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadtopw;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadlowerl;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadlowerw;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadoxh;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadm;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *overheadloss;
//鋼板caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *boardl;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardw;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardh;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardloss;
//成型鋼caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *typeunits;
@property (weak, nonatomic) IBOutlet CaculateTextField *typem;
@property (weak, nonatomic) IBOutlet CaculateTextField *typepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *typeloss;

//result field
@property (weak, nonatomic) IBOutlet BaseTextField *type;
@property (weak, nonatomic) IBOutlet BaseTextField *board;
@property (weak, nonatomic) IBOutlet BaseTextField *overhead;
@property (weak, nonatomic) IBOutlet BaseTextField *bridge;
@property (weak, nonatomic) IBOutlet BaseTextField *pillar;


@end
