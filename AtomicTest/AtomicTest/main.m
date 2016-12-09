//
//  main.m
//  AtomicTest
//
//  Created by chongyang on 16/12/1.
//  Copyright © 2016年 Chongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncTest : NSObject//copy
@property(atomic,assign) NSInteger x;
//@property(atomic,strong) NSString* y;
-(void) testOpearationAsyncFunc;
@end


@implementation AsyncTest

-(void) testOpearationAsyncFunc{
    
    _x = 0;
//    
//    _y = @"";
//    NSArray<NSString*>* strArray = [[NSArray alloc]initWithObjects:@"11111",@"22222",@"33333",@"44444",@"55555",@"66666",@"77777",@"88888", nil];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    queue.maxConcurrentOperationCount = 1;
    
    for (NSInteger i = 0 ;i <= 500; i++) {
        
        NSBlockOperation* opearation = [[NSBlockOperation alloc]init];
        
        [opearation addExecutionBlock:^{
            
            NSLog(@"%ld - %@", (long)_x, [NSThread currentThread]);
            _x++;
//            _y = strArray[i % strArray.count];
        }];
//        if (queue.operations.count > 0){
//            [opearation addDependency:queue.operations.lastObject];
//        }
        [queue addOperation:opearation];
    }
    
    [queue waitUntilAllOperationsAreFinished];
}
@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        AsyncTest* test = [[AsyncTest alloc]init];
        
        [test testOpearationAsyncFunc];
        
        NSLog(@"Hello, World!");
    }
    return 0;
}



