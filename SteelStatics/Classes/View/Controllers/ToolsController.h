#import "BaseController.h"
@class CaculateTextField;
@class  BaseTextField;
@interface ToolsController : BaseController
// caculate field
@property (weak, nonatomic) IBOutlet CaculateTextField *total;

@property (weak, nonatomic) IBOutlet CaculateTextField *h1;
@property (weak, nonatomic) IBOutlet CaculateTextField *h2;
@property (weak, nonatomic) IBOutlet CaculateTextField *b;
@property (weak, nonatomic) IBOutlet CaculateTextField *water;

@property (weak, nonatomic) IBOutlet CaculateTextField *dropping;
@property (weak, nonatomic) IBOutlet CaculateTextField *wind;
@property (weak, nonatomic) IBOutlet CaculateTextField *side1;
@property (weak, nonatomic) IBOutlet CaculateTextField *side2;
@property (weak, nonatomic) IBOutlet CaculateTextField *addthick;
@property (weak, nonatomic) IBOutlet CaculateTextField *addpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *addear;
@property (weak, nonatomic) IBOutlet CaculateTextField *addsetwight;
@property (weak, nonatomic) IBOutlet CaculateTextField *addsetpcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *addsuppcs;
@property (weak, nonatomic) IBOutlet CaculateTextField *calwater;

// result field
@property (weak, nonatomic) IBOutlet BaseTextField *waterper;
@property (weak, nonatomic) IBOutlet BaseTextField *high;
@property (weak, nonatomic) IBOutlet BaseTextField *slant;
@property (weak, nonatomic) IBOutlet BaseTextField *percentage;




@end
