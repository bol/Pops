#include <cstdio>

/*
 * Headers for third part libraries
 */
#include "RakPeerInterface.h"

/*
 * Local libraries
 */
#include "PopsConfig.h"

#define SERVER_PORT 12345

int main (void) {
		printf("Version %d.%d\n", POPS_VERSION_MAJOR, POPS_VERSION_MINOR);

		RakNet::RakPeerInterface *peer = RakNet::RakPeerInterface::GetInstance();

		peer->Startup(1, &RakNet::SocketDescriptor(SERVER_PORT,0), 1);

		RakNet::RakPeerInterface::DestroyInstance(peer);

		return 0;
}
