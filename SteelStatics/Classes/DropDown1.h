#import <UIKit/UIKit.h>
#import "AppInterface.h"
@class DropDown1;
@class BaseController;
typedef void(^DropDownDidSelectIndexAction) (DropDown1* view , NSIndexPath* indexPath);



@interface DropDown1 : UIView <UITableViewDelegate,UITableViewDataSource> {
    UITableView *tv;//下拉清單
    NSArray *tableArray;//下拉清單資料
    UITextField *textField;//文本輸入框
    BOOL showList;//是否彈出下拉清單
    CGFloat tabheight;//table下拉清單的高度
    CGFloat frameHeight;//frame的高度
}

@property (nonatomic,retain) UITableView *tv;
@property (nonatomic,retain) NSArray *tableArray;
@property (nonatomic,retain) UITextField *textField;




@property (copy) DropDownDidSelectIndexAction didSelectIndexAction ;

-(void)dropdown;


@end
