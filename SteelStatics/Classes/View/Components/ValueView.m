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

-(NSString*) length
{
    NSString* value = [self getLengthTextField].text;
    return value == nil ? @"" : value;
}

-(NSString*) loss
{
    NSString* value = [self getLossTextField].text;
    return value == nil ? @"" : value;
}


-(NSMutableDictionary*)getDatas
{
    NSMutableDictionary* values = [@{
                             @"PROJECT_NAME": [self projectName],
                             @"PROJECT_MODELNAME": [self projectModelName],
                             @"UINIT" : @"Kg",
                             @"QUANTITY" : [self quantity],
                             @"UNIT" : @"",
                             @"TOTAL" : @"",
                             @"LENGTH" : [self length],
                             @"LOSS" : [self loss],
                             } mutableCopy];
    
    
    NSMutableDictionary* caluateDictionary = [NSMutableDictionary dictionary];
    
    ValueCaluateView* valueCaluateView = [self getValueCaluateView];
    
    [SSViewHelper iterateSubViewRecursively:valueCaluateView subViewClazz:[CaculateTextField class] handler:^BOOL(UIView *view) {
        if ([view isKindOfClass:[CaculateTextField class]]) {
            CaculateTextField* tx = (CaculateTextField*)view;
            
            if (tx.hidden) {
                return NO;
            }
            NSString* txAttributeKey = tx.attributeKey;
            if (! txAttributeKey) txAttributeKey = @"TEMP";
            
            NSMutableArray* labelTexts = [NSMutableArray array];
            
            NSArray* labels = [ValueView getCenterXInScopeLabels: tx];
            
            if (labels.count == 1) {
                UILabel* label = [labels firstObject];
                NSString* labelText = label.text;
                
                [labelTexts addObject: labelText];
                
            } else if (labels.count == 2) {
                
                UILabel* label1 = [labels firstObject];
                UILabel* label2 = [labels lastObject];
                NSString* labelText1 = label1.text;
                NSString* labelText2 = label2.text;
                
                if (label1.originY < label2.originY) {
                    [labelTexts addObject: labelText1];
                    [labelTexts addObject: labelText2];
                } else {
                    [labelTexts addObject: labelText2];
                    [labelTexts addObject: labelText1];
                }
                
            }
        
            NSDictionary* datas = @{@"TextFiled": tx.text, @"Labels":labelTexts};
            
            [caluateDictionary setObject: datas forKey:txAttributeKey];
            
        }
        return NO;
    }];
    
    
    [values setObject: caluateDictionary forKey:@"FORMULA"];
    
    return values ;
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

-(BaseTextField*) getLengthTextField
{
    return [self getBaseTextFieldByKey:@"LENGTH"];
}

-(BaseTextField*) getLossTextField
{
    return [self getBaseTextFieldByKey:@"LOSS"];
}

-(BaseTextField*) getBaseTextFieldByKey:(NSString*)key
{
    return  [SSViewHelper getBaseTextFieldByAttributeKey: key inView:self];
}



-(ValueCaluateView*) getValueCaluateView
{
    __block ValueCaluateView* result = nil;
    [SSViewHelper iterateSubViewRecursively: self subViewClazz:[ValueCaluateView class] handler:^BOOL(UIView *view) {
        if ([view isKindOfClass:[ValueCaluateView class]]) {
            ValueCaluateView* temp = (ValueCaluateView*)view;
            result = temp;
            return YES;
        }
        return NO;
    }];
    return result;
}


+(NSArray*) getCenterXInScopeLabels: (UIView*)view
{
    NSMutableArray* labels = [NSMutableArray array];
    
    CGFloat txCenterX = view.centerX;
    for (UIView* subView in view.superview.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)subView;
            
            if (label.hidden) {
                return NO;
            }
            
            CGFloat labelCenterX = label.centerX;
            CGFloat scope = CanvasWidth(5);
            if (labelCenterX - scope <= txCenterX && txCenterX <= labelCenterX + scope) {
                [labels addObject: label];
            }
        }
    }
    
    return labels;
}

@end
