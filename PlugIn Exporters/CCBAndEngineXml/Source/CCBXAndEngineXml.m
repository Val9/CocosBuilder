//
//  CCBXAndEngineXml.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/27/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCBXAndEngineXml.h"
#import "XMLWriter.h"

#import "CCBFileExporter.h"
#import "CCNodeExporter.h"
#import "CCSpriteExporter.h"
#import "CCScale9SpriteExporter.h"
#import "CCLabelBMFontExporter.h"
#import "CCLabelTTFExporter.h"
#import "CCLayerExporter.h"
#import "CCLayerColorExporter.h"
#import "CCLayerGradientExporter.h"

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
    XMLWriter * xmlWriter = [[XMLWriter alloc] init];

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

    /* End document root tag. */
    [xmlWriter writeEndElement];

    /* Get the XML result as a NSString. */
    NSString * xml = [xmlWriter toString];

    /* Convert xml to NSData. */
    NSData * result = [xml dataUsingEncoding:NSUTF8StringEncoding];

    /* Cleanup. */
    [xmlWriter release];

    /* Return result. */
    return result;
}

- (void) exportNodes:(NSArray *)pNodes withXMLWriter:(XMLWriter *)pXMLWriter
{
    if(pNodes) {
        for(NSDictionary * node in pNodes) {
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

    NodeExporter * nodeExporter = [self getNodeExporterFromClassName:className];
    if(nodeExporter) {
        [nodeExporter exportNode:pNode withXMLWriter:pXMLWriter withCCBXAndEngineXml:self];
    }
}

- (NodeExporter *) getNodeExporterFromClassName:(NSString *)pClassName
{
    if([pClassName isEqualToString:CCB_CCBFILE_CLASS_NAME]) {
        return [[[CCBFileExporter alloc] init] autorelease];                       
    } else if([pClassName isEqualToString:CCB_CCNODE_CLASS_NAME]) {
        return [[[CCNodeExporter alloc] init] autorelease];                       
    } else if([pClassName isEqualToString:CCB_CCSPRITE_CLASS_NAME]) {
        return [[[CCSpriteExporter alloc] init] autorelease];
    } else if([pClassName isEqualToString:CCB_CCSCALE9SPRITE_CLASS_NAME]) {
        return [[[CCScale9SpriteExporter alloc] init] autorelease];
    } else if([pClassName isEqualToString:CCB_CCLABELBMFONT_CLASS_NAME]) {
        return [[[CCLabelBMFontExporter alloc] init] autorelease];
    } else if([pClassName isEqualToString:CCB_CCLABELTTF_CLASS_NAME]) {
        return [[[CCLabelTTFExporter alloc] init] autorelease];
    } else if([pClassName isEqualToString:CCB_CCLAYER_CLASS_NAME]) {
        return [[[CCLayerExporter alloc] init] autorelease];
    } else if([pClassName isEqualToString:CCB_CCLAYERCOLOR_CLASS_NAME]) {
        return [[[CCLayerColorExporter alloc] init] autorelease];
    } else if([pClassName isEqualToString:CCB_CCLAYERGRADIENT_CLASS_NAME]) {
        return [[[CCLayerGradientExporter alloc] init] autorelease];
    } else {
        [NSException raise:NSInternalInconsistencyException format:@"Unexpected className: '%@'!", pClassName];
        return nil;
    }
}

@end
