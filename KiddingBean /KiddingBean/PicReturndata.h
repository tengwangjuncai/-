#import "JSONModel.h"

@protocol PicReturndata <NSObject>
@end

@interface PicReturndata : JSONModel
@property (nonatomic, copy) NSString <Optional> * location;
@property (nonatomic, copy) NSString <Optional> * height;
@property (nonatomic, copy) NSString <Optional> * image_id;
@property (nonatomic, copy) NSString <Optional> * width;
@property (nonatomic, copy) NSString <Optional> * img05;
@property (nonatomic, copy) NSString <Optional> * webp;
@property (nonatomic, copy) NSString <Optional> * total_tucao;
@property (nonatomic, copy) NSString <Optional> * svol;
@property (nonatomic, copy) NSString <Optional> * img50;
@end