//
//  ViewController.h
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWTFoodTableViewCell.h"
@class MWTFoodStore;

@interface MWTDailyMealViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) MWTFoodStore *foodStore;
@end

