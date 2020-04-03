//
//  AppDelegate.h
//  SegementDemo
//
//  Created by zengyan.bu on 9/24/19.
//  Copyright © 2019 zengyan.bu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, strong)   UIWindow *window;

- (void)saveContext;


@end

