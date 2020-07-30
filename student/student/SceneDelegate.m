//
//  SceneDelegate.m
//  student
//
//  Created by 房彤 on 2020/7/28.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "SceneDelegate.h"
#import "LoginViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    _window = [[UIWindow alloc] initWithWindowScene:scene];
    //显示window
    [_window makeKeyAndVisible];
    UIViewController *open = [[UIViewController alloc] init];
    _window.rootViewController = open;
    UIImageView *openImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bz.jpg"]];
    openImageView.frame = self.window.frame;
    [open.view addSubview:openImageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 374, 80)];
    label.text = @"From 房彤";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:70];
    label.textColor = [UIColor whiteColor];
    [open.view addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 270, 374, 200)];
    label1.text = @"学生管理系统";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:40];
    label1.textColor = [UIColor whiteColor];
    [open.view addSubview:label1];
    
    [self performSelector:@selector(nextView) withObject:self afterDelay:2];
    
    
}

- (void)nextView {
    LoginViewController *login = [[LoginViewController alloc] init];
    _window.rootViewController = login;
    
    //添加一个缩放效果
        login.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
        [UIView animateWithDuration:0.1 animations:^{
            login.view.transform = CGAffineTransformIdentity;
        }];

}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
