//
//  CCBFile.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCBFileExporter.h"
#import "CCBXAndEngineXml.h"

@implementation CCBFileExporter

- (id) init
{
    return [super initWithNodeName:CCB_CCBFILE_CLASS_NAME];
}

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCBFileProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCBFileProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
    NSString * ccbFile = [self findProperty:CCB_CCBFILE_PROPERTY_CCBFILE withProperties:pProperties];

    NSString * ccbFileName = [ccbFile stringByReplacingOccurrencesOfString:[@"." stringByAppendingString:CCB_FILE_EXTENSION] withString:[@"." stringByAppendingString:CCBAEX_FILE_EXTENSION]];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCBFILE_ATTRIBUTE_CCBFILENAME value:ccbFileName];
}

@end
