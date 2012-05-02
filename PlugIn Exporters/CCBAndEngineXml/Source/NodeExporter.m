//
//  NodeExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/30/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "NodeExporter.h"

@implementation NodeExporter

- (void) exportNode:(NSString *)pNodeName withNode:(NSDictionary *)pNode withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [pXMLWriter writeStartElement:pNodeName];
    
    NSArray * properties = [pNode objectForKey:CCB_PROPERTIES];
    [self exportNodeProperties:pNode withProperties:properties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    
    [pCCBXAndEngineXml exportNodes:[pNode objectForKey:CCB_CHILDREN] withXMLWriter:pXMLWriter];
    
    [pXMLWriter writeEndElement];
}

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override '%@' in a subclass!", NSStringFromSelector(_cmd)];
}

- (id) findProperty:(NSString *)pProperty withProperties:(NSArray *)pProperties
{
    for(NSDictionary * property in pProperties) {
        if([[property objectForKey:CCB_PROPERTIES_PROPERTY_NAME] isEqualToString:pProperty]) {
            return [property objectForKey:CCB_PROPERTIES_PROPERTY_VALUE];
        }
    }
    [NSException raise:NSInternalInconsistencyException format:@"Could not find attribute: '%@'!", pProperty];
    return nil;
}

- (id) findProperty:(NSString *)pProperty withProperties:(NSArray *)pProperties withIndex:(int)pIndex
{
    NSArray * array = [self findProperty:pProperty withProperties:pProperties];
    return [array objectAtIndex:pIndex];
}

- (NSString *)convertPositionTypeValueToPositionType:(int)pPositionTypeValue
{
    switch(pPositionTypeValue) {
        case CCB_POSITION_TYPE_RELATIVE_BOTTOMLEFT:
            return CCBAEX_POSITION_TYPE_RELATIVE_BOTTOMLEFT;
        case CCB_POSITION_TYPE_RELATIVE_TOPLEFT:
            return CCBAEX_POSITION_TYPE_RELATIVE_TOPLEFT;
        case CCB_POSITION_TYPE_RELATIVE_TOPRIGHT:
            return CCBAEX_POSITION_TYPE_RELATIVE_TOPRIGHT;
        case CCB_POSITION_TYPE_RELATIVE_BOTTOMRIGHT:
            return CCBAEX_POSITION_TYPE_RELATIVE_BOTTOMRIGHT;
        case CCB_POSITION_TYPE_PERCENT_PARENT:
            return CCBAEX_POSITION_TYPE_PERCENT_PARENT;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Illegal parameter: '%d'!", pPositionTypeValue];
            return nil;
    }
}

- (NSString *)convertSizeTypeValueToSizeType:(int)pSizeTypeValue
{
    switch(pSizeTypeValue) {
        case CCB_SIZE_TYPE_ABSOLUTE:
            return CCBAEX_SIZE_TYPE_ABSOLUTE;
        case CCB_SIZE_TYPE_PERCENT_PARENT:
            return CCBAEX_SIZE_TYPE_PERCENT_PARENT;
        case CCB_SIZE_TYPE_RELATIVE_PARENT:
            return CCBAEX_SIZE_TYPE_RELATIVE_PARENT;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Illegal parameter: '%d'!", pSizeTypeValue];
            return nil;
    }
}

@end
