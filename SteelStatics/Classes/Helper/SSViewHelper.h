#import <Foundation/Foundation.h>

@class AddOrderButton;
@class ValueView;
@class BaseTextField;


@interface SSViewHelper : NSObject


+(AddOrderButton*) getAddOrderButtonByActionKey: (NSString*)actionKey inView:(UIView*)view;
+(void) iterateAddOrderButtonRecursively: (UIView*)view handler:(BOOL(^)(AddOrderButton* button))handler;

+(void) iterateTextFieldRecursively: (UIView*)view handler:(void(^)(UITextField* textfield))handler;

+(void) iterateSubViewRecursively: (UIView*)view subViewClazz:(Class)subViewClazz handler:(BOOL(^)(UIView* view))handler;



+(ValueView*) getValueView: (NSString*)attributeKey inView:(UIView*)inView;;
+(BaseTextField*) getBaseTextFieldByAttributeKey:(NSString*)attributeKey inView:(UIView*)inView;



+(void) translateViewsFramesRecursive: (UIView*)view;
+(void) translateLabelFont: (UILabel*)label;


+(void) setViewsHiddenNO: (NSArray*)views;
+(void) setViewsHiddenYes: (NSArray*)views;
+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden;

+(void) clearTextField: (NSArray*)textFields;


+(void) resignFirstResponserOnView: (UIView*)containerView;



@end
