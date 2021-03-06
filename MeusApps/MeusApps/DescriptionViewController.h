//
//  DescriptionViewController.h
//  MeusApps
//
//  Created by Guilherme Bayma on 2/26/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppRepository.h"

@interface DescriptionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UILabel *appCategory;
@property (weak, nonatomic) IBOutlet UILabel *appDescription;
@property (weak, nonatomic) IBOutlet UIImageView *appImage;
@property NSArray *AppDetail;

@end