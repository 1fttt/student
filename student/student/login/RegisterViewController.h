//
//  RegisterViewController.h
//  student
//
//  Created by 房彤 on 2020/7/28.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>

//声明协议方法
@protocol PassValueDelegate <NSObject>

- (void)passContent:(NSString *)user andPass:(NSString *)pass;

@end

@interface RegisterViewController : UIViewController

@property UITextField *userTextField;
@property UITextField *passTextField;
@property NSString *userStr;
@property NSString *passStr;
@property UIButton *btn;
//声明代理人属性
@property id<PassValueDelegate> delegate;

@end
