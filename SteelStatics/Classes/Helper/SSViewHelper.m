#import "SSViewHelper.h"
#import "AppInterface.h"



@implementation SSViewHelper



+(AddOrderButton*) getAddOrderButtonByActionKey: (NSString*)actionKey inView:(UIView*)view
{
    __block AddOrderButton* button = nil;
    [self iterateAddOrderButtonRecursively:view handler:^BOOL(AddOrderButton *button) {
        if ([button.attributeKey isEqualToString: actionKey]) {
            button = button;
            return YES;
        }
        return NO;
    }];
    return button;
}

+(void) iterateAddOrderButtonRecursively: (UIView*)view handler:(BOOL(^)(AddOrderButton* button))handler
{
    for (UIView* viewObj in view.subviews) {
        if ([viewObj isKindOfClass:[AddOrderButton class]]) {
            if(handler((AddOrderButton*)viewObj)) return;
        } else {
            [SSViewHelper iterateAddOrderButtonRecursively: viewObj handler:handler];
        }
    }
}


+(void) iterateTextFieldRecursively: (UIView*)view handler:(void(^)(UITextField* textfield))handler
{
    for (UIView* viewObj in view.subviews) {
        if ([viewObj isKindOfClass:[UITextField class]]) {
            handler((UITextField*)viewObj);
        } else {
            [SSViewHelper iterateTextFieldRecursively: viewObj handler:handler];
        }
    }
}

+(void) iterateSubViewRecursively: (UIView*)view subViewClazz:(Class)subViewClazz handler:(BOOL(^)(UIView* view))handler
{
    for (UIView* viewObj in view.subviews) {
        if ([viewObj isKindOfClass:[subViewClazz class]]) {
            if (handler(viewObj)) return;
        } else {
            [SSViewHelper iterateSubViewRecursively: viewObj subViewClazz:subViewClazz handler:handler];
        }
    }
}



#pragma mark -

+(ValueView*) getValueView: (NSString*)attributeKey inView:(UIView*)inView
{
    __block ValueView* result = nil;
    [self iterateSubViewRecursively: inView subViewClazz:[ValueView class] handler:^BOOL(UIView *view) {
        ValueView* valueView = (ValueView*)view;
        if ([valueView.attributeKey isEqualToString: attributeKey]) {
            result = valueView;
            return YES;
        }
        return NO;
    }];
    return result;
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



+(BaseTextField*) createText: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled
{
    BaseTextField *textTextField = [[BaseTextField alloc]initWithFrame:frame];
    textTextField.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(15)];
    textTextField.text = title;
    [textTextField.layer setBorderWidth:0.5];
    textTextField.textAlignment = NSTextAlignmentCenter;
    textTextField.attributeKey = key;
    textTextField.enabled = enabled;
    return textTextField;
}



#pragma mark -

+(void) translateViewsFramesRecursive: (UIView*)view
{
    [FrameHelper setFrame:view.frame view:view];
    
    NSArray* subviews = [view subviews];
    for (UIView* subview in subviews) {
        if ([subview isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)subview;
            [self translateLabelFont: label];
        }
        [self translateViewsFramesRecursive: subview];
    }
}


+(void) translateLabelFont: (UILabel*)label
{
    UIFont* font = label.font;
    CGFloat fontSize = CanvasFontSize(font.pointSize);
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        fontSize -= 1.5;   // fontSize = fontSize - 2;
    }
    label.font = [font fontWithSize: fontSize];
}



#pragma mark -

+(void) setViewsHiddenNO: (NSArray*)views
{
    [self setViewsHidden: views hiden:NO];
}

+(void) setViewsHiddenYes: (NSArray*)views
{
    [self setViewsHidden: views hiden:YES];
}

+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden
{
    for (UIView* v in views) {
        v.hidden = hidden;
    }
}


#pragma mark -

+(void) clearTextField: (NSArray*)textFields
{
    for (UITextField* tx in textFields) {
        tx.text = nil;
    }
}


+(ValueView*) getSuperValueViewBySubView: (UIView*)subView
{
    ValueView* valueView = (ValueView*)subView.superview;
    while (valueView && ![valueView isKindOfClass:[ValueView class]]) {
        valueView = (ValueView*)valueView.superview;
    }
    return valueView;
}


+(ValueCaluateView*) getSuperValueCaculateViewBySubView: (UIView*)subView
{
    ValueCaluateView* valueView = (ValueCaluateView*)subView.superview;
    while (valueView && ![valueView isKindOfClass:[ValueCaluateView class]]) {
        valueView = (ValueCaluateView*)valueView.superview;
    }
    return valueView;
}




#pragma mark -
/**
 *  make the fist responser(u don't know who) loose its focus
 *
 *  @param containerView the view visible
 */
+(void) resignFirstResponserOnView: (UIView*)containerView
{
    // just a trick , make the fist responser(u don't know who) loose its focus
    UITextField* invisibleTextField = [[UITextField alloc] initWithFrame: CGRectZero];
    invisibleTextField.hidden = YES;
    [containerView addSubview: invisibleTextField];
    [invisibleTextField becomeFirstResponder];
    [invisibleTextField resignFirstResponder];
    [invisibleTextField removeFromSuperview];
}

@end
