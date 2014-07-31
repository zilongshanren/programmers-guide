#!/usr/bin/env python
#coding=utf-8

import os
import traceback
from optparse import OptionParser

def main():
    usage = "usage: %prog [options] arg"
    parser = OptionParser(usage)
    (options, args) = parser.parse_args()

    # TODO: support pass cocos root from args
    # if len(args) != 1:
    #     parser.error('Please specify cocos path')

    # check if cocos2d-x exists
    cocos_console_root = os.environ.get('COCOS_CONSOLE_ROOT')
    if cocos_console_root is not None:
        cocos_root = cocos_console_root
        cocos_root = cocos_root.replace('/tools/cocos2d-console/bin','')

    if cocos_root is None:
        print('Failed to find cocos2d-x root')
        sys.exit(1)

    # create symbolic link to cocos2d-x
    os.symlink(cocos_root, 'cocos2d')

if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        traceback.print_exc()
        sys.exit(1)
