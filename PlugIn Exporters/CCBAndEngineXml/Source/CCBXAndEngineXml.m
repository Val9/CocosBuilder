//
//  CCBXAndEngineXml.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/27/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCBXAndEngineXml.h"
#import "XMLWriter.h"
#import "CCNodeExporter.h"
#import "CCSpriteExporter.h"

@implementation CCBXAndEngineXml

- (NSString*) extension
{
    return CCBAEX_FILE_EXTENSION;
}

- (NSData*) exportDocument:(NSDictionary *)pDocument flattenPaths:(BOOL)pFlattenPaths
{
    /* Sanity check for correct document version. */
    int fileVersion = [[pDocument objectForKey:CCB_FILEVERSION] intValue];
    if(fileVersion != CCB_VERSION) {
        /* Raise an exception. */
        [NSException raise:NSInternalInconsistencyException format:@"Supplied document has unsupported version='%d'!", fileVersion];
        return nil;
    }

    /* Allocate XMLWriter. */
    XMLWriter * xmlWriter = [[XMLWriter alloc]init];

    [xmlWriter write:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"];

    /* Write document root tag. */
    [xmlWriter writeStartElement:CCBAEX_TAG_CCB];
    [xmlWriter writeAttribute:CCBAEX_TAG_CCB_ATTRIBUTE_STAGE_WIDTH value:[[pDocument objectForKey:CCB_STAGE_WIDTH] stringValue]];
    [xmlWriter writeAttribute:CCBAEX_TAG_CCB_ATTRIBUTE_STAGE_HEIGHT value:[[pDocument objectForKey:CCB_STAGE_HEIGHT] stringValue]];
    [xmlWriter writeAttribute:CCBAEX_TAG_CCB_ATTRIBUTE_CENTERED_ORIGIN value:[[pDocument objectForKey:CCB_CENTEREDORIGIN] boolValue] ? @"true" : @"false"];
    [xmlWriter writeAttribute:CCBAEX_TAG_CCB_ATTRIBUTE_VERSION value:[[NSNumber numberWithInt:CCBAEX_VERSION] stringValue]];

    /* Traverse the scene graph, starting with the root node. */
    NSDictionary * rootNode = [pDocument objectForKey:CCB_NODEGRAPH];
    if(rootNode) {
        [self exportNode:rootNode withXMLWriter:xmlWriter];
    }

    [xmlWriter writeEndElement];

    /* Get the XML result as a NSString. */
    NSString * xml = [xmlWriter toString];

    /* Return is as NSData. */
    return [xml dataUsingEncoding:NSUTF8StringEncoding];
}

- (void) exportNodes:(NSArray *)pNodes withXMLWriter:(XMLWriter *)pXMLWriter
{
    if(pNodes) {
        for (NSDictionary * node in pNodes) {
            [self exportNode:node withXMLWriter:pXMLWriter];
        }
    }
}

- (void) exportNode:(NSDictionary *)pNode withXMLWriter:(XMLWriter *)pXMLWriter
{
    NSString * baseClass = [pNode objectForKey:CCB_BASECLASS];
    NSString * customClass = [pNode objectForKey:CCB_CUSTOMCLASS];

    /* If there is a custom class, pick it. Otherwise pick the base class. */
    NSString * className;
    if(customClass == nil || [customClass length] == 0) {
        NSLog(@"CCBAndEngineXml: Exporting node: '%@'.", baseClass);
        className = baseClass;
    } else {
        NSLog(@"CCBAndEngineXml: Exporting custom node: '%@'.", customClass);
        className = customClass;
    }

    if([className isEqualToString:CCB_CCNODE_CLASS_NAME]) {
        [[[CCNodeExporter alloc] init] exportNode:pNode withXMLWriter:pXMLWriter withCCBXAndEngineXml:self];
    } else if([className isEqualToString:CCB_CCSPRITE_CLASS_NAME]) {
        [[[CCSpriteExporter alloc] init] exportNode:pNode withXMLWriter:pXMLWriter withCCBXAndEngineXml:self];
    } else {
        [NSException raise:NSInternalInconsistencyException format:@"Unexpected className: '%@'!", className];
    }
}

@end
