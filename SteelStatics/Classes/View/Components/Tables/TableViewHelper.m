#import "TableViewHelper.h"
#import "AppInterface.h"

@implementation TableViewHelper



+(UILabel*) createLabel: (NSString*)title frame:(CGRect)frame boldStstemFontOfSize:(CGFloat)fontsize
{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:fontsize];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    return label;
}

+(UITextField*) createText: (NSString*)title frame:(CGRect)frame enabled:(BOOL)enable size:(CGFloat)fontsize BorderWidth:(CGFloat)width
{
    
    UITextField *text = [[UITextField alloc]initWithFrame:frame];
    text.font = [UIFont fontWithName:@"Arial" size:fontsize];
    text.text = title;
    [text.layer setBorderWidth:width];
    text.enabled = enable;
    text.textAlignment = NSTextAlignmentCenter;
    return text;
}

+(UITextView*) createTextview: (NSString*)title frame:(CGRect)frame
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = [UIColor clearColor];
    textView.text = title;
    textView.font = [UIFont systemFontOfSize:CanvasFontSize(15)];
    textView.userInteractionEnabled = NO;
    [textView.layer setBorderWidth:0.5];
    return textView;
}


+(NSIndexPath*) getIndexPath: (UITableView*)tableView cellSubView:(UIView*)subview
{
    // get table cell
    
    UITableViewCell* cell = [TableViewHelper getTableViewCell: tableView cellSubView:subview];
    // get the index path
    NSIndexPath* indexPath = [tableView indexPathForCell: cell];
    return indexPath;
}

// get cell by cell's subview
+(UITableViewCell*) getTableViewCell: (UITableView*)tableView cellSubView:(UIView*)subview
{
    // get table cell
    UITableViewCell* cell = (UITableViewCell*)[subview superview];
    while (cell && ![cell isKindOfClass:[UITableViewCell class]]) cell = (UITableViewCell*)[cell superview];
    return cell;
}

@end
