//
//  AppRepository.m
//  MeusApps
//
//  Created by Guilherme Bayma on 2/26/15.
//  Copyright (c) 2015 Guilherme Bayma. All rights reserved.
//

#import "AppRepository.h"

@implementation AppRepository

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken = 0;
    __strong static AppRepository *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        _name = [[NSMutableArray alloc] init];
        _category = [[NSMutableArray alloc] init];
        _image = [[NSMutableArray alloc] init];
        _appDescription = [[NSMutableArray alloc] init];
        
        [_name addObject:@"NetFlix"];
        [_name addObject:@"Waze"];
        [_name addObject:@"Facebook"];
        
        [_category addObject:@"Videos"];
        [_category addObject:@"Navegaçāo"];
        [_category addObject:@"Social"];
        
        [_image addObject:@"netflix.png"];
        [_image addObject:@"waze.png"];
        [_image addObject:@"facebook.png"];
        
        [_appDescription addObject:@"Filmes filmes filmes e filmes"];
        [_appDescription addObject:@"Waze é o maior aplicativo de navegação e trânsito do mundo baseado em uma comunidade."];
        [_appDescription addObject:@"Rede Social quem permite você interagir com seus amigos e familiares da melhor forma possível"];
        
    }
    return self;
}


@end