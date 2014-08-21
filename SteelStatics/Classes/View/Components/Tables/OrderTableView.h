#import <UIKit/UIKit.h>


#define isNotEmpty(_string) _string != NULL && ![_string isEqualToString:@""]


@interface OrderTableView : UITableView <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>


@property (strong) NSMutableArray* cellsDataContents;


@end
