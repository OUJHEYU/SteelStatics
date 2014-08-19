#import "CaculateBaseController.h"

@class BaseTextField;
@class ValueTextField;
@class CaculateTextField;

@interface PaintController : CaculateBaseController

//鋼板 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *boardl;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardw;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardh;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardpaintprice;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardpaintarea;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardpercentage;
@property (weak, nonatomic) IBOutlet CaculateTextField *boardpaintface;
//圓管 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipediamter;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipethick;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipem;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipepcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipepaintprice;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipepaintface;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlepipepercentage;
//圓鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteeldiamter;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelpaintprice;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelpaintface;
@property (weak, nonatomic) IBOutlet CaculateTextField *circlesteelpercentage;
//H型鋼 caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelh2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelb;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelt1;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelt2;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelm;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelpaintprice;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelpaintface;
@property (weak, nonatomic) IBOutlet CaculateTextField *hseelpercentage;

//Base field
@property (weak, nonatomic) IBOutlet ValueTextField *hsteelneedl;
@property (weak, nonatomic) IBOutlet ValueTextField *hsteelneedkg;
@property (weak, nonatomic) IBOutlet ValueTextField *hsteelton;
@property (weak, nonatomic) IBOutlet ValueTextField *hsteelprice;
@property (weak, nonatomic) IBOutlet ValueTextField *circlepipeneedl;
@property (weak, nonatomic) IBOutlet ValueTextField *circlepipeeedkg;
@property (weak, nonatomic) IBOutlet ValueTextField *circlepipeton;
@property (weak, nonatomic) IBOutlet ValueTextField *circlepipeprice;
@property (weak, nonatomic) IBOutlet ValueTextField *circlesteelneedl;
@property (weak, nonatomic) IBOutlet ValueTextField *circlesteelneedkg;
@property (weak, nonatomic) IBOutlet ValueTextField *circlesteelton;
@property (weak, nonatomic) IBOutlet ValueTextField *circlesteelprice;
@property (weak, nonatomic) IBOutlet ValueTextField *boardneedl;
@property (weak, nonatomic) IBOutlet ValueTextField *boardneedkg;
@property (weak, nonatomic) IBOutlet ValueTextField *boardton;
@property (weak, nonatomic) IBOutlet ValueTextField *boardprice;

@end
