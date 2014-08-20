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

-(NSMutableDictionary*)getDatas
{
    NSDictionary* values = @{
                             @"PROJECT_NAME": [self projectName],
                             @"PROJECT_MODELNAME": [self projectModelName],
                             @"UINIT" : @"個",
                             @"QUANTITY" : [self quantity],
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

-(BaseTextField*) getBaseTextFieldByKey:(NSString*)key
{
    return  [SSViewHelper getBaseTextFieldByAttributeKey: key inView:self];
}


@end
