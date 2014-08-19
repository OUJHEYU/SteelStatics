#import <Foundation/Foundation.h>

@class AddOrderButton;


@interface SSViewHelper : NSObject


+(AddOrderButton*) getAddOrderButtonByActionKey: (NSString*)actionKey inView:(UIView*)view;
+(void) iterateAddOrderButtonRecursively: (UIView*)view handler:(BOOL(^)(AddOrderButton* button))handler;

+(void) iterateTextFieldRecursively: (UIView*)view handler:(void(^)(UITextField* textfield))handler;

+(void) iterateSubViewRecursively: (UIView*)view subViewClazz:(Class)subViewClazz handler:(BOOL(^)(UIView* view))handler;



+(void) translateViewsFramesRecursive: (UIView*)view;
+(void) translateLabelFont: (UILabel*)label;


+(void) setViewsHiddenNO: (NSArray*)views;
+(void) setViewsHiddenYes: (NSArray*)views;
+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden;

@end
