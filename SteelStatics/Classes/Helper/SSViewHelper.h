#import <Foundation/Foundation.h>

@class AddOrderButton;
@class BaseTextField;


@class ValueView;
@class ValueCaluateView;


@interface SSViewHelper : NSObject


+(AddOrderButton*) getAddOrderButtonByActionKey: (NSString*)actionKey inView:(UIView*)view;
+(void) iterateAddOrderButtonRecursively: (UIView*)view handler:(BOOL(^)(AddOrderButton* button))handler;

+(void) iterateTextFieldRecursively: (UIView*)view handler:(void(^)(UITextField* textfield))handler;

+(void) iterateSubViewRecursively: (UIView*)view subViewClazz:(Class)subViewClazz handler:(BOOL(^)(UIView* view))handler;



+(ValueView*) getValueView: (NSString*)attributeKey inView:(UIView*)inView;;
+(BaseTextField*) getBaseTextFieldByAttributeKey:(NSString*)attributeKey inView:(UIView*)inView;


+(BaseTextField*) createText: (NSString*)title frame:(CGRect)frame key:(NSString*)key enable:(BOOL)enabled;

#pragma mark -

+(void) translateViewsFramesRecursive: (UIView*)view;
+(void) translateLabelFont: (UILabel*)label;


+(void) setViewsHiddenNO: (NSArray*)views;
+(void) setViewsHiddenYes: (NSArray*)views;
+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden;


#pragma mark -

+(void) clearTextField: (NSArray*)textFields;
+(ValueView*) getSuperValueViewBySubView: (UIView*)subView;
+(ValueCaluateView*) getSuperValueCaculateViewBySubView: (UIView*)subView;




+(void) resignFirstResponserOnView: (UIView*)containerView;



@end
