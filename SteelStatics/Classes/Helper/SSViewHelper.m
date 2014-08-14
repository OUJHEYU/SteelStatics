#import "SSViewHelper.h"
#import "AppInterface.h"



@implementation SSViewHelper



+(AddOrderButton*) getAddOrderButtonByActionKey: (NSString*)actionKey inView:(UIView*)view
{
    __block AddOrderButton* button = nil;
    [self iterateAddOrderButtonRecursively:view handler:^BOOL(AddOrderButton *btn) {
        if ([btn.actionKey isEqualToString: actionKey]) {
            button = btn;
            return YES;
        }
        return NO;
    }];
    return button;
}

+(void) iterateAddOrderButtonRecursively: (UIView*)view handler:(BOOL(^)(AddOrderButton* btn))handler
{
    for (UIView* viewObj in view.subviews) {
        if ([viewObj isKindOfClass:[AddOrderButton class]]) {
            if(handler((AddOrderButton*)viewObj)) return;
        } else {
            [SSViewHelper iterateAddOrderButtonRecursively: viewObj handler:handler];
        }
    }
}


+(void) iterateTextFieldRecursively: (UIView*)view handler:(void(^)(UITextField* tx))handler
{
    for (UIView* viewObj in view.subviews) {
        if ([viewObj isKindOfClass:[UITextField class]]) {
            handler((UITextField*)viewObj);
        } else {
            [SSViewHelper iterateTextFieldRecursively: viewObj handler:handler];
        }
    }
}


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

@end
