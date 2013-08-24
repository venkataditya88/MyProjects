//
//  SortingTypeLearnTableViewController.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "SortingTypeLearnTableViewController.h"

@interface SortingTypeLearnTableViewController ()
@property (nonatomic, strong) NSArray *sortingAlgorithms;

@end

@implementation SortingTypeLearnTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sortingAlgorithms = [NSArray arrayWithObjects:@"Insertion Sort",@"Selection Sort", @"Bubble Sort", nil];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if ([segue.identifier isEqualToString:@"SortingLearn"]){
        [segue.destinationViewController setTitle:self.sortingAlgorithms[indexPath.row]];
        [segue.destinationViewController performSelector:@selector(setSortType:) withObject:self.sortingAlgorithms[indexPath.row]];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sortingAlgorithms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SortingLearn";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.sortingAlgorithms objectAtIndex:indexPath.row];
    return cell;
}



@end
