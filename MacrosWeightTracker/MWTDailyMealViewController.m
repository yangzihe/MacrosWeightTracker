//
//  ViewController.m
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import "MWTDailyMealViewController.h"
#import "MWTFoodDetailViewController.h"
#import "MWTFoodStore.h"
#import "MWTFood.h"

@interface MWTDailyMealViewController ()

@end

@implementation MWTDailyMealViewController

#pragma mark - Table View Data Source and Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foodStore.allFoods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MWTFoodTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FoodCell" forIndexPath:indexPath];

    MWTFood *food = self.foodStore.allFoods[indexPath.row];

    cell.nameLabel.text = food.name;
    cell.calorieLabel.text = [NSString stringWithFormat:@"%d cal", food.calories];
    cell.macrosLabel.text = [NSString stringWithFormat:@"%dC %dP %dF", food.totalCarbGrams, food.totalProteinGrams, food.totalFatGrams];

    return cell;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:88.0/255.0 green:100.0/255.0 blue:104.0/255.0 alpha:1]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - View Controller Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"editFood"]) {
        // Figure out which row was just tapped
        NSInteger row = [self.tableView indexPathForSelectedRow].row;

        // Get item at the row and pass it to the food detail view controller
        MWTFood *selectedFood = [self.foodStore.allFoods objectAtIndex:row];
        MWTFoodDetailViewController *foodDetailVC = (MWTFoodDetailViewController *) segue.destinationViewController;
        foodDetailVC.food = selectedFood;
    }
}

- (IBAction)unwindToDailyMenus:(UIStoryboardSegue *)unwindSegue {
    MWTFoodDetailViewController *foodDetailViewController = (MWTFoodDetailViewController *)unwindSegue.sourceViewController;
    MWTFood *newFood = foodDetailViewController.food;

    // If the UIDs are equal, that means newFood already exists within our foodStore, and it was just being updated
    for (MWTFood *food in [self.foodStore allFoods]) {
        if ([newFood.uid isEqualToString:food.uid]) {
            return;
        }
    }
    
    [self.foodStore addFood:newFood];
    NSInteger foodIndex = [[self.foodStore allFoods] indexOfObject:newFood];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:foodIndex inSection:0];

    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
