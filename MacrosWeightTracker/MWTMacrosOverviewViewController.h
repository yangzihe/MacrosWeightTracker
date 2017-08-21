//
//  MWTMacrosOverviewViewController.h
//  MacrosWeightTracker
//
//  Created by Yangzi He on 7/22/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MWTFoodStore;
@class UICountingLabel;

@interface MWTMacrosOverviewViewController : UIViewController

@property IBOutlet UICountingLabel *carbsLeftLabel;
@property IBOutlet UICountingLabel *proteinLeftLabel;
@property IBOutlet UICountingLabel *fatLeftLabel;
@property IBOutlet UICountingLabel *caloriesLeftLabel;

@property (nonatomic) int carbsLeft;
@property (nonatomic) int proteinLeft;
@property (nonatomic) int fatLeft;
@property (nonatomic) int caloriesLeft;

@property (nonatomic) MWTFoodStore *foodStore;

@end
