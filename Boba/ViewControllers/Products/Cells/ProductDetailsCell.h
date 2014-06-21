//
//  ProductDetailsCell.h
//  Boba
//
//  Created by Danny Huang on 6/20/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailsCell : UITableViewCell

/**
 *  the image of the product
 */
@property (nonatomic) IBOutlet UIImageView *productImage;

/**
 * a label for the product name
 */
@property (nonatomic) IBOutlet UILabel *productName;

/**
 *  a label for the product price
 */
@property (nonatomic) IBOutlet UILabel *productPrice;

@end
