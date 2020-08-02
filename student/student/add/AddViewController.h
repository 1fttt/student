//
//  AddViewController.h
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h" 

NS_ASSUME_NONNULL_BEGIN
@class Student;

//声明协议方法
@protocol AddDelegate <NSObject>
- (void)content:(Student *)student;

@end


@interface AddViewController : UIViewController

@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *numTextField;
@property UITextField *scoreTextField;
@property UIButton *sureButton;

@property NSMutableArray *nameArr;
@property NSMutableArray *classArr;
@property NSMutableArray *numArr;
@property NSMutableArray *scoreArr;

@property NSMutableArray *studentArr;

//声明代理属性
@property id <AddDelegate> addDelegate;

//声明block
@property void (^myblock) (Student*);

@end

NS_ASSUME_NONNULL_END
