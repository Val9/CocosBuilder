//
//  CCBFileExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCNodeExporter.h"

#define CCB_CCBFILE_CLASS_NAME @"CCBFile"

#define CCB_CCBFILE_PROPERTY_CCBFILE @"ccbFile"

#define CCBAEX_TAG_CCBFILE_ATTRIBUTE_CCBFILENAME @"ccbFileName"

@interface CCBFileExporter : CCNodeExporter

- (void) exportCCBFileProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
