//
//  CCLayerColorExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLayerExporter.h"

#define CCB_CCLAYERCOLOR_CLASS_NAME @"CCLayerColor"

@interface CCLayerColorExporter : CCLayerExporter

- (void) exportCCLayerColorProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
