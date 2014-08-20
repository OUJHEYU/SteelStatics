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



-(NSMutableDictionary*)getDatas
{
    NSDictionary* values = @{
                             @"PROJECT_NAME": [self projectName],
                             @"PROJECT_MODELNAME": [self projectModelName],
                             @"UINIT" : @"個",
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


-(BaseTextField*) getBaseTextFieldByKey:(NSString*)key
{
    return  [SSViewHelper getBaseTextFieldByAttributeKey: key inView:self];
}


@end
