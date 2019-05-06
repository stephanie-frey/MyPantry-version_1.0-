//
//  TableViewCell.m
//  MyPantry(version_1.0)
//
//  Created by Stephanie Frey on 5/5/19.
//  Copyright © 2019 Stephanie Frey. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell


@synthesize title = _title;
@synthesize used = _used;
@synthesize missed = _missed;
@synthesize img = _img;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
