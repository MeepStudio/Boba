//
//  Order.h
//  Boba
//
//  Created by Danny Huang on 6/20/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

/**
 *  the current list of order,
    this is an array of dictionaries
 */
@property (nonatomic) NSArray *listOfOrders;

@end
