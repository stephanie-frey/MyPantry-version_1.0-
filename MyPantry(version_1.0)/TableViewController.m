//
//  TableViewController.m
//  MyPantry(version_1.0)
//
//  Created by Stephanie Frey on 4/10/19.
//  Copyright © 2019 Stephanie Frey. All rights reserved.
//
#import "ViewController.h"
#import "TableViewController.h"
#import  <UNIRest.h>



@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController start2];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return recipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = recipes[indexPath.row];
    
    NSString *str = @"Used Ingredients: ";
    str = [str stringByAppendingPathComponent:used[indexPath.row]];
    str = [str stringByAppendingString:@"\tMissed Ingredients: "];
    str = [str stringByAppendingPathComponent:missed[indexPath.row]];
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@""];
    cell.detailTextLabel.text = str;
    
    cell.imageView.image = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString: images[indexPath.row]]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    myIndex = indexPath.row;
    
    //[ViewController start2];
    [self performSegueWithIdentifier:@"segue" sender:self];
    
}
    

@end
