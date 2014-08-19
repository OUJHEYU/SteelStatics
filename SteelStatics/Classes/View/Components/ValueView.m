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
    return [self getProjectNameTextField].text;
}


-(BaseTextField*) getProjectModelNameTextField
{
    return  [ValueView getBaseTextFieldByAttributeKey: @"PROJECT_MODELNAME" inView:self];
    
}

-(BaseTextField*) getProjectNameTextField
{
    return  [ValueView getBaseTextFieldByAttributeKey: @"PROJECT_NAME" inView:self];
    
}

+(BaseTextField*) getBaseTextFieldByAttributeKey:(NSString*)attributeKey inView:(UIView*)inView
{
    __block BaseTextField* result = nil;
    [SSViewHelper iterateSubViewRecursively: inView subViewClazz:[BaseTextField class] handler:^BOOL(UIView *view) {
        BaseTextField* textField = (BaseTextField*) view;
        if ([textField.attributeKey isEqualToString:attributeKey]) {
            result = textField;
            return YES;
        }
        return NO;
    }];
    return result;
}

@end
