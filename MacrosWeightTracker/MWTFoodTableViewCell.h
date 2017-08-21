//
//  MWTFoodTableViewCell.h
//  MacrosWeightTracker
//
//  Created by Yangzi He on 3/20/17.
//  Copyright © 2017 Yangzi He. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWTFoodTableViewCell : UITableViewCell
@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *calorieLabel;
@property (nonatomic) IBOutlet UILabel *macrosLabel;
@end
