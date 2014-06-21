//
//  Stores.h
//  Boba
//
//  Created by Danny Huang on 6/20/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Stores : NSObject

/**
 *  the name of the store
 */
@property (nonatomic) NSString *storeName;

/**
 *  the id of the store
 */
@property (nonatomic) NSString *storeId;

/**
 *  the hours of the store
 */
@property (nonatomic) NSArray *storeHours;

/**
 *  the coordinate of the store
 */
@property (nonatomic) CLLocationCoordinate2D storeLocation;

/**
 *  the list of produdcts this store has
 */
@property (nonatomic) NSArray *storeProducts;

/**
 *  the phone number of the store
 */
@property (nonatomic) NSString *storePhoneNumber;


/**
 *  a method to get if the store is open right now
 */

- (BOOL)isOpen;

@end
