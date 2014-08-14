#import <Foundation/Foundation.h>

@class AddOrderButton;


@interface SSViewHelper : NSObject


+(AddOrderButton*) getAddOrderButtonByActionKey: (NSString*)actionKey inView:(UIView*)view;

+(void) iterateTextFieldRecursively: (UIView*)view handler:(void(^)(UITextField* tx))handler;



+(void) translateViewsFramesRecursive: (UIView*)view;
+(void) translateLabelFont: (UILabel*)label;


+(void) setViewsHiddenNO: (NSArray*)views;
+(void) setViewsHiddenYes: (NSArray*)views;
+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden;

@end
