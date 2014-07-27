#!/usr/bin/env python
import hipchat
import sys

token=sys.argv[1]
room=sys.argv[2]
application=sys.argv[3]
user=sys.argv[4]
domain=sys.argv[5]
message="Application %s (%s) deployed by %s" % (application, domain, user)
hipster = hipchat.HipChat(token=token)
hipster.message_room(room, 'Opsworks', message, color='purple', notify=true)
