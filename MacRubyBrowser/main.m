//
//  main.m
//  MacRubyBrowser
//
//  Created by Brian Sam-Bodden on 4/4/11.
//  Copyright 2011 Integrallis Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
