//
//  MWTMacrosOverviewViewController.m
//  MacrosWeightTracker
//
//  Created by Yangzi He on 7/22/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import "MWTMacrosOverviewViewController.h"
#import "MWTDailyMealViewController.h"
#import "MWTFoodDetailViewController.h"
#import "UICountingLabel.h"
#import "MWTFoodStore.h"
#import "MWTFood.h"

@interface MWTMacrosOverviewViewController ()

@end

@implementation MWTMacrosOverviewViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _carbsLeft = 171;
        _proteinLeft = 200;
        _fatLeft = 46;
        _caloriesLeft = _carbsLeft * kMWTCaloriesPerGramOfCarb + _proteinLeft * kMWTCaloriesPerGramOfProtein + _fatLeft * kMWTCaloriesPerGramOfFat;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupCountingLabels];
    [self.carbsLeftLabel setText:[NSString stringWithFormat:@"%d", self.carbsLeft]];
    [self.proteinLeftLabel setText:[NSString stringWithFormat:@"%d", self.proteinLeft]];
    [self.fatLeftLabel setText:[NSString stringWithFormat:@"%d", self.fatLeft]];
    [self.caloriesLeftLabel setText:[NSString stringWithFormat:@"%d", self.caloriesLeft]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Animate the labels increasing/decreasing
    self.carbsLeft -= [self carbsConsumed];
    self.proteinLeft -= [self proteinConsumed];
    self.fatLeft -= [self fatConsumed];
    self.caloriesLeft -= [self caloriesConsumed];
    [self markExistingFoods];
    [self.carbsLeftLabel countFromCurrentValueTo:(CGFloat) self.carbsLeft];
    [self.proteinLeftLabel countFromCurrentValueTo:(CGFloat) self.proteinLeft];
    [self.fatLeftLabel countFromCurrentValueTo:(CGFloat) self.fatLeft];
    [self.caloriesLeftLabel countFromCurrentValueTo:(CGFloat) self.caloriesLeft];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupCountingLabels {
    self.carbsLeftLabel.format = @"%d";
    self.proteinLeftLabel.format = @"%d";
    self.fatLeftLabel.format = @"%d";
    self.caloriesLeftLabel.format = @"%d";

    self.carbsLeftLabel.method = UILabelCountingMethodEaseIn;
    self.proteinLeftLabel.method = UILabelCountingMethodEaseIn;
    self.fatLeftLabel.method = UILabelCountingMethodEaseIn;
    self.caloriesLeftLabel.method = UILabelCountingMethodEaseIn;
}

- (int)carbsConsumed {
    int carbsConsumed = 0;
    for (MWTFood *food in self.foodStore.allFoods) {
        if (!food.seen) {
            carbsConsumed += food.totalCarbGrams;
        }
    }
    return carbsConsumed;
}

- (int)proteinConsumed {
    int proteinConsumed = 0;
    for (MWTFood *food in [self.foodStore allFoods]) {
        if (!food.seen) {
            proteinConsumed += food.totalProteinGrams;
        }
    }
    return proteinConsumed;
}

- (int)fatConsumed {
    int fatConsumed = 0;
    for (MWTFood *food in [self.foodStore allFoods]) {
        if (!food.seen) {
            fatConsumed += food.totalFatGrams;
        }
    }
    return fatConsumed;
}

- (int)caloriesConsumed {
    int caloriesConsumed = 0;
    for (MWTFood *food in [self.foodStore allFoods]) {
        if (!food.seen) {
            caloriesConsumed += food.calories;
        }
    }
    return caloriesConsumed;
}

- (void)markExistingFoods {
    for (MWTFood *food in [self.foodStore allFoods]) {
        food.seen = YES;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"displayMeals"]) {
        UINavigationController *mealNavigationController = (UINavigationController *) [segue destinationViewController];
        [mealNavigationController.navigationBar setTintColor:[UIColor whiteColor]];

        MWTDailyMealViewController *dailyMealVC = (MWTDailyMealViewController *)mealNavigationController.topViewController;
        dailyMealVC.foodStore = self.foodStore;
    }
}


@end
