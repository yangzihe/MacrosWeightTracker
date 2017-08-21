//
//  MWTFoodDetailViewController.m
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import "MWTFoodDetailViewController.h"
#import "MWTFood.h"

int const kMWTCaloriesPerGramOfCarb = 4;
int const kMWTCaloriesPerGramOfProtein = 4;
int const kMWTCaloriesPerGramOfFat = 9;

@interface MWTFoodDetailViewController ()

@property (nonatomic) IBOutlet UITextField *foodName;
@property (nonatomic) IBOutlet UITextField *servingNumberField;
@property (nonatomic) IBOutlet UITextField *carbGramsField;
@property (nonatomic) IBOutlet UITextField *proteinGramsField;
@property (nonatomic) IBOutlet UITextField *fatGramsField;

@property (nonatomic) double servings;
@property (nonatomic) int carbGrams;
@property (nonatomic) int proteinGrams;
@property (nonatomic) int fatGrams;

@end

@implementation MWTFoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:88.0/255.0 green:100.0/255.0 blue:104.0/255.0 alpha:1]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Editing an existing food
    if (self.food != nil) {
        [self.foodName setText:self.food.name];
        [self.servingNumberField setText:[NSString stringWithFormat:@"%.01f", self.food.servingNumber]];
        [self.carbGramsField setText:[NSString stringWithFormat:@"%d", self.food.carbGrams]];
        [self.proteinGramsField setText:[NSString stringWithFormat:@"%d", self.food.proteinGrams]];
        [self.fatGramsField setText:[NSString stringWithFormat:@"%d", self.food.fatGrams]];

        self.servings = self.food.servingNumber;
        self.carbGrams = self.food.carbGrams;
        self.proteinGrams = self.food.proteinGrams;
        self.fatGrams = self.food.fatGrams;
    }
}

// To-do: Show an error message if we try to save a food with invalid fields
- (IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"saveFood"]) {
        // If we're editing an existing food, save the current text field values, otherwise create the food
        if (self.food != nil) {
            [self updateFood];
        } else {
            self.food = [[MWTFood alloc] initWithName:self.foodName.text
                                          calories:[self calculateTotalCalories]
                                     servingNumber:self.servings
                                         carbGrams:self.carbGrams
                                      proteinGrams:self.proteinGrams
                                          fatGrams:self.fatGrams
                                    totalCarbGrams:(int) self.servings * self.carbGrams
                                 totalProteinGrams:(int) self.servings * self.proteinGrams
                                     totalFatGrams:(int) self.servings * self.fatGrams];
        }
    }
}

- (void)updateFood {
    self.food.name = self.foodName.text;
    self.food.calories = [self calculateTotalCalories];
    self.food.servingNumber = self.servings;
    self.food.carbGrams = self.carbGrams;
    self.food.proteinGrams = self.proteinGrams;
    self.food.fatGrams = self.fatGrams;
    self.food.totalCarbGrams = (int) self.servings * self.carbGrams;
    self.food.totalProteinGrams = (int) self.servings * self.proteinGrams;
    self.food.totalFatGrams = (int) self.servings * self.fatGrams;
}

#pragma mark - TextField Delegate

- (IBAction)servingsFieldEditingChanged:(UITextField *)textField {
    NSNumber *servings = [self.numberFormatter numberFromString:textField.text];
    NSLog(@"NSNumber: %@", servings);
    if (servings != nil) {
        self.servings = servings.doubleValue;
        NSLog(@"Servings: %f", self.servings);
    }
}

- (IBAction)carbGramsFieldEditingChanged:(UITextField *)textField {
    NSNumber *carbGrams = [self.numberFormatter numberFromString:textField.text];
    if (carbGrams != nil) {
        self.carbGrams = carbGrams.intValue;
    }
}

- (IBAction)proteinGramsFieldEditingChanged:(UITextField *)textField {
    NSNumber *proteinGrams = [self.numberFormatter numberFromString:textField.text];
    if (proteinGrams != nil) {
        self.proteinGrams = proteinGrams.intValue;
    }
}

- (IBAction)fatGramsFieldEditingChanged:(UITextField *)textField {
    NSNumber *fatGrams = [self.numberFormatter numberFromString:textField.text];
    if (fatGrams != nil) {
        self.fatGrams = fatGrams.intValue;
    }
}

#pragma mark - Calorie Calculations

- (int)calculateTotalCarbCalories {
    return self.servings * self.carbGrams * kMWTCaloriesPerGramOfCarb;
}

- (int)calculateTotalProteinCalories {
    return self.servings * self.proteinGrams * kMWTCaloriesPerGramOfProtein;
}

- (int)calculateTotalFatCalories {
    return self.servings * self.fatGrams * kMWTCaloriesPerGramOfFat;
}

- (int)calculateTotalCalories {
    return [self calculateTotalCarbCalories] + [self calculateTotalProteinCalories] + [self calculateTotalFatCalories];
}

#pragma mark - Misc

- (NSNumberFormatter *)numberFormatter {
    static NSNumberFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.roundingMode = NSNumberFormatterRoundHalfUp;
        formatter.minimumFractionDigits = 0;
        formatter.maximumFractionDigits = 1;
    }
    return formatter;
}

@end
