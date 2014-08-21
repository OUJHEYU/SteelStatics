#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell


-(void) setDatas:(NSDictionary *)values index:(NSUInteger)index;
-(NSDictionary*) getDatas;





-(void) setTextFieldsDelegate: (id<UITextFieldDelegate>)delegate;



@end
