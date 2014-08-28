#import <UIKit/UIKit.h>
@class BaseTextField;
@interface FormulaView : UIView

-(void) clearDatas;

-(void) setDatas:(NSDictionary*) dictionary;
-(void) show;
-(void) hide;
@end
