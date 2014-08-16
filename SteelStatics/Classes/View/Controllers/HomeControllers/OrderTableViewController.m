#import "OrderTableViewController.h"
#import "AppInterface.h"


#define REUSEIDENTIFIER @"reuseIdentifier"

@implementation OrderTableViewController

@synthesize dataContents;


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView setSeparatorInset:UIEdgeInsetsZero ];
    [self.tableView setSeparatorColor:[UIColor grayColor]];
    
    [GestureHelper addGestureToView: self.view];
    NSArray* temp = @[@[@"01",@"H型鋼",@"HN",@"個",@"10",@"130,000"], @[@"02",@"H型鋼",@"HN",@"個",@"10",@"130,000"]];
    dataContents = [[NSMutableArray alloc] init];
    [dataContents addObjectsFromArray: temp];
    
//    self.tableView.allowsSelection=NO;
    [self setExtraCellLineHidden:self.tableView];
    [self.tableView registerClass:[OrderTableViewCell class] forCellReuseIdentifier: REUSEIDENTIFIER];
}


#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CanvasHeight(30);
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CanvasHeight(50);
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* label = [self createLabel:@"工程報價單" frame:CanvasRect(0,0,0,0) setBorderWidth:CanvasWidth(3)];
    return label;
}


- (void)setExtraCellLineHidden: (UITableView *)tableView

{
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataContents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSEIDENTIFIER forIndexPath:indexPath];
    
    NSArray* rowContents = [dataContents objectAtIndex: indexPath.row];
    
    NSArray* textFields = [cell textFields];
    for (int i = 0; i < textFields.count; i++) {
        UITextField* tf = textFields[i];
        if (i < rowContents.count) {
            tf.text = rowContents[i];
        }
    }
    // Configure the cell...
    return cell;
}

// ----------------------- Delete Begin -----------------------
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [dataContents removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }   
}


- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"刪除";
}
// ----------------------- Delete Begin -----------------------
-(UILabel*) createLabel: (NSString*)title frame:(CGRect)frame setBorderWidth:(CGFloat)widthsize
{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:CanvasFontSize(30)];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor whiteColor];
    [[label layer] setBorderWidth:widthsize];
    return label;
}


- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - Table view delegate


@end
