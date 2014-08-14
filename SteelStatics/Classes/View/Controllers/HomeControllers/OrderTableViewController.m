#import "OrderTableViewController.h"
#import "AppInterface.h"


#define REUSEIDENTIFIER @"reuseIdentifier"

@implementation OrderTableViewController

@synthesize dataContents;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [GestureHelper addGestureToView: self.view];
    NSArray* temp = @[@[@"01",@"02",@"03"], @[@"11",@"12",@"13"], @[@"21",@"22",@"23"]];
    dataContents = [[NSMutableArray alloc] init];
    [dataContents addObjectsFromArray: temp];
    
    [self.tableView registerClass:[OrderTableViewCell class] forCellReuseIdentifier: REUSEIDENTIFIER];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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



#pragma mark - Table view delegate


@end
