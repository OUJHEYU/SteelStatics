#import "BaseController.h"

@class BaseTextField;
@class CaculateTextField;

@interface SteelColumnController : BaseController


// caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *h2TextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *bTextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *t1TextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *t2TextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *lenghtTextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *countTextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *consumedTextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *paintUnitTextField;
@property (weak, nonatomic) IBOutlet CaculateTextField *paintAreaTextField;


// result field
@property (weak, nonatomic) IBOutlet BaseTextField *unitWightTx;


@end
