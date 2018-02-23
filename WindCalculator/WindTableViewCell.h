//
//  WindTableViewCell.h
//  WindCalculator
//
//  Created by Tobias Timm on 2018-02-22.
//  Copyright © 2018 Tobias Timm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WindTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *windPerRing;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *midLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;

@end
