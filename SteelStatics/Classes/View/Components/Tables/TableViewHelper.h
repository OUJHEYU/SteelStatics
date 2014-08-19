#import <Foundation/Foundation.h>

@interface TableViewHelper : NSObject


+(UILabel*) createLabel: (NSString*)title frame:(CGRect)frame boldStstemFontOfSize:(CGFloat)fontsize;

+(UITextField*) createText: (NSString*)title frame:(CGRect)frame enabled:(BOOL)enable size:(CGFloat)fontsize BorderWidth:(CGFloat)width;


+(UITextView*) createTextview: (NSString*)title frame:(CGRect)frame;



@end