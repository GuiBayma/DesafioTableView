//
//  AppTableViewController.m
//  MeusApps
//
//  Created by Guilherme Bayma on 2/26/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

#import "AppTableViewController.h"

@interface AppTableViewController ()

@end

@implementation AppTableViewController

AppRepository *dados;

- (void)viewDidLoad {
    [super viewDidLoad];
    dados = [AppRepository sharedInstance];
    //self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0);
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dados.name count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeusAppsDetail" forIndexPath:indexPath];
    NSString *name = [dados.name objectAtIndex:[indexPath row]];
    NSString *category = [dados.category objectAtIndex:[indexPath row]];
    NSString *image = [dados.image objectAtIndex:[indexPath row]];
    
    [[cell appName] setText:name];
    [[cell appCategory] setText:category];
    [[cell appImage] setImage:[UIImage imageNamed:image]];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dados.name removeObjectAtIndex:[indexPath row]];
        [dados.category removeObjectAtIndex:[indexPath row]];
        [dados.appDescription removeObjectAtIndex:[indexPath row]];
        [dados.image removeObjectAtIndex:[indexPath row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSString *nameToMove = [dados.name objectAtIndex:fromIndexPath.row];
    NSString *categoryToMove = [dados.category objectAtIndex:fromIndexPath.row];
    NSString *descriptionToMove = [dados.appDescription objectAtIndex:fromIndexPath.row];
    NSString *imageToMove = [dados.image objectAtIndex:fromIndexPath.row];
    
    [dados.name removeObjectAtIndex:fromIndexPath.row];
    [dados.name insertObject:nameToMove atIndex:toIndexPath.row];
    
    [dados.category removeObjectAtIndex:fromIndexPath.row];
    [dados.category insertObject:categoryToMove atIndex:toIndexPath.row];
    
    [dados.appDescription removeObjectAtIndex:fromIndexPath.row];
    [dados.appDescription insertObject:descriptionToMove atIndex:toIndexPath.row];
    
    [dados.image removeObjectAtIndex:fromIndexPath.row];
    [dados.image insertObject:imageToMove atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AppsDetail"])
    {
        DescriptionViewController *detailViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        detailViewController.AppDetail =
        @[[dados.name objectAtIndex:[myIndexPath row]],
          [dados.category objectAtIndex:[myIndexPath row]],
          [dados.appDescription objectAtIndex:[myIndexPath row]],
          [dados.image objectAtIndex:[myIndexPath row]]];
    }
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
//    return head;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 50.0;
//}

@end
