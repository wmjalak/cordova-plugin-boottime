//
//  CDVBootTime.m
//
//
//

#import "CDVBootTime.h"
#include <sys/sysctl.h>

@implementation CDVBootTime

-(void)get:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{

        struct timeval boottime;
        int mib[2] = {CTL_KERN, KERN_BOOTTIME};
        size_t size = sizeof(boottime);

        struct timeval now;
        struct timezone tz;
        gettimeofday(&now, &tz);

        long long int uptime = -1;

        if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0)
        {
            uptime = ((long long int)(now.tv_sec - boottime.tv_sec)) * 1000;
            uptime += (now.tv_usec - boottime.tv_usec) / 1000;
        }

        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@"%lld", uptime]];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

@end
