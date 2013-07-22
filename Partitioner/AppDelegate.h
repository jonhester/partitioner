//
//  AppDelegate.h
//  Partitioner
//
//  Created by Jon Hester on 11/11/12.
//  Copyright (c) 2012 Jon Hester. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSScrollView *code;
@property (weak) IBOutlet NSTextField *mount;
@property (unsafe_unretained) IBOutlet NSTextView *output;
@property (weak) IBOutlet NSTextField *numPartitions;
@property (weak) IBOutlet NSTextField *size;
@property (weak) IBOutlet NSTextField *namingScheme;
@property (weak) IBOutlet NSTextField *namingScheme2;
@property (weak) IBOutlet NSTextField *namingSchemeTriage;
@property (weak) IBOutlet NSTextField *numTriages;
@property (weak) IBOutlet NSTextField *sizeTriage;
@property (weak) IBOutlet NSTextField *sizeEFI;

- (IBAction)generate:(id)sender;
- (IBAction)clip:(id)sender;
- (IBAction)runTerm:(id)sender;

@end
