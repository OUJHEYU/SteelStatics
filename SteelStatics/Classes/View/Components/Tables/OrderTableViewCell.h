#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell

@property (strong) NSMutableDictionary* textFields;


-(void)setDatas:(NSDictionary *)values index:(NSUInteger)index;

@end
