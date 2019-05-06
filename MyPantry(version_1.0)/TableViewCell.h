//
//  TableViewCell.h
//  MyPantry(version_1.0)
//
//  Created by Stephanie Frey on 5/5/19.
//  Copyright © 2019 Stephanie Frey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *used;
@property (weak, nonatomic) IBOutlet UILabel *missed;


@end

NS_ASSUME_NONNULL_END
