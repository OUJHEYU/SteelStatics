#import "BaseController.h"
@class CaculateTextField;
@class  BaseTextField;
@interface PaintController : BaseController

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
@property (weak, nonatomic) IBOutlet BaseTextField *hsteelneedl;
@property (weak, nonatomic) IBOutlet BaseTextField *hsteelneedkg;
@property (weak, nonatomic) IBOutlet BaseTextField *hsteelton;
@property (weak, nonatomic) IBOutlet BaseTextField *hsteelprice;
@property (weak, nonatomic) IBOutlet BaseTextField *circlepipeneedl;
@property (weak, nonatomic) IBOutlet BaseTextField *circlepipeeedkg;
@property (weak, nonatomic) IBOutlet BaseTextField *circlepipeton;
@property (weak, nonatomic) IBOutlet BaseTextField *circlepipeprice;
@property (weak, nonatomic) IBOutlet BaseTextField *circlesteelneedl;
@property (weak, nonatomic) IBOutlet BaseTextField *circlesteelneedkg;
@property (weak, nonatomic) IBOutlet BaseTextField *circlesteelton;
@property (weak, nonatomic) IBOutlet BaseTextField *circlesteelprice;
@property (weak, nonatomic) IBOutlet BaseTextField *boardneedl;
@property (weak, nonatomic) IBOutlet BaseTextField *boardneedkg;
@property (weak, nonatomic) IBOutlet BaseTextField *boardton;
@property (weak, nonatomic) IBOutlet BaseTextField *boardprice;

@end
