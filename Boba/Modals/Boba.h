//
//  Boba.h
//  Boba
//
//  Created by Danny Huang on 6/20/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boba : NSObject

/**
 *  the name of the boba
 */
@property (nonatomic) NSString *bobaName;

/**
 *  the id of boba
 */
@property (nonatomic) NSString *bobaId;
/**
 *  the price of the boba
 */
@property (nonatomic) NSString *bobaPrice;
/**
 *  the type of boba
 */
@property (nonatomic) NSString *bobaType;

@end
