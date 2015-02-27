//
//  AppRepository.h
//  MeusApps
//
//  Created by Guilherme Bayma on 2/26/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppRepository : NSObject

@property NSMutableArray *name;
@property NSMutableArray *category;
@property NSMutableArray *image;
@property NSMutableArray *appDescription;
+ (instancetype)sharedInstance;

@end
