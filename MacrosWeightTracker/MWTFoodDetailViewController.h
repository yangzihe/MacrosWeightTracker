//
//  MWTFoodDetailViewController.h
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import "UIKit/UIKit.h"
@class MWTFood;

extern int const kMWTCaloriesPerGramOfCarb;
extern int const kMWTCaloriesPerGramOfProtein;
extern int const kMWTCaloriesPerGramOfFat;

@interface MWTFoodDetailViewController : UITableViewController <UITextFieldDelegate>
@property (nonatomic) MWTFood *food;
@end
