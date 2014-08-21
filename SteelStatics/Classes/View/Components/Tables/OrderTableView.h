#import <UIKit/UIKit.h>

@interface OrderTableView : UITableView <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>


@property (strong) NSMutableArray* cellsDataContents;


@end
