//
//  CCLabelTTFExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/02/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLocalizedLabelTTFExporter.h"

@implementation CCLocalizedLabelTTFExporter

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCLocalizedLabelTTFProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCLocalizedLabelTTFProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
    /* Nothing. */
}

@end
