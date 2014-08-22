#import "ValueView.h"
#import "AppInterface.h"


@implementation ValueView

-(void)awakeFromNib
{
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(NSString*) projectName
{
    NSString* value = [self getProjectNameTextField].text;
    return value == nil ? @"" : value;
}

-(NSString*) projectModelName
{
    UITextField* tx = [self getProjectModelNameTextField];
     NSString* value = tx.text;
    return value == nil ? @"" : value;
}

-(NSString*) quantity
{
    NSString* value = [self getQuantityTextField].text;
    return value == nil ? @"" : value;
}

-(NSString*) totalcaculate
{
    ValueTextField* qua = [[ValueTextField alloc]init];
    qua.text = [self getQuantityTextField].text;
    ValueTextField* unit = [[ValueTextField alloc]init];
    unit.text = [self getUnitTextField].text;
    ValueTextField* total = [[ValueTextField alloc]init];
    total.value = qua.value * unit.value;
    
    NSString* value = total.text;
    return value == nil ? @"" : value;
}

-(NSMutableDictionary*)getDatas
{
    NSDictionary* values = @{
                             @"PROJECT_NAME": [self projectName],
                             @"PROJECT_MODELNAME": [self projectModelName],
                             @"UINIT" : @"Kg",
                             @"QUANTITY" : [self quantity],
                             @"UNIT" : @"",
                             @"TOTAL" : [self totalcaculate],
                             };
    
    return [values mutableCopy];
}

-(BaseTextField*) getProjectNameTextField
{
    return [self getBaseTextFieldByKey:@"PROJECT_NAME"];
}

-(BaseTextField*) getProjectModelNameTextField
{
    return [self getBaseTextFieldByKey:@"PROJECT_MODELNAME"];
}
-(BaseTextField*) getQuantityTextField
{
    return [self getBaseTextFieldByKey:@"QUANTITY"];
}

-(BaseTextField*) getUnitTextField
{
    return [self getBaseTextFieldByKey:@"UNIT"];
}

-(BaseTextField*) getBaseTextFieldByKey:(NSString*)key
{
    return  [SSViewHelper getBaseTextFieldByAttributeKey: key inView:self];
}

@end
