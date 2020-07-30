//
//  DeleteViewController.h
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@class Student;
//声明协议方法
@protocol DeleteDelegate <NSObject>

- (void)deleteContent:(NSMutableArray *)nameArr andClass:(NSMutableArray *)classArr andNum:(NSMutableArray *)numArr andScore:(NSMutableArray *)scoreArr;

@end
NS_ASSUME_NONNULL_BEGIN

@interface DeleteViewController : UIViewController

@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *numArr;
@property NSMutableArray *scoreArr;

@property UITextField *deleteTextField;
@property UIButton *sureButton;

//声明代理人属性
@property id<DeleteDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
