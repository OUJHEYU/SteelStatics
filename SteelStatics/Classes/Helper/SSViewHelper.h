#import <Foundation/Foundation.h>

@interface SSViewHelper : NSObject

+(void) iterateTextFieldRecursively: (UIView*)view handler:(void(^)(UITextField* tx))handler;



+(void) translateViewsFramesRecursive: (UIView*)view;
+(void) translateLabelFont: (UILabel*)label;


+(void) setViewsHiddenNO: (NSArray*)views;
+(void) setViewsHiddenYes: (NSArray*)views;
+(void) setViewsHidden: (NSArray*)views hiden:(BOOL)hidden;

@end
