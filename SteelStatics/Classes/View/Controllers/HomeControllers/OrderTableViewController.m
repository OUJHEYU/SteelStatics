#import "OrderTableViewController.h"
#import "AppInterface.h"

#define REUSEIDENTIFIER @"reuseIdentifier"

@implementation OrderTableViewController

@synthesize dataContents;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [GestureHelper addGestureToView: self.view];
    NSArray* temp = @[@[@"序號",@"項目名稱",@"材料規格",@"單位",@"數量",@"單價",@"總價"],@[@"01",@"標準H型鋼",@"HW 100*100*6*8",@"個",@"10",@"130,000",@"1,200,000"], @[@"02",@"等邊矩形管",@"25*1.20",@"個",@"10",@"10,000",@"56,656"]];
    dataContents = [[NSMutableArray alloc] init];
    [dataContents addObjectsFromArray: temp];

//    self.tableView.allowsSelection=NO;
    [self setExtraCellLineHidden:self.tableView];
    [self.tableView setSeparatorColor:[UIColor clearColor]];
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
    return CanvasHeight(80);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* label = [self createLabel:@"信源鋼結構工程有限公司\n工程報價單"];
    label.numberOfLines = 0;
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
            [tf.layer setBorderWidth:0.5];
        }
    }
    // Configure the cell...
    return cell;
}

// ----------------------- Delete Begin -----------------------
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    if (row == 0)
    {
        return nil;
    }
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
-(UILabel*) createLabel: (NSString*)title
{
    UILabel *label=[[UILabel alloc]init];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:CanvasFontSize(30)];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    label.backgroundColor = [UIColor whiteColor];
//    [[label layer] setBorderWidth:widthsize];
    return label;
}


- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - Table view delegate


@end
