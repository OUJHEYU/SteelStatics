#import <UIKit/UIKit.h>

@class DropDown1;
@class BaseTextField;
@class BaseController;

typedef void(^DropDownDidSelectIndexAction) (DropDown1* view , NSIndexPath* indexPath);



@interface DropDown1 : UIView <UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate> {
    CGFloat tabheight;//table下拉清單的高度
    CGFloat frameHeight;//frame的高度
}

@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) NSArray *tableArray;
@property (nonatomic,strong) BaseTextField *textField;




@property (copy) DropDownDidSelectIndexAction didSelectIndexAction ;


@end
