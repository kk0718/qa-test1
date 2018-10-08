#!/usr/bin/env python

##################################################
#
# This File Generate Test Data for the App Testing
#
###################################################

import datetime
import string
import random


def get_date_time_string():
    return '{date:%Y-%m-%d_%H:%M:%S}'.format( date=datetime.datetime.now())

def get_two_character_string():
    return str(''.join(random.choice(string.ascii_uppercase) for _ in range(2)))


TimeNow = get_date_time_string()
twoCharStr = get_two_character_string()